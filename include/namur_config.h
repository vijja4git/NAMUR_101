/**
 * @file namur_config.h
 * @brief Board pin and channel assignments (MS51 GPIO / ADC).
 *
 * Net names are descriptive placeholders; align with schematic in docs/SETUP_AND_DECISIONS.md.
 */

#ifndef NAMUR_CONFIG_H
#define NAMUR_CONFIG_H

#include <stdint.h>

/* --- ADC channels (AIN index for BSP multiplexer) --- */

/** NAMUR loop 1 sense — net NAMUR1_ISENSE -> AIN0. */
#define NAMUR_ADC_CH1                  0U

/** NAMUR loop 2 sense — net NAMUR2_ISENSE -> AIN1. */
#define NAMUR_ADC_CH2                  1U

#define NAMUR_ADC_CHANNEL_COUNT        2U

/* --- DIP switches (active low when ON, internal pull-up) --- */

/** DIP1: CH1 output mode (0=NO follow latch, 1=NC invert latch). Net DIP_CH1_MODE. */
#define NAMUR_DIP_CH1_PORT             1U
#define NAMUR_DIP_CH1_BIT              0U

/** DIP2: CH2 output mode. Net DIP_CH2_MODE. */
#define NAMUR_DIP_CH2_PORT             1U
#define NAMUR_DIP_CH2_BIT              1U

/** DIP3: global fault suppress (0=diagnostics on, 1=ignore faults). Net DIP_FAULT_DIS. */
#define NAMUR_DIP_FAULT_SUPPRESS_PORT  1U
#define NAMUR_DIP_FAULT_SUPPRESS_BIT   2U

/* --- LEDs (active high drive, push-pull outputs) --- */

/** CH1 target-present indicator. Net LED_CH1_SENSE. */
#define NAMUR_LED_CH1_SENSE_PORT       2U
#define NAMUR_LED_CH1_SENSE_BIT        0U

/** CH2 target-present indicator. Net LED_CH2_SENSE. */
#define NAMUR_LED_CH2_SENSE_PORT       2U
#define NAMUR_LED_CH2_SENSE_BIT        1U

/** CH1 loop fault indicator. Net LED_CH1_FAULT. */
#define NAMUR_LED_CH1_FAULT_PORT       2U
#define NAMUR_LED_CH1_FAULT_BIT        2U

/** CH2 loop fault indicator. Net LED_CH2_FAULT. */
#define NAMUR_LED_CH2_FAULT_PORT       2U
#define NAMUR_LED_CH2_FAULT_BIT        3U

/** Packed DIP flags returned by bsp_read_dip(). */
#define NAMUR_DIP_CH1_NC               (1U << 0)
#define NAMUR_DIP_CH2_NC               (1U << 1)
#define NAMUR_DIP_FAULT_SUPPRESS       (1U << 2)

#endif /* NAMUR_CONFIG_H */
