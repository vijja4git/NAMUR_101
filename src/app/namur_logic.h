/**
 * @file namur_logic.h
 * @brief Hardware-agnostic NAMUR 2-channel state machine and LED policy.
 */

#ifndef NAMUR_LOGIC_H
#define NAMUR_LOGIC_H

#include <stdint.h>

#define NAMUR_LOGIC_CHANNELS  2U

typedef enum {
    NAMUR_INSTANT_NORMAL = 0,
    NAMUR_INSTANT_HYST,
    NAMUR_INSTANT_LEAD_BREAK,
    NAMUR_INSTANT_SHORT
} namur_instant_class_t;

typedef enum {
    NAMUR_FAULT_NONE = 0,
    NAMUR_FAULT_LEAD_BREAK,
    NAMUR_FAULT_SHORT_CIRCUIT
} namur_fault_t;

typedef struct {
    uint16_t filtered_adc;
    namur_instant_class_t instant;
    namur_instant_class_t pending;
    uint8_t debounce_count;
    namur_instant_class_t stable;
    namur_fault_t fault;
    uint8_t latched_on;
    uint16_t blink_tick;
    uint8_t sense_led;
    uint8_t fault_led;
} namur_channel_t;

typedef struct {
    namur_channel_t ch[NAMUR_LOGIC_CHANNELS];
    uint8_t dip;
} namur_logic_t;

void namur_logic_init(namur_logic_t *ctx);
void namur_logic_update(namur_logic_t *ctx, uint16_t adc_ch1, uint16_t adc_ch2, uint8_t dip);

#endif /* NAMUR_LOGIC_H */
