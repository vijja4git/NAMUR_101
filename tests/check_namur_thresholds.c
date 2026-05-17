/**
 * @file check_namur_thresholds.c
 * @brief Phase 1.4 compile-time verification of namur_thresholds.h (host gcc).
 */
#include "namur_thresholds.h"

enum {
    expect_lead_break   = 61U,
    expect_latch_off    = 491U,
    expect_latch_on     = 859U,
    expect_short        = 2457U
};

typedef char assert_lead_break[
    (NAMUR_ADC_LEAD_BREAK == expect_lead_break) ? 1 : -1];
typedef char assert_latch_off[
    (NAMUR_ADC_LATCH_OFF == expect_latch_off) ? 1 : -1];
typedef char assert_latch_on[
    (NAMUR_ADC_LATCH_ON == expect_latch_on) ? 1 : -1];
typedef char assert_short[
    (NAMUR_ADC_SHORT_CIRCUIT == expect_short) ? 1 : -1];
typedef char assert_band_order[
    (NAMUR_ADC_LATCH_OFF < NAMUR_ADC_LATCH_ON) ? 1 : -1];
typedef char assert_lead_below_off[
    (NAMUR_ADC_LEAD_BREAK < NAMUR_ADC_LATCH_OFF) ? 1 : -1];
typedef char assert_short_above_on[
    (NAMUR_ADC_SHORT_CIRCUIT > NAMUR_ADC_LATCH_ON) ? 1 : -1];

int main(void)
{
    return 0;
}
