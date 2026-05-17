# CURSOR — Architecture Map

## Main loop call flow (20 ms)

```
main()
  bsp_init()                    [once]
  loop forever:
    dip  = bsp_read_dip()
    adc1 = bsp_adc_read_channel(CH1)   [timeout → bsp_hardware_failure]
    adc2 = bsp_adc_read_channel(CH2)
    namur_logic_update(&logic, adc1, adc2, dip)
    bsp_led_ch*_sense(logic.ch[].sense_led)
    bsp_led_ch*_fault(logic.ch[].fault_led)
    bsp_clear_wdt()
    bsp_delay_ms(BSP_LOOP_MS)
```

## Per-channel application state machine

```
raw ADC
  → EMA (filtered_adc)
  → classify → instant { LEAD_BREAK | SHORT | NORMAL | HYST }
  → debounce (4 × 20 ms) → stable
  → if DIP3: fault = NONE
    else fault from stable
  → if no fault: hysteresis latch (ON/OFF/hold)
  → sense LED = latch (+ DIP NC invert), off if fault
  → fault LED blink: 1 Hz lead break, 5 Hz short
```

## File dependency graph

```
main.c
  ├── ms51_bsp.h → ms51_bsp.c
  │     ├── ms51_registers.h
  │     ├── bsp_config.h
  │     └── namur_config.h
  ├── namur_logic.h → namur_logic.c
  │     ├── namur_thresholds.h
  │     ├── bsp_config.h
  │     └── namur_config.h
  └── namur_config.h

tests/test_namur_logic.c → namur_logic.c (no BSP)
tests/check_namur_thresholds.c → namur_thresholds.h
```

## Layer rules

| Layer | May include |
|-------|-------------|
| `src/app/` | `include/*.h` only — no SFR / `ms51_*` |
| `src/bsp/` | registers, `bsp_config`, `namur_config` |
| `src/main.c` | app + BSP headers |
