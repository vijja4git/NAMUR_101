# NAMUR 2-Channel Interface — Project Planning & Roadmap

**Target MCU:** Nuvoton MS51 (SDCC toolchain)  
**Loop cadence:** 20 ms deterministic superloop  
**Last updated:** 2026-05-17

---

## 1. Purpose & Scope

Build production-ready firmware for a **2-channel NAMUR safety sensor interface** with:

- Strict layering: application (`src/app/`) never touches hardware registers; BSP (`src/bsp/`) is the sole hardware boundary.
- Host unit tests (`make test`) for application logic without MS51 hardware.
- Signal integrity: EMA low-pass + 4-cycle debounce (80 ms).
- Defensive BSP: ADC poll timeouts, WDT (~100 ms), BOD (4.4 V).
- Field diagnostics: asymmetric fault-LED blink (1 Hz lead break, 5 Hz short).

**Out of scope (v1):** RTOS, Modbus/fieldbus, bootloader, calibration UI, multi-board variants.

---

## 2. Safety & Compliance Posture

| Concern | Mitigation in firmware |
|--------|-------------------------|
| False trip from EMI | EMA filter + debounced state transitions |
| Stuck in ADC wait | Hardware poll timeout → predictable failure path |
| Runaway software | WDT cleared only in main 20 ms loop |
| Brownout corruption | BOD reset below 4.4 V |
| Miswired loop | Lead-break (<150 µA) and short (>6000 µA) detection |
| Maintenance override | DIP3 suppresses faults and forces fault LEDs off |
| Layer coupling risk | App compiled on host; BSP stubbed in tests |

**Validation evidence (DoD):** `make` produces deployable `.hex`; `make test` passes logic/filter/blink cases; design decisions logged in `docs/SETUP_AND_DECISIONS.md`; dependencies in `cursor/CURSOR.md`.

---

## 3. Repository Milestones

| # | Milestone | Exit criteria |
|---|-----------|---------------|
| M0 | Planning & docs skeleton | This file + empty `CURSOR.md` / `SETUP_AND_DECISIONS.md` structure |
| M1 | Configuration headers | `namur_config.h`, `namur_thresholds.h`, `bsp_config.h` compile in isolation |
| M2 | BSP foundation | Clock 16 MHz, GPIO, ADC+timeout, WDT, BOD; `ms51_registers.h` minimal SFRs |
| M3 | Application core | EMA, hysteresis latch, debounce, blink engine; no BSP includes |
| M4 | Integration | `main.c` 20 ms loop, WDT clear, channel/DIP/LED wiring |
| M5 | Host tests | `tests/test_namur_logic.c` + `make test` green |
| M6 | Cross-build | `make` → `.ihx` / `.hex` via SDCC |
| M7 | Documentation closure | `CURSOR.md` dependency graph; `SETUP_AND_DECISIONS.md` filled |

---

## 4. Absolute Step-by-Step Implementation Roadmap

Execute in order. Do not skip validation gates between phases.

### Phase 0 — Repository bootstrap

| Step | Action | Owner / artifact |
|------|--------|------------------|
| 0.1 | Create directory tree per spec (`.`, `cursor/`, `docs/`, `include/`, `src/app/`, `src/bsp/`, `tests/`) | Repo layout |
| 0.2 | Add `README.md` quickstart (SDCC install, `make`, `make test`) | `README.md` |
| 0.3 | Initialize `cursor/CURSOR.md` with placeholder sections: call flows, state machines, dependency graph | `cursor/CURSOR.md` |
| 0.4 | Initialize `docs/SETUP_AND_DECISIONS.md` with toolchain and pin-assignment sections (fill as built) | `docs/SETUP_AND_DECISIONS.md` |
| 0.5 | **Gate:** Tree matches spec; planning docs readable | Review |

### Phase 1 — Electrical & timing configuration (headers only)

| Step | Action | Details |
|------|--------|---------|
| 1.1 | Create `include/namur_thresholds.h` | `VREF_MV=5000`, shunt 500 Ω, ADC max 4095; macro `NAMUR_UA_TO_ADC_COUNTS(ua)` per formula; thresholds: 150, 6000, 1200, 2100 µA |
| 1.2 | Create `include/bsp_config.h` | `LOOP_MS=20`, `DEBOUNCE_CYCLES=4`, EMA alpha shift, `ADC_TIMEOUT_LOOPS=2000`, WDT/BOD symbolic constants |
| 1.3 | Create `include/namur_config.h` | Pin macros: 3× DIP, 4× LED, 2× ADC channels (document net names in SETUP doc) |
| 1.4 | **Gate:** Host `gcc -E` or small compile check on headers; threshold ADC counts sanity-checked by hand (see §5) | No `.c` yet |

### Phase 2 — BSP register map & clock

| Step | Action | Details |
|------|--------|---------|
| 2.1 | Create `src/bsp/ms51_registers.h` | Minimal SDCC `__sfr` / `__sbit` for GPIO, ADC, CLK, WDT, BOD used by drivers only |
| 2.2 | Implement `bsp_init()` in `ms51_bsp.c` | HIRC → 16 MHz; document register sequence in SETUP doc |
| 2.3 | Implement `bsp_configure_bod()` | Trip ~4.4 V, reset on brownout |
| 2.4 | Implement `bsp_configure_wdt()` | ~100 ms timeout; **do not** clear WDT here |
| 2.5 | **Gate:** BSP builds with SDCC; init order documented | `ms51_bsp.c` |

### Phase 3 — BSP peripherals (defensive I/O)

| Step | Action | Details |
|------|--------|---------|
| 3.1 | GPIO init | Inputs: DIP1–3 (pull-ups); outputs: 4 LEDs (default off) |
| 3.2 | `bsp_read_dip()` | Returns packed mode bits (ch1 NC/NO, ch2 NC/NO, fault suppress) |
| 3.3 | `bsp_adc_init()` + `bsp_adc_read_channel(ch)` | 12-bit, Vref 5 V; **poll loop with decrementing timeout**; on timeout → failure routine |
| 3.4 | `bsp_led_set()` / channel helpers | Abstract pin writes |
| 3.5 | `bsp_clear_wdt()` | Exported; documented “main loop only” |
| 3.6 | `bsp_hardware_failure()` | Predictable safe outputs + optional reset path on ADC timeout |
| 3.7 | **Gate:** BSP API stable; header `ms51_bsp.h` (or prototypes in `.c` + doc) lists all app-facing calls | No app logic in BSP |

### Phase 4 — Application layer (hardware-agnostic)

| Step | Action | Details |
|------|--------|---------|
| 4.1 | Define `namur_logic.h` types | Per-channel: raw ADC, filtered value, debounced electrical class, latched ON/OFF, fault type, blink phase |
| 4.2 | Implement EMA | `filtered += (raw - filtered) >> ALPHA_SHIFT` (or equivalent fixed-point) |
| 4.3 | Implement threshold classifier | Map filtered ADC → LEAD_BREAK / SHORT / HYSTERESIS band using `namur_thresholds.h` only |
| 4.4 | Implement hysteresis latch | ON >2100 µA, OFF <1200 µA, else hold |
| 4.5 | Implement debounce | Raw class must match for `DEBOUNCE_CYCLES` consecutive updates before committing |
| 4.6 | Implement DIP output policy | NO: LED follows latch; NC: invert; fault active → sensing LED forced off |
| 4.7 | Implement fault suppression (DIP3) | Clear internal faults; fault LEDs off; skip line fault evaluation |
| 4.8 | Implement asymmetric blink engine | 1 Hz (lead break), 5 Hz (short); tick from 20 ms loop counter |
| 4.9 | `namur_logic_update()` | Single entry: inputs (ADC counts, DIP, dt) → outputs (LED states, fault flags) |
| 4.10 | **Gate:** `namur_logic.c` includes **no** `ms51_*` or SFR headers | Layer isolation |

### Phase 5 — Main superloop integration

| Step | Action | Details |
|------|--------|---------|
| 5.1 | Create `src/main.c` | `bsp_init()` once; forever: read ADC×2, DIP, call `namur_logic_update()`, drive LEDs, `bsp_clear_wdt()`, delay/block to 20 ms |
| 5.2 | Timing discipline | Use BSP timer or cycle-counted delay to hold 20 ms window |
| 5.3 | WDT policy | Clear WDT **once** per loop iteration at end (after logic + outputs) |
| 5.4 | **Gate:** Full firmware links; manual smoke on hardware or simulator if available | `make` |

### Phase 6 — Makefile & cross-build

| Step | Action | Details |
|------|--------|---------|
| 6.1 | SDCC target | `ms51`, sources under `src/`, includes `-I include`, output `.ihx` + `.hex` |
| 6.2 | `make test` target | Native GCC builds `namur_logic.c` + `tests/test_namur_logic.c`; `-DUNIT_TEST` if needed for BSP stubs |
| 6.3 | **Gate:** `make` and `make test` both succeed on CI/host | `Makefile` |

### Phase 7 — Host unit tests

| Step | Action | Test case (minimum) |
|------|--------|---------------------|
| 7.1 | EMA noise rejection | Step + burst noise → filtered stable |
| 7.2 | Hysteresis | Ramp up/down through 1200–2100 µA band → hold behavior |
| 7.3 | Debounce | 1–3 cycle glitch → no state change; 4th → commit |
| 7.4 | Lead break / short | Below 150 / above 6000 µA → fault after debounce |
| 7.5 | DIP NO/NC | Invert sensing LED policy |
| 7.6 | DIP3 suppress | Faults cleared, fault LEDs off |
| 7.7 | Blink timing | 1 Hz vs 5 Hz period counts at 20 ms tick |
| 7.8 | **Gate:** `make test` exit 0 | `tests/test_namur_logic.c` |

### Phase 8 — Documentation closure

| Step | Action | Details |
|------|--------|---------|
| 8.1 | Update `cursor/CURSOR.md` | Main loop call flow; channel state diagram; file dependency graph |
| 8.2 | Update `docs/SETUP_AND_DECISIONS.md` | SDCC flags, MS51 part number, pin table, BOD/WDT register choices, threshold worked example |
| 8.3 | Update `README.md` | Build, flash, test commands |
| 8.4 | **Gate:** DoD checklist (§7) all checked | Release-ready tag optional |

---

## 5. Threshold Sanity Check (compile-time)

Use macro (µA → ADC counts):

$$\text{ADC} = \frac{\mu A \times 500 \times 4095}{5000 \times 1000}$$

| Condition | µA | Approx. ADC counts |
|-----------|-----|-------------------|
| Lead break | 150 | 61 |
| Latch OFF | 1200 | 491 |
| Latch ON | 2100 | 860 |
| Short | 6000 | 2457 |

Implement verification as a compile-time assert or unit test constant check in Phase 7.

---

## 6. State Machine Summary (application)

Per channel (parallel for CH1/CH2):

```
[ADC raw] → EMA → [instant class: FAULT_LOW | FAULT_HIGH | HYST_BAND]
                    ↓ (debounce 4×20ms)
              [stable class]
                    ↓
         fault? → blink profile on FAULT LED; SENSE LED off
         else  → hysteresis latch (ON/OFF/hold)
                    ↓
         apply DIP1/2 (NO/NC) → SENSE LED
```

Global: DIP3 → suppress all faults and fault LEDs.

Document full transitions in `cursor/CURSOR.md` during Phase 8.

---

## 7. Definition of Done Checklist

- [ ] `make` → `.ihx` and `.hex` without errors
- [ ] `make test` → all unit tests pass on host GCC
- [ ] App layer has zero hardware register references
- [ ] ADC reads use timeout; timeout triggers failure routine
- [ ] WDT enabled; cleared only in `main` loop
- [ ] BOD configured for ~4.4 V
- [ ] Thresholds only in `namur_thresholds.h`; timing/filter in `bsp_config.h`
- [ ] `cursor/CURSOR.md` has call flows + dependency graph
- [ ] `docs/SETUP_AND_DECISIONS.md` records toolchain and design decisions
- [ ] `README.md` quickstart complete

---

## 8. Risk Register

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| MS51 SFR map mismatch vs silicon | Med | Build/runtime fault | Cross-check Nuvoton datasheet; minimal register header |
| SDCC vs Keil differences | Med | Subtle bugs | Document chosen compiler flags; avoid non-standard extensions |
| 20 ms loop drift | Med | Blink frequency error | Timer-based tick; test blink counts in unit tests |
| ADC reference tolerance | Low | Threshold drift | Room in hysteresis band; document calibration hook (future) |
| DIP bounce | Low | Wrong mode | Optional DIP debounce in BSP if field issues appear |

---

## 9. Suggested Work Order (single developer)

1. Phase 0 → 1 (headers + sanity math)  
2. Phase 4 before Phase 3 completion is acceptable: **app + unit tests first** (TDD), then BSP, then integrate (Phases 2–3, 5)  
3. Recommended TDD path: **1 → 4 → 7 → 2 → 3 → 5 → 6 → 8**

---

## 10. Next Action

Proceed to **Phase 0.1–0.5**, then **Phase 1** configuration headers, unless prioritizing TDD (**Phase 4 + 7** stubs first).

After each phase, update §7 checklist and append decisions to `docs/SETUP_AND_DECISIONS.md`.
