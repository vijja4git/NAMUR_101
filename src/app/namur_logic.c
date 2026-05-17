/**
 * @file namur_logic.c
 * @brief EMA filter, debounced classification, hysteresis, DIP policy, fault blink.
 */

#include "namur_logic.h"
#include "namur_thresholds.h"
#include "bsp_config.h"
#include "namur_config.h"

static namur_instant_class_t classify_adc(uint16_t adc)
{
    if (NAMUR_ADC_IS_LEAD_BREAK(adc)) {
        return NAMUR_INSTANT_LEAD_BREAK;
    }
    if (NAMUR_ADC_IS_SHORT_CIRCUIT(adc)) {
        return NAMUR_INSTANT_SHORT;
    }
    if (NAMUR_ADC_SHOULD_LATCH_ON(adc) || NAMUR_ADC_SHOULD_LATCH_OFF(adc)) {
        return NAMUR_INSTANT_NORMAL;
    }
    return NAMUR_INSTANT_HYST;
}

static void ema_filter(uint16_t raw, uint16_t *filtered)
{
    int16_t delta = (int16_t)raw - (int16_t)(*filtered);
    *filtered = (uint16_t)((int16_t)(*filtered) + (delta >> BSP_EMA_ALPHA_SHIFT));
}

static void debounce_channel(namur_channel_t *ch)
{
    if (ch->instant == ch->pending) {
        if (ch->debounce_count < BSP_DEBOUNCE_CYCLES) {
            ch->debounce_count++;
        }
    } else {
        ch->pending = ch->instant;
        ch->debounce_count = 1U;
    }

    if (ch->debounce_count >= BSP_DEBOUNCE_CYCLES) {
        ch->stable = ch->pending;
    }
}

static void apply_fault(namur_channel_t *ch)
{
    if (ch->stable == NAMUR_INSTANT_LEAD_BREAK) {
        ch->fault = NAMUR_FAULT_LEAD_BREAK;
    } else if (ch->stable == NAMUR_INSTANT_SHORT) {
        ch->fault = NAMUR_FAULT_SHORT_CIRCUIT;
    } else {
        ch->fault = NAMUR_FAULT_NONE;
    }
}

static void apply_latch(namur_channel_t *ch)
{
    if (ch->fault != NAMUR_FAULT_NONE) {
        return;
    }

    if (NAMUR_ADC_SHOULD_LATCH_ON(ch->filtered_adc)) {
        ch->latched_on = 1U;
    } else if (NAMUR_ADC_SHOULD_LATCH_OFF(ch->filtered_adc)) {
        ch->latched_on = 0U;
    }
}

static uint8_t sense_from_latch(uint8_t latched_on, uint8_t dip_nc)
{
    uint8_t sense = latched_on;

    if (dip_nc) {
        sense = (uint8_t)(sense ? 0U : 1U);
    }
    return sense;
}

static uint8_t fault_blink_on(const namur_channel_t *ch)
{
    uint16_t half;

    if (ch->fault == NAMUR_FAULT_LEAD_BREAK) {
        half = BSP_BLINK_LEAD_BREAK_HALF_TICKS;
    } else if (ch->fault == NAMUR_FAULT_SHORT_CIRCUIT) {
        half = BSP_BLINK_SHORT_HALF_TICKS;
    } else {
        return 0U;
    }

    return (uint8_t)(((ch->blink_tick / half) & 1U) == 0U);
}

static void update_channel(namur_channel_t *ch, uint16_t raw_adc, uint8_t dip_nc, uint8_t fault_suppress)
{
    ema_filter(raw_adc, &ch->filtered_adc);
    ch->instant = classify_adc(ch->filtered_adc);
    debounce_channel(ch);

    if (fault_suppress) {
        ch->fault = NAMUR_FAULT_NONE;
    } else {
        apply_fault(ch);
    }

    apply_latch(ch);

    if (ch->fault != NAMUR_FAULT_NONE) {
        ch->sense_led = 0U;
        ch->blink_tick++;
        ch->fault_led = fault_blink_on(ch);
    } else {
        ch->fault_led = 0U;
        ch->blink_tick = 0U;
        ch->sense_led = sense_from_latch(ch->latched_on, dip_nc);
    }
}

void namur_logic_init(namur_logic_t *ctx)
{
    uint8_t i;

    for (i = 0; i < NAMUR_LOGIC_CHANNELS; i++) {
        ctx->ch[i].filtered_adc = 0U;
        ctx->ch[i].instant = NAMUR_INSTANT_HYST;
        ctx->ch[i].pending = NAMUR_INSTANT_HYST;
        ctx->ch[i].stable = NAMUR_INSTANT_HYST;
        ctx->ch[i].debounce_count = 0U;
        ctx->ch[i].fault = NAMUR_FAULT_NONE;
        ctx->ch[i].latched_on = 0U;
        ctx->ch[i].blink_tick = 0U;
        ctx->ch[i].sense_led = 0U;
        ctx->ch[i].fault_led = 0U;
    }
    ctx->dip = 0U;
}

void namur_logic_update(namur_logic_t *ctx, uint16_t adc_ch1, uint16_t adc_ch2, uint8_t dip)
{
    uint8_t fault_suppress = (uint8_t)((dip & NAMUR_DIP_FAULT_SUPPRESS) != 0U);
    uint8_t dip_ch1_nc = (uint8_t)((dip & NAMUR_DIP_CH1_NC) != 0U);
    uint8_t dip_ch2_nc = (uint8_t)((dip & NAMUR_DIP_CH2_NC) != 0U);

    ctx->dip = dip;

    update_channel(&ctx->ch[0], adc_ch1, dip_ch1_nc, fault_suppress);
    update_channel(&ctx->ch[1], adc_ch2, dip_ch2_nc, fault_suppress);
}
