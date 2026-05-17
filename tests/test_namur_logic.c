/**
 * @file test_namur_logic.c
 * @brief Host unit tests for namur_logic (GCC).
 *
 * ADC windows (200 ohm, inverted loop, filtered counts):
 *   < 24 lead | < 196 latch ON | 196–458 hold | > 458 latch OFF | > 1146 short
 */

#include <stdio.h>
#include <stdlib.h>

#include "namur_logic.h"
#include "namur_thresholds.h"
#include "bsp_config.h"
#include "namur_config.h"

#define ADC_LEAD_BREAK      10U   /* < 24  — open wire */
#define ADC_TARGET_PRESENT  120U  /* < 196 — target detected */
#define ADC_HYST_MID        300U  /* 196–458 hold */
#define ADC_IDLE            550U  /* > 458 — sensor idle */
#define ADC_SHORT           1200U /* > 1146 — short */
#define ADC_NORMAL_MID      350U  /* normal band, no fault */

static int g_failures;

static void expect_true(int cond, const char *msg)
{
    if (!cond) {
        fprintf(stderr, "FAIL: %s\n", msg);
        g_failures++;
    }
}

static void settle(namur_logic_t *ctx, uint16_t adc1, uint16_t adc2, uint8_t dip, unsigned rounds)
{
    unsigned i;
    for (i = 0; i < rounds; i++) {
        namur_logic_update(ctx, adc1, adc2, dip);
    }
}

static void test_ema_noise_rejection(void)
{
    namur_logic_t ctx;
    uint16_t before;
    uint16_t after_spike;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_HYST_MID, ADC_HYST_MID, 0U, 30U);
    before = ctx.ch[0].filtered_adc;

    namur_logic_update(&ctx, ADC_HYST_MID, ADC_HYST_MID, 0U);
    namur_logic_update(&ctx, ADC_SHORT, ADC_HYST_MID, 0U);
    namur_logic_update(&ctx, ADC_HYST_MID, ADC_HYST_MID, 0U);
    after_spike = ctx.ch[0].filtered_adc;

    expect_true(after_spike < before + 120U, "EMA should attenuate single spike");
    expect_true(after_spike > 250U, "EMA should track toward nominal after burst");
}

static void test_hysteresis_hold(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].latched_on == 1U, "latch ON when adc < 196");

    settle(&ctx, ADC_HYST_MID, ADC_IDLE, 0U, 10U);
    expect_true(ctx.ch[0].latched_on == 1U, "latch holds ON inside 196–458 band");
}

static void test_hysteresis_off(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, 0U, 30U);
    settle(&ctx, ADC_IDLE, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].latched_on == 0U, "latch OFF when adc > 458");
}

static void test_debounce_glitch(void)
{
    namur_logic_t ctx;
    unsigned i;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "lead break latched after settle");

    for (i = 0; i < 3U; i++) {
        namur_logic_update(&ctx, ADC_IDLE, ADC_IDLE, 0U);
    }
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "3-cycle recovery glitch keeps fault");

    settle(&ctx, ADC_IDLE, ADC_IDLE, 0U, 4U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_NONE, "4 stable normal cycles clear fault");
}

static void test_lead_break_and_short(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "lead break fault");

    namur_logic_init(&ctx);
    settle(&ctx, ADC_IDLE, ADC_SHORT, 0U, 60U);
    expect_true(ctx.ch[1].fault == NAMUR_FAULT_SHORT_CIRCUIT, "short circuit fault");
}

static void test_normal_operation_leds(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_NONE, "no fault in normal band");
    expect_true(ctx.ch[0].fault_led == 0U, "fault LED off when normal");
    expect_true(ctx.ch[0].sense_led == 1U, "sense LED follows latch ON (NO)");
}

static void test_dip_nc_invert(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].sense_led == 1U, "NO mode sense follows latch ON");

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, NAMUR_DIP_CH1_NC, 30U);
    expect_true(ctx.ch[0].sense_led == 0U, "NC mode inverts sense LED");
}

static void test_dip_fault_suppress_short_only(void)
{
    namur_logic_t ctx;
    unsigned i;
    uint8_t saw_lead_fault_led = 0U;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_LEAD_BREAK, ADC_SHORT, NAMUR_DIP_FAULT_SUPPRESS, 30U);

    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK,
        "lead break not suppressed by DIP3");
    expect_true(ctx.ch[0].sense_led == 0U,
        "sense LED off during lead break with DIP3");

    for (i = 0; i < (BSP_BLINK_LEAD_BREAK_HALF_TICKS * 2U); i++) {
        namur_logic_update(&ctx, ADC_LEAD_BREAK, ADC_SHORT, NAMUR_DIP_FAULT_SUPPRESS);
        if (ctx.ch[0].fault_led) {
            saw_lead_fault_led = 1U;
        }
    }
    expect_true(saw_lead_fault_led, "lead break fault LED blinks with DIP3");

    expect_true(ctx.ch[1].fault == NAMUR_FAULT_NONE,
        "short suppressed by DIP3");
    expect_true(ctx.ch[1].fault_led == 0U,
        "short fault LED off when suppressed");
}

static void test_blink_periods(void)
{
    namur_logic_t ctx;
    uint8_t lead_a;
    uint8_t lead_b;
    uint8_t short_a;
    uint8_t short_b;
    unsigned i;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U, 30U);

    lead_a = ctx.ch[0].fault_led;
    for (i = 0; i < BSP_BLINK_LEAD_BREAK_HALF_TICKS; i++) {
        namur_logic_update(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U);
    }
    lead_b = ctx.ch[0].fault_led;
    expect_true(lead_a != lead_b, "lead break 1 Hz blink toggles");

    namur_logic_init(&ctx);
    settle(&ctx, ADC_IDLE, ADC_SHORT, 0U, 60U);

    short_a = ctx.ch[1].fault_led;
    for (i = 0; i < BSP_BLINK_SHORT_HALF_TICKS; i++) {
        namur_logic_update(&ctx, ADC_IDLE, ADC_SHORT, 0U);
    }
    short_b = ctx.ch[1].fault_led;
    expect_true(short_a != short_b, "short 5 Hz blink toggles");
}

static void test_sense_off_during_fault(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_TARGET_PRESENT, ADC_IDLE, 0U, 20U);
    settle(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].sense_led == 0U, "sense LED off when fault active");
}

static void test_fault_reactivates_after_normal(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, ADC_IDLE, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].fault_led == 0U, "fault LED off when idle normal");

    settle(&ctx, ADC_LEAD_BREAK, ADC_IDLE, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "wire break reactivates fault");
    expect_true(ctx.ch[0].sense_led == 0U, "sense LED off on wire break");
}

int main(void)
{
    g_failures = 0;

    test_ema_noise_rejection();
    test_hysteresis_hold();
    test_hysteresis_off();
    test_debounce_glitch();
    test_lead_break_and_short();
    test_normal_operation_leds();
    test_dip_nc_invert();
    test_dip_fault_suppress_short_only();
    test_blink_periods();
    test_sense_off_during_fault();
    test_fault_reactivates_after_normal();

    if (g_failures != 0) {
        fprintf(stderr, "%d test(s) failed.\n", g_failures);
        return EXIT_FAILURE;
    }

    printf("All namur_logic tests passed.\n");
    return EXIT_SUCCESS;
}
