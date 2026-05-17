/**
 * @file ms51_registers.h
 * @brief Minimal MS51 SFR map for SDCC (Nuvoton MS51 series).
 */

#ifndef MS51_REGISTERS_H
#define MS51_REGISTERS_H

#ifdef __SDCC

__sfr __at(0x80) P0;
__sfr __at(0x90) P1;
__sfr __at(0xA0) P2;
__sfr __at(0xB8) P3;

/* Clock / power */
__sfr __at(0x8E) CLKCON;
__sfr __at(0x86) BODCON0;
__sfr __at(0xAA) WDCON;

/* Port mode: PxM1.PxM2 — 00 input, 01 push-pull output */
__sfr __at(0xB1) P0M1;
__sfr __at(0xB2) P0M2;
__sfr __at(0xB3) P1M1;
__sfr __at(0xB4) P1M2;
__sfr __at(0xB5) P2M1;
__sfr __at(0xB6) P2M2;
__sfr __at(0xB9) P3M1;
__sfr __at(0xBA) P3M2;

/* ADC */
__sfr __at(0xE8) ADCCON0;
__sfr __at(0xE9) ADCCON1;
__sfr __at(0xEA) ADCDLY;
__sfr __at(0xEB) ADCCON2;
__sfr __at(0xEC) ADCDL;
__sfr __at(0xED) ADCDH;
__sfr __at(0xCE) AINDIDS;

/* CLKCON bits (MS51 family) */
#define CLKCON_CKSWI_HIRC   0x00
#define CLKCON_HIRC_16M     0x30

/* ADCCON0 */
#define ADCCON0_ADCS        0x80
#define ADCCON0_ADCTRG      0x04
#define ADCCON0_ADCF        0x20

/* BODCON0 */
#define BODCON0_BOVEN       0x80
#define BODCON0_BODRSTEN    0x04

/* WDCON */
#define WDCON_WDCLR         0x80
#define WDCON_WDTEN         0x01

#endif /* __SDCC */

#endif /* MS51_REGISTERS_H */
