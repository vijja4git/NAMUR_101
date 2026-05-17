/**
 * @file check_namur_thresholds.c
 * @brief Phase 1.4 compile-time verification of recalibrated namur_thresholds.h (host gcc).
 */
#include "namur_thresholds.h"

enum {
    /* New 200-ohm expected counts: (uA * 200 * 4095) / (5000 * 1000) */
    expect_lead_break   = 24U,   // 150 uA
    expect_latch_on     = 245U,  // 1500 uA
    expect_latch_off    = 409U,  // 2500 uA
    expect_short        = 982U   // 6000 uA
};

typedef char assert_lead_break[
    (NAMUR_ADC_LEAD_BREAK == expect_lead_break) ? 1 : -1];
typedef char assert_latch_off[
    (NAMUR_ADC_LATCH_OFF == expect_latch_off) ? 1 : -1];
typedef char assert_latch_on[
    (NAMUR_ADC_LATCH_ON == expect_latch_on) ? 1 : -1];
typedef char assert_short[
    (NAMUR_ADC_SHORT_CIRCUIT == expect_short) ? 1 : -1];

/* Inverted loop check: Current drops when target is present,
   meaning NAMUR_ADC_LATCH_ON (1500uA) is a SMALLER count than NAMUR_ADC_LATCH_OFF (2500uA) */
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
