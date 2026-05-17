;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Mac OS X ppc)
;--------------------------------------------------------
	.module ms51_bsp
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AINDIDS
	.globl _ADCDH
	.globl _ADCDL
	.globl _ADCCON2
	.globl _ADCDLY
	.globl _ADCCON1
	.globl _ADCCON0
	.globl _P2M2
	.globl _P2M1
	.globl _P1M2
	.globl _P1M1
	.globl _P0M2
	.globl _P0M1
	.globl _WDCON
	.globl _BODCON0
	.globl _CLKCON
	.globl _P2
	.globl _P1
	.globl _P0
	.globl _bsp_init
	.globl _bsp_delay_ms
	.globl _bsp_read_dip
	.globl _bsp_adc_read_channel
	.globl _bsp_led_ch1_sense
	.globl _bsp_led_ch2_sense
	.globl _bsp_led_ch1_fault
	.globl _bsp_led_ch2_fault
	.globl _bsp_clear_wdt
	.globl _bsp_hardware_failure
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_P1	=	0x0090
_P2	=	0x00a0
_CLKCON	=	0x008e
_BODCON0	=	0x0086
_WDCON	=	0x00aa
_P0M1	=	0x00b1
_P0M2	=	0x00b2
_P1M1	=	0x00b3
_P1M2	=	0x00b4
_P2M1	=	0x00b5
_P2M2	=	0x00b6
_ADCCON0	=	0x00e8
_ADCCON1	=	0x00e9
_ADCDLY	=	0x00ea
_ADCCON2	=	0x00eb
_ADCDL	=	0x00ec
_ADCDH	=	0x00ed
_AINDIDS	=	0x00ce
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_gpio_set_mode_PARM_2:
	.ds 1
_gpio_set_mode_PARM_3:
	.ds 1
	.area	OSEG    (OVR,DATA)
_gpio_write_PARM_2:
	.ds 1
_gpio_write_PARM_3:
	.ds 1
	.area	OSEG    (OVR,DATA)
_gpio_read_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_clock_init'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:27: static void bsp_clock_init(void)
;	-----------------------------------------
;	 function bsp_clock_init
;	-----------------------------------------
_bsp_clock_init:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	src/bsp/ms51_bsp.c:29: CLKCON = (CLKCON & (unsigned char)~0x70) | CLKCON_HIRC_16M;
	mov	a,#0x8f
	anl	a,_CLKCON
	orl	a,#0x30
	mov	_CLKCON,a
;	src/bsp/ms51_bsp.c:30: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_configure_bod'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:32: static void bsp_configure_bod(void)
;	-----------------------------------------
;	 function bsp_configure_bod
;	-----------------------------------------
_bsp_configure_bod:
;	src/bsp/ms51_bsp.c:35: BODCON0 = (unsigned char)(BODCON0_BOVEN | BODCON0_BODRSTEN | 0x06);
	mov	_BODCON0,#0x86
;	src/bsp/ms51_bsp.c:36: (void)BSP_BOD_THRESHOLD_MV;
;	src/bsp/ms51_bsp.c:37: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_configure_wdt'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:39: static void bsp_configure_wdt(void)
;	-----------------------------------------
;	 function bsp_configure_wdt
;	-----------------------------------------
_bsp_configure_wdt:
;	src/bsp/ms51_bsp.c:41: WDCON = (unsigned char)((WDCON & (unsigned char)~0x07) | WDCON_WDTEN | 0x05);
	mov	a,#0xf8
	anl	a,_WDCON
	orl	a,#0x05
	mov	_WDCON,a
;	src/bsp/ms51_bsp.c:42: (void)BSP_WDT_TIMEOUT_MS;
;	src/bsp/ms51_bsp.c:43: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'gpio_set_mode'
;------------------------------------------------------------
;bit           Allocated with name '_gpio_set_mode_PARM_2'
;is_output     Allocated with name '_gpio_set_mode_PARM_3'
;port          Allocated to registers r7 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:45: static void gpio_set_mode(uint8_t port, uint8_t bit, uint8_t is_output)
;	-----------------------------------------
;	 function gpio_set_mode
;	-----------------------------------------
_gpio_set_mode:
	mov	r7, dpl
;	src/bsp/ms51_bsp.c:47: if (port == 1U) {
	cjne	r7,#0x01,00110$
;	src/bsp/ms51_bsp.c:48: if (is_output) {
	mov	a,_gpio_set_mode_PARM_3
	jz	00102$
;	src/bsp/ms51_bsp.c:49: P1M1 &= (unsigned char)~(1U << bit);
	mov	b,_gpio_set_mode_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00142$
00141$:
	add	a,acc
00142$:
	djnz	b,00141$
	mov	r6,a
	cpl	a
	anl	_P1M1,a
;	src/bsp/ms51_bsp.c:50: P1M2 |= (unsigned char)(1U << bit);
	mov	a,r6
	orl	_P1M2,a
	ret
00102$:
;	src/bsp/ms51_bsp.c:52: P1M1 |= (unsigned char)(1U << bit);
	mov	b,_gpio_set_mode_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00144$
00143$:
	add	a,acc
00144$:
	djnz	b,00143$
	mov	r6,a
	orl	_P1M1,a
;	src/bsp/ms51_bsp.c:53: P1M2 &= (unsigned char)~(1U << bit);
	mov	a,r6
	cpl	a
	anl	_P1M2,a
	ret
00110$:
;	src/bsp/ms51_bsp.c:55: } else if (port == 2U) {
	cjne	r7,#0x02,00112$
;	src/bsp/ms51_bsp.c:56: if (is_output) {
	mov	a,_gpio_set_mode_PARM_3
	jz	00105$
;	src/bsp/ms51_bsp.c:57: P2M1 &= (unsigned char)~(1U << bit);
	mov	b,_gpio_set_mode_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00149$
00148$:
	add	a,acc
00149$:
	djnz	b,00148$
	mov	r7,a
	cpl	a
	anl	_P2M1,a
;	src/bsp/ms51_bsp.c:58: P2M2 |= (unsigned char)(1U << bit);
	mov	a,r7
	orl	_P2M2,a
	ret
00105$:
;	src/bsp/ms51_bsp.c:60: P2M1 |= (unsigned char)(1U << bit);
	mov	b,_gpio_set_mode_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00151$
00150$:
	add	a,acc
00151$:
	djnz	b,00150$
	mov	r7,a
	orl	_P2M1,a
;	src/bsp/ms51_bsp.c:61: P2M2 &= (unsigned char)~(1U << bit);
	mov	a,r7
	cpl	a
	anl	_P2M2,a
00112$:
;	src/bsp/ms51_bsp.c:64: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'gpio_write'
;------------------------------------------------------------
;bit           Allocated with name '_gpio_write_PARM_2'
;on            Allocated with name '_gpio_write_PARM_3'
;port          Allocated to registers r7 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:66: static void gpio_write(uint8_t port, uint8_t bit, uint8_t on)
;	-----------------------------------------
;	 function gpio_write
;	-----------------------------------------
_gpio_write:
	mov	r7, dpl
;	src/bsp/ms51_bsp.c:68: if (port == 1U) {
	cjne	r7,#0x01,00110$
;	src/bsp/ms51_bsp.c:69: if (on) {
	mov	a,_gpio_write_PARM_3
	jz	00102$
;	src/bsp/ms51_bsp.c:70: P1 |= (unsigned char)(1U << bit);
	mov	b,_gpio_write_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00142$
00141$:
	add	a,acc
00142$:
	djnz	b,00141$
	orl	_P1,a
	ret
00102$:
;	src/bsp/ms51_bsp.c:72: P1 &= (unsigned char)~(1U << bit);
	mov	b,_gpio_write_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00144$
00143$:
	add	a,acc
00144$:
	djnz	b,00143$
	cpl	a
	anl	_P1,a
	ret
00110$:
;	src/bsp/ms51_bsp.c:74: } else if (port == 2U) {
	cjne	r7,#0x02,00112$
;	src/bsp/ms51_bsp.c:75: if (on) {
	mov	a,_gpio_write_PARM_3
	jz	00105$
;	src/bsp/ms51_bsp.c:76: P2 |= (unsigned char)(1U << bit);
	mov	b,_gpio_write_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00149$
00148$:
	add	a,acc
00149$:
	djnz	b,00148$
	orl	_P2,a
	ret
00105$:
;	src/bsp/ms51_bsp.c:78: P2 &= (unsigned char)~(1U << bit);
	mov	b,_gpio_write_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	00151$
00150$:
	add	a,acc
00151$:
	djnz	b,00150$
	cpl	a
	anl	_P2,a
00112$:
;	src/bsp/ms51_bsp.c:81: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'gpio_read'
;------------------------------------------------------------
;bit           Allocated with name '_gpio_read_PARM_2'
;port          Allocated to registers r7 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:83: static uint8_t gpio_read(uint8_t port, uint8_t bit)
;	-----------------------------------------
;	 function gpio_read
;	-----------------------------------------
_gpio_read:
	mov	r7, dpl
;	src/bsp/ms51_bsp.c:85: if (port == 1U) {
	cjne	r7,#0x01,00102$
;	src/bsp/ms51_bsp.c:86: return (P1 >> bit) & 1U;
	mov	b,_gpio_read_PARM_2
	inc	b
	mov	a,_P1
	sjmp	00122$
00121$:
	clr	c
	rrc	a
00122$:
	djnz	b,00121$
	anl	a,#0x01
	mov	dpl,a
	ret
00102$:
;	src/bsp/ms51_bsp.c:88: if (port == 2U) {
	cjne	r7,#0x02,00104$
;	src/bsp/ms51_bsp.c:89: return (P2 >> bit) & 1U;
	mov	b,_gpio_read_PARM_2
	inc	b
	mov	a,_P2
	sjmp	00126$
00125$:
	clr	c
	rrc	a
00126$:
	djnz	b,00125$
	anl	a,#0x01
	mov	dpl,a
	ret
00104$:
;	src/bsp/ms51_bsp.c:91: return 0U;
	mov	dpl, #0x00
;	src/bsp/ms51_bsp.c:92: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_gpio_init'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:94: static void bsp_gpio_init(void)
;	-----------------------------------------
;	 function bsp_gpio_init
;	-----------------------------------------
_bsp_gpio_init:
;	src/bsp/ms51_bsp.c:96: gpio_set_mode(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT, 0U);
	mov	_gpio_set_mode_PARM_2,#0x00
	mov	_gpio_set_mode_PARM_3,#0x00
	mov	dpl, #0x01
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:97: gpio_set_mode(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT, 0U);
	mov	_gpio_set_mode_PARM_2,#0x01
	mov	_gpio_set_mode_PARM_3,#0x00
	mov	dpl, #0x01
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:98: gpio_set_mode(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT, 0U);
	mov	_gpio_set_mode_PARM_2,#0x02
	mov	_gpio_set_mode_PARM_3,#0x00
	mov	dpl, #0x01
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:100: gpio_set_mode(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 1U);
	mov	_gpio_set_mode_PARM_2,#0x00
	mov	_gpio_set_mode_PARM_3,#0x01
	mov	dpl, #0x02
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:101: gpio_set_mode(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 1U);
	mov	_gpio_set_mode_PARM_2,#0x01
	mov	_gpio_set_mode_PARM_3,#0x01
	mov	dpl, #0x02
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:102: gpio_set_mode(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 1U);
	mov	_gpio_set_mode_PARM_2,#0x02
	mov	_gpio_set_mode_PARM_3,#0x01
	mov	dpl, #0x02
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:103: gpio_set_mode(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 1U);
	mov	_gpio_set_mode_PARM_2,#0x03
	mov	_gpio_set_mode_PARM_3,#0x01
	mov	dpl, #0x02
	lcall	_gpio_set_mode
;	src/bsp/ms51_bsp.c:105: gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 0U);
	mov	_gpio_write_PARM_2,#0x00
	mov	_gpio_write_PARM_3,#0x00
	mov	dpl, #0x02
	lcall	_gpio_write
;	src/bsp/ms51_bsp.c:106: gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 0U);
	mov	_gpio_write_PARM_2,#0x01
	mov	_gpio_write_PARM_3,#0x00
	mov	dpl, #0x02
	lcall	_gpio_write
;	src/bsp/ms51_bsp.c:107: gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 0U);
	mov	_gpio_write_PARM_2,#0x02
	mov	_gpio_write_PARM_3,#0x00
	mov	dpl, #0x02
	lcall	_gpio_write
;	src/bsp/ms51_bsp.c:108: gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 0U);
	mov	_gpio_write_PARM_2,#0x03
	mov	_gpio_write_PARM_3,#0x00
	mov	dpl, #0x02
;	src/bsp/ms51_bsp.c:109: }
	ljmp	_gpio_write
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_adc_init'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:111: static void bsp_adc_init(void)
;	-----------------------------------------
;	 function bsp_adc_init
;	-----------------------------------------
_bsp_adc_init:
;	src/bsp/ms51_bsp.c:113: ADCCON1 = 0x00;
	mov	_ADCCON1,#0x00
;	src/bsp/ms51_bsp.c:114: ADCCON2 = 0x00;
	mov	_ADCCON2,#0x00
;	src/bsp/ms51_bsp.c:115: ADCDLY = 0x0A;
	mov	_ADCDLY,#0x0a
;	src/bsp/ms51_bsp.c:116: ADCCON0 = 0x01;
	mov	_ADCCON0,#0x01
;	src/bsp/ms51_bsp.c:117: AINDIDS = 0x03;
	mov	_AINDIDS,#0x03
;	src/bsp/ms51_bsp.c:118: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_init'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:120: void bsp_init(void)
;	-----------------------------------------
;	 function bsp_init
;	-----------------------------------------
_bsp_init:
;	src/bsp/ms51_bsp.c:122: bsp_clock_init();
	lcall	_bsp_clock_init
;	src/bsp/ms51_bsp.c:123: bsp_gpio_init();
	lcall	_bsp_gpio_init
;	src/bsp/ms51_bsp.c:124: bsp_configure_bod();
	lcall	_bsp_configure_bod
;	src/bsp/ms51_bsp.c:125: bsp_configure_wdt();
	lcall	_bsp_configure_wdt
;	src/bsp/ms51_bsp.c:126: bsp_adc_init();
;	src/bsp/ms51_bsp.c:127: }
	ljmp	_bsp_adc_init
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_delay_ms'
;------------------------------------------------------------
;ms            Allocated to registers 
;i             Allocated to registers r4 r5 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:129: void bsp_delay_ms(uint16_t ms)
;	-----------------------------------------
;	 function bsp_delay_ms
;	-----------------------------------------
_bsp_delay_ms:
	mov	r6, dpl
	mov	r7, dph
;	src/bsp/ms51_bsp.c:132: while (ms--) {
00102$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00136$
	dec	r7
00136$:
	mov	a,r4
	orl	a,r5
	jz	00108$
;	src/bsp/ms51_bsp.c:134: for (i = 0; i < 1600U; i++) {
	mov	r4,#0x40
	mov	r5,#0x06
00107$:
;	src/bsp/ms51_bsp.c:135: __asm__("nop");
	nop
	dec	r4
	cjne	r4,#0xff,00138$
	dec	r5
00138$:
;	src/bsp/ms51_bsp.c:134: for (i = 0; i < 1600U; i++) {
	mov	a,r4
	orl	a,r5
	jnz	00107$
	sjmp	00102$
00108$:
;	src/bsp/ms51_bsp.c:138: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_read_dip'
;------------------------------------------------------------
;dip           Allocated to registers r7 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:140: uint8_t bsp_read_dip(void)
;	-----------------------------------------
;	 function bsp_read_dip
;	-----------------------------------------
_bsp_read_dip:
;	src/bsp/ms51_bsp.c:142: uint8_t dip = 0U;
	mov	r7,#0x00
;	src/bsp/ms51_bsp.c:144: if (gpio_read(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT) == 0U) {
	mov	_gpio_read_PARM_2,r7
	mov	dpl, #0x01
	push	ar7
	lcall	_gpio_read
	mov	a, dpl
	pop	ar7
	jnz	00102$
;	src/bsp/ms51_bsp.c:145: dip |= NAMUR_DIP_CH1_NC;
	mov	r7,#0x01
00102$:
;	src/bsp/ms51_bsp.c:147: if (gpio_read(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT) == 0U) {
	mov	_gpio_read_PARM_2,#0x01
	mov	dpl, #0x01
	push	ar7
	lcall	_gpio_read
	mov	a, dpl
	pop	ar7
	jnz	00104$
;	src/bsp/ms51_bsp.c:148: dip |= NAMUR_DIP_CH2_NC;
	orl	ar7,#0x02
00104$:
;	src/bsp/ms51_bsp.c:150: if (gpio_read(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT) == 0U) {
	mov	_gpio_read_PARM_2,#0x02
	mov	dpl, #0x01
	push	ar7
	lcall	_gpio_read
	mov	a, dpl
	pop	ar7
	jnz	00106$
;	src/bsp/ms51_bsp.c:151: dip |= NAMUR_DIP_FAULT_SUPPRESS;
	orl	ar7,#0x04
00106$:
;	src/bsp/ms51_bsp.c:153: return dip;
	mov	dpl, r7
;	src/bsp/ms51_bsp.c:154: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_adc_read_channel'
;------------------------------------------------------------
;channel       Allocated to registers r7 
;timeout       Allocated to registers r6 r7 
;value         Allocated to registers 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:156: uint16_t bsp_adc_read_channel(uint8_t channel)
;	-----------------------------------------
;	 function bsp_adc_read_channel
;	-----------------------------------------
_bsp_adc_read_channel:
	mov	r7, dpl
;	src/bsp/ms51_bsp.c:161: ADCCON0 = (unsigned char)((ADCCON0 & 0xF0) | (channel & 0x0FU) | ADCCON0_ADCTRG);
	mov	a,_ADCCON0
	anl	a,#0xf0
	mov	r6,a
	mov	a,#0x0f
	anl	a,r7
	orl	a,r6
	orl	a,#0x04
	mov	_ADCCON0,a
;	src/bsp/ms51_bsp.c:162: while (((ADCCON0 & ADCCON0_ADCF) == 0U) && (timeout > 0U)) {
	mov	r6,#0xd0
	mov	r7,#0x07
00102$:
	mov	a,_ADCCON0
	jb	acc.5,00104$
	mov	a,r6
	orl	a,r7
	jz	00104$
;	src/bsp/ms51_bsp.c:163: timeout--;
	dec	r6
	cjne	r6,#0xff,00136$
	dec	r7
00136$:
	sjmp	00102$
00104$:
;	src/bsp/ms51_bsp.c:165: if (timeout == 0U) {
	mov	a,r6
	orl	a,r7
	jnz	00106$
;	src/bsp/ms51_bsp.c:166: bsp_hardware_failure();
	lcall	_bsp_hardware_failure
;	src/bsp/ms51_bsp.c:167: return 0U;
	mov	dptr,#0x0000
	ret
00106$:
;	src/bsp/ms51_bsp.c:170: value = (uint16_t)(((uint16_t)ADCDH << 4) | ((uint16_t)ADCDL & 0x0FU));
	mov	r6,_ADCDH
	clr	a
	xch	a,r6
	swap	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xf0
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	mov	r4,_ADCDL
	anl	ar4,#0x0f
	mov	r5,#0x00
	mov	a,r6
	orl	ar4,a
	mov	a,r7
	orl	ar5,a
	mov	dpl,r4
	mov	dph,r5
;	src/bsp/ms51_bsp.c:171: return value;
;	src/bsp/ms51_bsp.c:172: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_led_ch1_sense'
;------------------------------------------------------------
;on            Allocated to registers 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:174: void bsp_led_ch1_sense(uint8_t on) { gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, on); }
;	-----------------------------------------
;	 function bsp_led_ch1_sense
;	-----------------------------------------
_bsp_led_ch1_sense:
	mov	_gpio_write_PARM_3,dpl
	mov	_gpio_write_PARM_2,#0x00
	mov	dpl, #0x02
	ljmp	_gpio_write
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_led_ch2_sense'
;------------------------------------------------------------
;on            Allocated to registers 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:175: void bsp_led_ch2_sense(uint8_t on) { gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, on); }
;	-----------------------------------------
;	 function bsp_led_ch2_sense
;	-----------------------------------------
_bsp_led_ch2_sense:
	mov	_gpio_write_PARM_3,dpl
	mov	_gpio_write_PARM_2,#0x01
	mov	dpl, #0x02
	ljmp	_gpio_write
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_led_ch1_fault'
;------------------------------------------------------------
;on            Allocated to registers 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:176: void bsp_led_ch1_fault(uint8_t on) { gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, on); }
;	-----------------------------------------
;	 function bsp_led_ch1_fault
;	-----------------------------------------
_bsp_led_ch1_fault:
	mov	_gpio_write_PARM_3,dpl
	mov	_gpio_write_PARM_2,#0x02
	mov	dpl, #0x02
	ljmp	_gpio_write
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_led_ch2_fault'
;------------------------------------------------------------
;on            Allocated to registers 
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:177: void bsp_led_ch2_fault(uint8_t on) { gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, on); }
;	-----------------------------------------
;	 function bsp_led_ch2_fault
;	-----------------------------------------
_bsp_led_ch2_fault:
	mov	_gpio_write_PARM_3,dpl
	mov	_gpio_write_PARM_2,#0x03
	mov	dpl, #0x02
	ljmp	_gpio_write
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_clear_wdt'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:179: void bsp_clear_wdt(void)
;	-----------------------------------------
;	 function bsp_clear_wdt
;	-----------------------------------------
_bsp_clear_wdt:
;	src/bsp/ms51_bsp.c:181: WDCON |= WDCON_WDCLR;
	orl	_WDCON,#0x80
;	src/bsp/ms51_bsp.c:182: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'bsp_hardware_failure'
;------------------------------------------------------------
;	src/bsp/ms51_bsp.c:184: void bsp_hardware_failure(void)
;	-----------------------------------------
;	 function bsp_hardware_failure
;	-----------------------------------------
_bsp_hardware_failure:
;	src/bsp/ms51_bsp.c:186: bsp_led_ch1_sense(0U);
	mov	dpl, #0x00
	lcall	_bsp_led_ch1_sense
;	src/bsp/ms51_bsp.c:187: bsp_led_ch2_sense(0U);
	mov	dpl, #0x00
	lcall	_bsp_led_ch2_sense
;	src/bsp/ms51_bsp.c:188: bsp_led_ch1_fault(0U);
	mov	dpl, #0x00
	lcall	_bsp_led_ch1_fault
;	src/bsp/ms51_bsp.c:189: bsp_led_ch2_fault(0U);
	mov	dpl, #0x00
	lcall	_bsp_led_ch2_fault
;	src/bsp/ms51_bsp.c:190: while (1) {
00102$:
;	src/bsp/ms51_bsp.c:193: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
