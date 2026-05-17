;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Mac OS X ppc)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _namur_logic_update
	.globl _namur_logic_init
	.globl _bsp_clear_wdt
	.globl _bsp_led_ch2_fault
	.globl _bsp_led_ch1_fault
	.globl _bsp_led_ch2_sense
	.globl _bsp_led_ch1_sense
	.globl _bsp_adc_read_channel
	.globl _bsp_read_dip
	.globl _bsp_delay_ms
	.globl _bsp_init
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
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
_g_logic:
	.ds 25
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
; restartable atomic support routines
	.ds	5
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;dip           Allocated to registers r7 
;adc1          Allocated to registers r5 r6 
;adc2          Allocated to registers 
;------------------------------------------------------------
;	src/main.c:13: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	src/main.c:15: namur_logic_init(&g_logic);
	mov	dptr,#_g_logic
	mov	b, #0x40
	lcall	_namur_logic_init
;	src/main.c:16: bsp_init();
	lcall	_bsp_init
00102$:
;	src/main.c:19: uint8_t dip = bsp_read_dip();
	lcall	_bsp_read_dip
	mov	r7, dpl
;	src/main.c:20: uint16_t adc1 = bsp_adc_read_channel(NAMUR_ADC_CH1);
	mov	dpl, #0x00
	push	ar7
	lcall	_bsp_adc_read_channel
	mov	r5, dpl
	mov	r6, dph
;	src/main.c:21: uint16_t adc2 = bsp_adc_read_channel(NAMUR_ADC_CH2);
	mov	dpl, #0x01
	push	ar6
	push	ar5
	lcall	_bsp_adc_read_channel
	mov	_namur_logic_update_PARM_3,dpl
	mov	(_namur_logic_update_PARM_3 + 1),dph
	pop	ar5
	pop	ar6
	pop	ar7
;	src/main.c:23: namur_logic_update(&g_logic, adc1, adc2, dip);
	mov	_namur_logic_update_PARM_2,r5
	mov	(_namur_logic_update_PARM_2 + 1),r6
	mov	_namur_logic_update_PARM_4,r7
	mov	dptr,#_g_logic
	mov	b, #0x40
	lcall	_namur_logic_update
;	src/main.c:25: bsp_led_ch1_sense(g_logic.ch[0].sense_led);
	mov	dpl,(_g_logic + 0x000a)
	lcall	_bsp_led_ch1_sense
;	src/main.c:26: bsp_led_ch2_sense(g_logic.ch[1].sense_led);
	mov	dpl,(_g_logic + 0x0016)
	lcall	_bsp_led_ch2_sense
;	src/main.c:27: bsp_led_ch1_fault(g_logic.ch[0].fault_led);
	mov	dpl,(_g_logic + 0x000b)
	lcall	_bsp_led_ch1_fault
;	src/main.c:28: bsp_led_ch2_fault(g_logic.ch[1].fault_led);
	mov	dpl,(_g_logic + 0x0017)
	lcall	_bsp_led_ch2_fault
;	src/main.c:30: bsp_clear_wdt();
	lcall	_bsp_clear_wdt
;	src/main.c:31: bsp_delay_ms(BSP_LOOP_MS);
	mov	dptr,#0x0014
	lcall	_bsp_delay_ms
;	src/main.c:33: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
