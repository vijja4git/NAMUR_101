# Setup and Design Decisions

## Toolchain

| Item | Choice |
|------|--------|
| MCU | Nuvoton MS51 (MCS-51 core) |
| Compiler | SDCC (`-mmcs51 --model-small --std-sdcc99`) |
| Host tests | GCC C99, `make test` |

```bash
make          # firmware .ihx / .hex
make test     # logic + threshold checks
```

## Clock & safety peripherals

- **HIRC 16 MHz** via `CLKCON` HIRC trim field (`CLKCON_HIRC_16M`).
- **BOD ~4.4 V**: `BODCON0` enable + reset; level code `0x06` (verify against silicon BOD table on bring-up).
- **WDT ~100 ms**: `WDCON` enable + prescaler nibble `0x05`; cleared only in `main` via `bsp_clear_wdt()`.

## ADC

- 12-bit result: `(ADCDH << 4) | (ADCDL & 0x0F)`.
- End-of-conversion poll with `BSP_ADC_TIMEOUT_LOOPS`; timeout calls `bsp_hardware_failure()` (LEDs off, spin until WDT reset).

## Threshold math (`namur_thresholds.h`)

$$\text{ADC} = \frac{I_{\mu A} \cdot 500 \cdot 4095}{5000 \cdot 1000}$$

| Condition | µA | ADC (integer) |
|-----------|-----|----------------|
| Lead break | 150 | 61 |
| Latch OFF | 1200 | 491 |
| Latch ON | 2100 | 859 |
| Short | 6000 | 2457 |

## Pin map (placeholder — match PCB)

| Function | Port.bit | Net |
|----------|----------|-----|
| DIP CH1 NC | P1.0 | DIP_CH1_MODE |
| DIP CH2 NC | P1.1 | DIP_CH2_MODE |
| DIP fault dis | P1.2 | DIP_FAULT_DIS |
| LED CH1 sense | P2.0 | LED_CH1_SENSE |
| LED CH2 sense | P2.1 | LED_CH2_SENSE |
| LED CH1 fault | P2.2 | LED_CH1_FAULT |
| LED CH2 fault | P2.3 | LED_CH2_FAULT |
| ADC CH1 | AIN0 | NAMUR1_ISENSE |
| ADC CH2 | AIN1 | NAMUR2_ISENSE |

DIP switches: active low with internal pull-up.

## Timing

- Loop: **20 ms** (`BSP_LOOP_MS`)
- Debounce: **4 cycles** → 80 ms
- EMA: `filtered += (raw - filtered) >> 3`
- Blink half-periods: 25 ticks (1 Hz), 5 ticks (5 Hz) at 20 ms

## Bring-up checklist

1. Confirm BOD level code vs measured trip voltage.
2. Calibrate `bsp_delay_ms()` if loop period drifts.
3. Validate ADC counts vs known loop current source.
4. Adjust `namur_config.h` pins to schematic.
