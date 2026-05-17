/**
 * @file namur_thresholds.h
 * @brief RECALIBRATED NAMUR loop electrical domain: 200-ohm shunt count boundaries.
 *
 * All operational thresholds are derived at compile time from:
 * ADC = (uA * R_shunt * ADC_MAX) / (Vref_mV * 1000)
 *
 * Calibrated specifically for:
 * - Vref = 5.0V (MCU VCC)
 * - Hardware Shunt = 200 Ohms (Derived from field data: 0.67V at 3.36mA)
 * - Physical States: Lead Break (0mA), Sensing Target (0.3mA-1mA), Un-sensing (3.36mA), Short (8mA+)
 */

#ifndef NAMUR_THRESHOLDS_H
#define NAMUR_THRESHOLDS_H

/* --- Physical constants (electrical conversion domain) --- */

/** Supply / ADC reference voltage (mV). Assumes stable 5V MCU VCC rail. */
#define NAMUR_VREF_MV              5000U

/** Precision loop shunt (ohms). Updated to match physical hardware. */
#define NAMUR_SHUNT_OHMS           200U

/** 12-bit ADC full-scale count. */
#define NAMUR_ADC_MAX_COUNTS       4095U

/**
 * Convert loop current (microamps) to expected ADC counts at compile time.
 * Uses unsigned long intermediates so the product does not overflow before divide.
 */
#define NAMUR_UA_TO_ADC_COUNTS(ua) \
    ( (unsigned int)( ((unsigned long)(ua) * (unsigned long)NAMUR_SHUNT_OHMS * \
                        (unsigned long)NAMUR_ADC_MAX_COUNTS) / \
                       ((unsigned long)NAMUR_VREF_MV * 1000UL) ) )

/* --- Operational current boundaries (microamps) --- */

/** Below this current: FAULT_LEAD_BREAK (0mA = 0V at pin). */
#define NAMUR_UA_LEAD_BREAK        150U

/** Above this current: FAULT_SHORT_CIRCUIT (Field short: 8mA = 1.55V at pin). */
#define NAMUR_UA_SHORT_CIRCUIT     6000U

/** * Hysteresis Latch Boundaries:
 * Sensing target pulls loop current down to 300uA - 1000uA (~0.06V - 0.2V at pin).
 * Clearing target releases loop current up to 3360uA (~0.67V at pin).
 */
#define NAMUR_UA_LATCH_ON          1500U  /* Transition to Target Detected as current drops */
#define NAMUR_UA_LATCH_OFF         2500U  /* Transition to Idle State as current recovers */

/* --- Compile-time ADC count boundaries --- */

/** ADC count at 150 uA (~24 counts). Compare: adc < this => lead break. */
#define NAMUR_ADC_LEAD_BREAK       NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LEAD_BREAK)

/** ADC count at 6000 uA (~982 counts). Compare: adc > this => short circuit. */
#define NAMUR_ADC_SHORT_CIRCUIT    NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_SHORT_CIRCUIT)

/** ADC count at 1500 uA (~245 counts). */
#define NAMUR_ADC_LATCH_ON         NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_ON)

/** ADC count at 2500 uA (~409 counts). */
#define NAMUR_ADC_LATCH_OFF        NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_OFF)

/* --- Classification helpers (filtered ADC counts) --- */

#define NAMUR_ADC_IS_LEAD_BREAK(adc)       ((adc) < NAMUR_ADC_LEAD_BREAK)
#define NAMUR_ADC_IS_SHORT_CIRCUIT(adc)    ((adc) > NAMUR_ADC_SHORT_CIRCUIT)

/* * Because the sensor current DROPS when an object is detected:
 * Latch ON (Sensing Target) when current drops below 1500 uA
 * Latch OFF (Idle State) when current climbs back above 2500 uA
 */
#define NAMUR_ADC_SHOULD_LATCH_ON(adc)     ((adc) < NAMUR_ADC_LATCH_ON)
#define NAMUR_ADC_SHOULD_LATCH_OFF(adc)    ((adc) > NAMUR_ADC_LATCH_OFF)

#endif /* NAMUR_THRESHOLDS_H */