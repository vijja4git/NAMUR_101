/**
 * @file check_namur_thresholds.c
 * @brief Compile-time verification of field-calibrated namur_thresholds.h.
 */
#include "namur_thresholds.h"

enum {
    expect_lead_break   = 24U,   /* 150 uA */
    expect_latch_on     = 196U,  /* 1200 uA — target detected */
    expect_latch_off    = 458U,  /* 2800 uA — sensor idle band */
    expect_short        = 1146U  /* 7000 uA — short circuit */
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
    (NAMUR_ADC_LATCH_ON < NAMUR_ADC_LATCH_OFF) ? 1 : -1];

typedef char assert_lead_below_on[
    (NAMUR_ADC_LEAD_BREAK < NAMUR_ADC_LATCH_ON) ? 1 : -1];
typedef char assert_short_above_off[
    (NAMUR_ADC_SHORT_CIRCUIT > NAMUR_ADC_LATCH_OFF) ? 1 : -1];

int main(void)
{
    return 0;
}
