/**
 * @file namur_thresholds.h
 * @brief NAMUR loop electrical domain: shunt current limits and ADC count boundaries.
 *
 * All operational thresholds are derived at compile time from:
 *   ADC = (uA * R_shunt * ADC_MAX) / (Vref_mV * 1000)
 *
 * Recalibrate safety limits here only; do not embed these values in application logic.
 */

#ifndef NAMUR_THRESHOLDS_H
#define NAMUR_THRESHOLDS_H

/* --- Physical constants (electrical conversion domain) --- */

/** Supply / ADC reference voltage (mV). */
#define NAMUR_VREF_MV              5000U

/** Precision loop shunt (ohms). */
#define NAMUR_SHUNT_OHMS           500U

/** 12-bit ADC full-scale count. */
#define NAMUR_ADC_MAX_COUNTS       4095U

/**
 * Convert loop current (microamps) to expected ADC counts at compile time.
 * Uses unsigned long intermediates so the product does not overflow before divide.
 * @param ua  Loop current in microamps (integer literal or compile-time constant).
 */
#define NAMUR_UA_TO_ADC_COUNTS(ua) \
    ( (unsigned int)( ((unsigned long)(ua) * (unsigned long)NAMUR_SHUNT_OHMS * \
                        (unsigned long)NAMUR_ADC_MAX_COUNTS) / \
                       ((unsigned long)NAMUR_VREF_MV * 1000UL) ) )

/* --- Operational current boundaries (microamps) --- */

/** Below this current: FAULT_LEAD_BREAK (open / lead break). */
#define NAMUR_UA_LEAD_BREAK        150U

/** Above this current: FAULT_SHORT_CIRCUIT. */
#define NAMUR_UA_SHORT_CIRCUIT     6000U

/** Hysteresis: latch OFF when current falls below this. */
#define NAMUR_UA_LATCH_OFF         1200U

/** Hysteresis: latch ON when current rises above this. */
#define NAMUR_UA_LATCH_ON          2100U

/* --- Compile-time ADC count boundaries --- */

/** ADC count at 150 uA (61). Compare: adc < this => lead break. */
#define NAMUR_ADC_LEAD_BREAK       NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LEAD_BREAK)

/** ADC count at 6000 uA (2457). Compare: adc > this => short. */
#define NAMUR_ADC_SHORT_CIRCUIT    NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_SHORT_CIRCUIT)

/** ADC count at 1200 uA (491). Compare: adc < this => latch OFF. */
#define NAMUR_ADC_LATCH_OFF        NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_OFF)

/** ADC count at 2100 uA (859). Compare: adc > this => latch ON. */
#define NAMUR_ADC_LATCH_ON         NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_ON)

/* --- Classification helpers (filtered ADC counts) --- */

#define NAMUR_ADC_IS_LEAD_BREAK(adc)       ((adc) < NAMUR_ADC_LEAD_BREAK)
#define NAMUR_ADC_IS_SHORT_CIRCUIT(adc)    ((adc) > NAMUR_ADC_SHORT_CIRCUIT)
#define NAMUR_ADC_SHOULD_LATCH_ON(adc)     ((adc) > NAMUR_ADC_LATCH_ON)
#define NAMUR_ADC_SHOULD_LATCH_OFF(adc)    ((adc) < NAMUR_ADC_LATCH_OFF)

/*
 * Hysteresis hold band: NAMUR_ADC_LATCH_OFF <= adc <= NAMUR_ADC_LATCH_ON
 * (approximately 1200 uA .. 2100 uA) — retain previous stable latch state.
 */

#endif /* NAMUR_THRESHOLDS_H */
