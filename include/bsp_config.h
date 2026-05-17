/**
 * @file bsp_config.h
 * @brief Timing, filter, watchdog, brownout, and BSP safety constants.
 */

#ifndef BSP_CONFIG_H
#define BSP_CONFIG_H

/** Main superloop period (ms). */
#define BSP_LOOP_MS                    20U

/** Debounced state must be stable for this many loop cycles (80 ms at 20 ms). */
#define BSP_DEBOUNCE_CYCLES            4U

/**
 * EMA low-pass: filtered += (raw - filtered) >> BSP_EMA_ALPHA_SHIFT.
 * Larger shift = heavier filtering (slower response).
 */
#define BSP_EMA_ALPHA_SHIFT            3U

/** Maximum ADC end-of-conversion poll iterations before bsp_hardware_failure(). */
#define BSP_ADC_TIMEOUT_LOOPS          2000U

/** Target internal HIRC system clock (Hz). */
#define BSP_SYSTEM_CLOCK_HZ            16000000UL

/**
 * Hardware watchdog timeout target (ms).
 * Actual margin depends on WDT prescaler; tuned for ~100 ms at 16 MHz.
 */
#define BSP_WDT_TIMEOUT_MS             100U

/**
 * Brown-out detection threshold (mV).
 * Forces reset when VDD falls below this level (configured to ~4.4 V).
 */
#define BSP_BOD_THRESHOLD_MV           4400U

/** Fault LED blink: lead break (1 Hz), half-period in loop ticks (500 ms / 20 ms). */
#define BSP_BLINK_LEAD_BREAK_HALF_TICKS  25U

/** Fault LED blink: short circuit (5 Hz), half-period in loop ticks (100 ms / 20 ms). */
#define BSP_BLINK_SHORT_HALF_TICKS       5U

#endif /* BSP_CONFIG_H */
