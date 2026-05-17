/**
 * @file namur_config.h
 * @brief Board pin and channel assignments (MS51 GPIO / ADC).
 */

#ifndef NAMUR_CONFIG_H
#define NAMUR_CONFIG_H

#include <stdint.h>

/* --- ADC (hardware channel index for ADCCON0[3:0]) --- */

/** CH1 analog: P1.7 / ADC_CH0. */
#define NAMUR_ADC_CH1                  0U

/** CH2 analog: P3.0 / ADC_CH1. */
#define NAMUR_ADC_CH2                  1U

#define NAMUR_ADC_CHANNEL_COUNT        2U

/* --- DIP switches on P0 (active low, pull-up) --- */

/** P0.0 — CH1 output mode (0=NO, 1=NC). */
#define NAMUR_DIP_CH1_PORT             0U
#define NAMUR_DIP_CH1_BIT              0U

/** P0.1 — CH2 output mode. */
#define NAMUR_DIP_CH2_PORT             0U
#define NAMUR_DIP_CH2_BIT              1U

/** P0.2 — global fault suppress (0=diagnostics on, 1=ignore faults). */
#define NAMUR_DIP_FAULT_SUPPRESS_PORT  0U
#define NAMUR_DIP_FAULT_SUPPRESS_BIT   2U

/* --- LEDs on P1 (active high, push-pull) --- */

/** P1.0 — CH1 sense / target-present LED. */
#define NAMUR_LED_CH1_SENSE_PORT       1U
#define NAMUR_LED_CH1_SENSE_BIT        0U

/** P1.1 — CH2 sense LED. */
#define NAMUR_LED_CH2_SENSE_PORT       1U
#define NAMUR_LED_CH2_SENSE_BIT        1U

/** P1.2 — CH1 fault LED. */
#define NAMUR_LED_CH1_FAULT_PORT       1U
#define NAMUR_LED_CH1_FAULT_BIT        2U

/** P1.3 — CH2 fault LED. */
#define NAMUR_LED_CH2_FAULT_PORT       1U
#define NAMUR_LED_CH2_FAULT_BIT        3U

/** Packed DIP flags returned by bsp_read_dip(). */
#define NAMUR_DIP_CH1_NC               (1U << 0)
#define NAMUR_DIP_CH2_NC               (1U << 1)
#define NAMUR_DIP_FAULT_SUPPRESS       (1U << 2)

#endif /* NAMUR_CONFIG_H */
