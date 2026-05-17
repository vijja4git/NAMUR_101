/**
 * @file namur_thresholds.h
 * @brief NAMUR loop electrical domain: 200-ohm shunt, AT-pin field calibration.
 *
 * ADC = (uA * R_shunt * ADC_MAX) / (Vref_mV * 1000)
 *
 * AT-pin field reference (200 ohm shunt, Vref = 5.0 V ADC):
 * | State              | Pin voltage | Loop current |
 * |--------------------|-------------|--------------|
 * | No sensor / open   | 0 V         | 0 mA         |
 * | Target detected    | 0.07–0.2 V  | 0.3–1 mA     |
 * | Sensor idle        | 0.67 V      | 3.36 mA      |
 * | Short circuit      | 1.55 V      | 8 mA         |
 *
 * Current DROPS when a target is detected (inverted latch).
 */

#ifndef NAMUR_THRESHOLDS_H
#define NAMUR_THRESHOLDS_H

#define NAMUR_VREF_MV              5000U
#define NAMUR_SHUNT_OHMS           200U
#define NAMUR_ADC_MAX_COUNTS       4095U

#define NAMUR_UA_TO_ADC_COUNTS(ua) \
    ( (unsigned int)( ((unsigned long)(ua) * (unsigned long)NAMUR_SHUNT_OHMS * \
                        (unsigned long)NAMUR_ADC_MAX_COUNTS) / \
                       ((unsigned long)NAMUR_VREF_MV * 1000UL) ) )

/* --- Operational current boundaries (microamps) --- */

/** Below this: lead break (0 V / 0 mA at pin). */
#define NAMUR_UA_LEAD_BREAK        150U

/** Above this: short circuit (field 8 mA @ 1.55 V; threshold below 8 mA). */
#define NAMUR_UA_SHORT_CIRCUIT     7000U

/**
 * Latch ON when current falls below this (target present, up to ~1 mA).
 * Between 0.3 mA sense min and 1 mA sense max.
 */
#define NAMUR_UA_LATCH_ON          1200U

/**
 * Latch OFF when current rises above this (sensor idle ~3.36 mA @ 0.67 V).
 * Placed between sense band and idle current.
 */
#define NAMUR_UA_LATCH_OFF         2800U

/* --- Compile-time ADC count boundaries --- */

#define NAMUR_ADC_LEAD_BREAK       NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LEAD_BREAK)
#define NAMUR_ADC_SHORT_CIRCUIT    NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_SHORT_CIRCUIT)
#define NAMUR_ADC_LATCH_ON         NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_ON)
#define NAMUR_ADC_LATCH_OFF        NAMUR_UA_TO_ADC_COUNTS(NAMUR_UA_LATCH_OFF)

#define NAMUR_ADC_IS_LEAD_BREAK(adc)       ((adc) < NAMUR_ADC_LEAD_BREAK)
#define NAMUR_ADC_IS_SHORT_CIRCUIT(adc)    ((adc) > NAMUR_ADC_SHORT_CIRCUIT)

#define NAMUR_ADC_SHOULD_LATCH_ON(adc)     ((adc) < NAMUR_ADC_LATCH_ON)
#define NAMUR_ADC_SHOULD_LATCH_OFF(adc)    ((adc) > NAMUR_ADC_LATCH_OFF)

#endif /* NAMUR_THRESHOLDS_H */
