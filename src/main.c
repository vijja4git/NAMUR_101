/**
 * @file main.c
 * @brief Deterministic 20 ms superloop with watchdog servicing.
 */

#include "ms51_bsp.h"
#include "namur_logic.h"
#include "namur_config.h"
#include "bsp_config.h"

static namur_logic_t g_logic;

void main(void)
{
    namur_logic_init(&g_logic);
    bsp_init();

    for (;;) {
        uint8_t dip = bsp_read_dip();
        uint16_t adc1 = bsp_adc_read_channel(NAMUR_ADC_CH1);
        uint16_t adc2 = bsp_adc_read_channel(NAMUR_ADC_CH2);

        namur_logic_update(&g_logic, adc1, adc2, dip);

        bsp_led_ch1_sense(g_logic.ch[0].sense_led);
        bsp_led_ch2_sense(g_logic.ch[1].sense_led);
        bsp_led_ch1_fault(g_logic.ch[0].fault_led);
        bsp_led_ch2_fault(g_logic.ch[1].fault_led);

        bsp_clear_wdt();
        bsp_delay_ms(BSP_LOOP_MS);
    }
}
