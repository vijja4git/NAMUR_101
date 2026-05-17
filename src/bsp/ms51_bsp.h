/**
 * @file ms51_bsp.h
 * @brief Board Support Package API (application-facing hardware boundary).
 */

#ifndef MS51_BSP_H
#define MS51_BSP_H

#include "stdint.h"

void bsp_init(void);
void bsp_delay_ms(uint16_t ms);

uint8_t bsp_read_dip(void);
uint16_t bsp_adc_read_channel(uint8_t channel);

void bsp_led_ch1_sense(uint8_t on);
void bsp_led_ch2_sense(uint8_t on);
void bsp_led_ch1_fault(uint8_t on);
void bsp_led_ch2_fault(uint8_t on);

void bsp_clear_wdt(void);
void bsp_hardware_failure(void);

#endif /* MS51_BSP_H */
