# Setup and Design Decisions

## Toolchain

| Item | Choice |
|------|--------|
| MCU | Nuvoton MS51 (MCS-51 core) |
| Compiler | SDCC (`-mmcs51 --model-small --std-sdcc99`) |
| Host tests | GCC C99, `make test` |

## AT-pin field reference (200 Ω shunt, 5 V ADC ref)

| State | Pin voltage | Loop current | ADC counts (approx.) |
|-------|-------------|--------------|----------------------|
| No sensor | 0 V | 0 mA | 0 |
| Target detected | 0.07–0.2 V | 0.3–1 mA | 49–163 |
| Sensor idle | 0.67 V | 3.36 mA | 550 |
| Short circuit | 1.55 V | 8 mA | 1310 |

Thresholds in `namur_thresholds.h` (inverted loop — current drops when target present):

| Macro | µA | ADC |
|-------|-----|-----|
| Lead break | 150 | 24 |
| Latch ON | 1200 | 196 |
| Latch OFF | 2800 | 458 |
| Short | 7000 | 1146 |

## Pin map

| Function | Pin | Notes |
|----------|-----|--------|
| CH1 analog | P1.7 / ADC_CH0 | `NAMUR_ADC_CH1` |
| CH2 analog | P3.0 / ADC_CH1 | `NAMUR_ADC_CH2` |
| CH1 sense LED | P1.0 | |
| CH2 sense LED | P1.1 | |
| CH1 fault LED | P1.2 | |
| CH2 fault LED | P1.3 | |
| CH1 DIP (NO/NC) | P0.0 | active low |
| CH2 DIP (NO/NC) | P0.1 | active low |
| Fault suppress DIP | P0.2 | active low |

## Bring-up

1. Confirm `AINDIDS` and ADC channel mux match P1.7 / P3.0 on your MS51 variant.
2. Validate ADC counts against a known current source at each AT-pin state.
3. Tune `NAMUR_UA_LATCH_ON` / `OFF` if sense/idle margins differ on hardware.
