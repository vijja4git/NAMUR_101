/**
 * @file ms51_bsp.c
 * @brief MS51 BSP: clock, BOD, WDT, GPIO, ADC with poll timeout.
 */

#include "ms51_bsp.h"
#include "ms51_registers.h"
#include "bsp_config.h"
#include "namur_config.h"

#ifndef __SDCC
#define __sfr volatile unsigned char
static __sfr P0, P1, P2, P3;
static __sfr CLKCON, BODCON0, WDCON;
static __sfr P0M1, P0M2, P1M1, P1M2, P2M1, P2M2, P3M1, P3M2;
static __sfr ADCCON0, ADCCON1, ADCDLY, ADCCON2, ADCDL, ADCDH, AINDIDS;
#define ADCCON0_ADCTRG      0x04
#define ADCCON0_ADCF        0x20
#define CLKCON_HIRC_16M     0x30
#define BODCON0_BOVEN       0x80
#define BODCON0_BODRSTEN    0x04
#define WDCON_WDCLR         0x80
#define WDCON_WDTEN         0x01
#endif

static void bsp_clock_init(void)
{
    CLKCON = (CLKCON & (unsigned char)~0x70) | CLKCON_HIRC_16M;
}

static void bsp_configure_bod(void)
{
    BODCON0 = (unsigned char)(BODCON0_BOVEN | BODCON0_BODRSTEN | 0x06);
    (void)BSP_BOD_THRESHOLD_MV;
}

static void bsp_configure_wdt(void)
{
    WDCON = (unsigned char)((WDCON & (unsigned char)~0x07) | WDCON_WDTEN | 0x05);
    (void)BSP_WDT_TIMEOUT_MS;
}

static void gpio_set_mode(uint8_t port, uint8_t bit, uint8_t is_output)
{
    if (port == 0U) {
        if (is_output) {
            P0M1 &= (unsigned char)~(1U << bit);
            P0M2 |= (unsigned char)(1U << bit);
        } else {
            P0M1 |= (unsigned char)(1U << bit);
            P0M2 &= (unsigned char)~(1U << bit);
        }
    } else if (port == 1U) {
        if (is_output) {
            P1M1 &= (unsigned char)~(1U << bit);
            P1M2 |= (unsigned char)(1U << bit);
        } else {
            P1M1 |= (unsigned char)(1U << bit);
            P1M2 &= (unsigned char)~(1U << bit);
        }
    } else if (port == 3U) {
        if (is_output) {
            P3M1 &= (unsigned char)~(1U << bit);
            P3M2 |= (unsigned char)(1U << bit);
        } else {
            P3M1 |= (unsigned char)(1U << bit);
            P3M2 &= (unsigned char)~(1U << bit);
        }
    }
}

static void gpio_write(uint8_t port, uint8_t bit, uint8_t on)
{
    if (port == 0U) {
        if (on) {
            P0 |= (unsigned char)(1U << bit);
        } else {
            P0 &= (unsigned char)~(1U << bit);
        }
    } else if (port == 1U) {
        if (on) {
            P1 |= (unsigned char)(1U << bit);
        } else {
            P1 &= (unsigned char)~(1U << bit);
        }
    } else if (port == 3U) {
        if (on) {
            P3 |= (unsigned char)(1U << bit);
        } else {
            P3 &= (unsigned char)~(1U << bit);
        }
    }
}

static uint8_t gpio_read(uint8_t port, uint8_t bit)
{
    if (port == 0U) {
        return (P0 >> bit) & 1U;
    }
    if (port == 1U) {
        return (P1 >> bit) & 1U;
    }
    return 0U;
}

static void bsp_gpio_init(void)
{
    /* P0: DIP inputs */
    gpio_set_mode(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT, 0U);
    gpio_set_mode(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT, 0U);
    gpio_set_mode(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT, 0U);

    /* P1: sense + fault LEDs */
    gpio_set_mode(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 1U);
    gpio_set_mode(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 1U);
    gpio_set_mode(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 1U);
    gpio_set_mode(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 1U);

    gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 0U);
    gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 0U);
    gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 0U);
    gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 0U);

    /* P3.0 analog input — digital path off (input mode) */
    gpio_set_mode(3U, 0U, 0U);
}

static void bsp_adc_init(void)
{
    ADCCON1 = 0x00;
    ADCCON2 = 0x00;
    ADCDLY = 0x0A;
    ADCCON0 = 0x01;
    /* Enable AIN for ADC_CH0 (P1.7) and ADC_CH1 (P3.0). */
    AINDIDS = 0x03;
}

void bsp_init(void)
{
    bsp_clock_init();
    bsp_gpio_init();
    bsp_configure_bod();
    bsp_configure_wdt();
    bsp_adc_init();
}

void bsp_delay_ms(uint16_t ms)
{
    while (ms--) {
        uint16_t i;
        for (i = 0; i < 1600U; i++) {
            __asm__("nop");
        }
    }
}

uint8_t bsp_read_dip(void)
{
    uint8_t dip = 0U;

    if (gpio_read(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT) == 0U) {
        dip |= NAMUR_DIP_CH1_NC;
    }
    if (gpio_read(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT) == 0U) {
        dip |= NAMUR_DIP_CH2_NC;
    }
    if (gpio_read(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT) == 0U) {
        dip |= NAMUR_DIP_FAULT_SUPPRESS;
    }
    return dip;
}

uint16_t bsp_adc_read_channel(uint8_t channel)
{
    uint16_t timeout = BSP_ADC_TIMEOUT_LOOPS;
    uint16_t value;

    ADCCON0 = (unsigned char)((ADCCON0 & 0xF0) | (channel & 0x0FU) | ADCCON0_ADCTRG);
    while (((ADCCON0 & ADCCON0_ADCF) == 0U) && (timeout > 0U)) {
        timeout--;
    }
    if (timeout == 0U) {
        bsp_hardware_failure();
        return 0U;
    }

    value = (uint16_t)(((uint16_t)ADCDH << 4) | ((uint16_t)ADCDL & 0x0FU));
    return value;
}

void bsp_led_ch1_sense(uint8_t on) { gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, on); }
void bsp_led_ch2_sense(uint8_t on) { gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, on); }
void bsp_led_ch1_fault(uint8_t on) { gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, on); }
void bsp_led_ch2_fault(uint8_t on) { gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, on); }

void bsp_clear_wdt(void)
{
    WDCON |= WDCON_WDCLR;
}

void bsp_hardware_failure(void)
{
    bsp_led_ch1_sense(0U);
    bsp_led_ch2_sense(0U);
    bsp_led_ch1_fault(0U);
    bsp_led_ch2_fault(0U);
    while (1) {
    }
}
