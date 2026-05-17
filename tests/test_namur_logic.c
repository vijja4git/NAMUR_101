/**
 * @file test_namur_logic.c
 * @brief Host unit tests for namur_logic (GCC).
 */

#include <stdio.h>
#include <stdlib.h>

#include "namur_logic.h"
#include "namur_thresholds.h"
#include "bsp_config.h"
#include "namur_config.h"

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
    settle(&ctx, 800U, 800U, 0U, 30U);
    before = ctx.ch[0].filtered_adc;

    namur_logic_update(&ctx, 800U, 800U, 0U);
    namur_logic_update(&ctx, 2000U, 800U, 0U);
    namur_logic_update(&ctx, 800U, 800U, 0U);
    after_spike = ctx.ch[0].filtered_adc;

    expect_true(after_spike < before + 200U, "EMA should attenuate single spike");
    expect_true(after_spike > 600U, "EMA should track toward nominal after burst");
}

static void test_hysteresis_hold(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 900U, 900U, 0U, 30U);
    expect_true(ctx.ch[0].latched_on == 1U, "latch should turn ON above ON threshold");

    settle(&ctx, 600U, 600U, 0U, 10U);
    expect_true(ctx.ch[0].latched_on == 1U, "latch should hold ON inside hysteresis band");
}

static void test_hysteresis_off(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 900U, 900U, 0U, 30U);
    settle(&ctx, 400U, 400U, 0U, 30U);
    expect_true(ctx.ch[0].latched_on == 0U, "latch should turn OFF below OFF threshold");
}

static void test_debounce_glitch(void)
{
    namur_logic_t ctx;
    unsigned i;

    namur_logic_init(&ctx);
    settle(&ctx, 50U, 800U, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "lead break latched after settle");

    for (i = 0; i < 3U; i++) {
        namur_logic_update(&ctx, 800U, 800U, 0U);
    }
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "3-cycle recovery glitch keeps fault");

    settle(&ctx, 800U, 800U, 0U, 4U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_NONE, "4 stable normal cycles clear fault");
}

static void test_lead_break_and_short(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 50U, 800U, 0U, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_LEAD_BREAK, "lead break fault");

    namur_logic_init(&ctx);
    settle(&ctx, 800U, 2700U, 0U, 60U);
    expect_true(ctx.ch[1].fault == NAMUR_FAULT_SHORT_CIRCUIT, "short circuit fault");
}

static void test_dip_nc_invert(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 900U, 900U, 0U, 30U);
    expect_true(ctx.ch[0].sense_led == 1U, "NO mode sense follows latch ON");

    namur_logic_init(&ctx);
    settle(&ctx, 900U, 900U, NAMUR_DIP_CH1_NC, 30U);
    expect_true(ctx.ch[0].sense_led == 0U, "NC mode inverts sense LED");
}

static void test_dip_fault_suppress(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 50U, 2500U, NAMUR_DIP_FAULT_SUPPRESS, 30U);
    expect_true(ctx.ch[0].fault == NAMUR_FAULT_NONE, "DIP3 clears CH1 fault");
    expect_true(ctx.ch[1].fault == NAMUR_FAULT_NONE, "DIP3 clears CH2 fault");
    expect_true(ctx.ch[0].fault_led == 0U, "fault LED off when suppressed");
    expect_true(ctx.ch[1].fault_led == 0U, "fault LED off when suppressed");
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
    settle(&ctx, 50U, 800U, 0U, 30U);

    lead_a = ctx.ch[0].fault_led;
    for (i = 0; i < BSP_BLINK_LEAD_BREAK_HALF_TICKS; i++) {
        namur_logic_update(&ctx, 50U, 800U, 0U);
    }
    lead_b = ctx.ch[0].fault_led;
    expect_true(lead_a != lead_b, "lead break blink toggles after 1 Hz half period");

    namur_logic_init(&ctx);
    settle(&ctx, 800U, 2700U, 0U, 60U);

    short_a = ctx.ch[1].fault_led;
    for (i = 0; i < BSP_BLINK_SHORT_HALF_TICKS; i++) {
        namur_logic_update(&ctx, 800U, 2700U, 0U);
    }
    short_b = ctx.ch[1].fault_led;
    expect_true(short_a != short_b, "short blink toggles after 5 Hz half period");
}

static void test_sense_off_during_fault(void)
{
    namur_logic_t ctx;

    namur_logic_init(&ctx);
    settle(&ctx, 900U, 800U, 0U, 20U);
    settle(&ctx, 50U, 800U, 0U, 30U);
    expect_true(ctx.ch[0].sense_led == 0U, "sense LED off when fault active");
}

int main(void)
{
    g_failures = 0;

    test_ema_noise_rejection();
    test_hysteresis_hold();
    test_hysteresis_off();
    test_debounce_glitch();
    test_lead_break_and_short();
    test_dip_nc_invert();
    test_dip_fault_suppress();
    test_blink_periods();
    test_sense_off_during_fault();

    if (g_failures != 0) {
        fprintf(stderr, "%d test(s) failed.\n", g_failures);
        return EXIT_FAILURE;
    }

    printf("All namur_logic tests passed.\n");
    return EXIT_SUCCESS;
}
