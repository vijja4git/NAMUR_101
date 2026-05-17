# NAMUR 2-Channel Interface (MS51 / SDCC)

Production-oriented firmware for a dual-channel NAMUR safety sensor interface on the Nuvoton **MS51**, built with **SDCC**.

## Layout

- `include/` — thresholds, BSP timing, pin map
- `src/app/` — hardware-agnostic logic (EMA, debounce, hysteresis, blink)
- `src/bsp/` — MS51 drivers (clock, ADC, GPIO, WDT, BOD)
- `src/main.c` — 20 ms superloop
- `tests/` — host unit tests
- `cursor/` — architecture and planning notes

## Prerequisites

- [SDCC](https://sdcc.sourceforge.net/) with MCS-51 support (`sdcc -v`)
- `packihx` (ships with SDCC)
- GCC for host tests

## Build firmware

```bash
make
```

Outputs:

- `build/namur_firmware.ihx`
- `build/namur_firmware.hex`

## Run host tests

```bash
make test
```

Validates threshold math, state machine, filter, DIP policy, and fault blink timing without hardware.

## Documentation

- `cursor/PLANNING.md` — phased roadmap
- `cursor/CURSOR.md` — call flows and dependencies
- `docs/SETUP_AND_DECISIONS.md` — toolchain and design log
