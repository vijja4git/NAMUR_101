;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Mac OS X ppc)
;--------------------------------------------------------
	.module namur_logic
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _namur_logic_update_PARM_4
	.globl _namur_logic_update_PARM_3
	.globl _namur_logic_update_PARM_2
	.globl _namur_logic_init
	.globl _namur_logic_update
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
_update_channel_PARM_2:
	.ds 2
_update_channel_PARM_3:
	.ds 1
_update_channel_PARM_4:
	.ds 1
_update_channel_ch_10000_34:
	.ds 3
_namur_logic_update_PARM_2:
	.ds 2
_namur_logic_update_PARM_3:
	.ds 2
_namur_logic_update_PARM_4:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_ema_filter_PARM_2:
	.ds 3
	.area	OSEG    (OVR,DATA)
_debounce_channel_ch_10000_10:
	.ds 3
_debounce_channel_sloc0_1_0:
	.ds 3
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_sense_from_latch_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_namur_logic_init_ctx_10000_40:
	.ds 3
_namur_logic_init_i_10000_41:
	.ds 1
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
_namur_logic_update_sloc0_1_0:
	.ds 1
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
;Allocation info for local variables in function 'classify_adc'
;------------------------------------------------------------
;adc           Allocated to registers r6 r7 
;------------------------------------------------------------
;	src/app/namur_logic.c:11: static namur_instant_class_t classify_adc(uint16_t adc)
;	-----------------------------------------
;	 function classify_adc
;	-----------------------------------------
_classify_adc:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6, dpl
	mov	r7, dph
;	src/app/namur_logic.c:13: if (NAMUR_ADC_IS_LEAD_BREAK(adc)) {
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,r4
	subb	a,#0x3d
	mov	a,r5
	subb	a,#0x00
	jnc	00102$
;	src/app/namur_logic.c:14: return NAMUR_INSTANT_LEAD_BREAK;
	mov	dpl, #0x02
	ret
00102$:
;	src/app/namur_logic.c:16: if (NAMUR_ADC_IS_SHORT_CIRCUIT(adc)) {
	clr	c
	mov	a,#0xe3
	subb	a,r4
	mov	a,#0x02
	subb	a,r5
	jnc	00104$
;	src/app/namur_logic.c:17: return NAMUR_INSTANT_SHORT;
	mov	dpl, #0x03
	ret
00104$:
;	src/app/namur_logic.c:19: if (NAMUR_ADC_SHOULD_LATCH_ON(adc) || NAMUR_ADC_SHOULD_LATCH_OFF(adc)) {
	mov	a,r6
	orl	a,r7
	jnz	00105$
	clr	c
	mov	a,r4
	subb	a,#0xeb
	mov	a,r5
	subb	a,#0x01
	jnc	00106$
00105$:
;	src/app/namur_logic.c:20: return NAMUR_INSTANT_NORMAL;
	mov	dpl, #0x00
	ret
00106$:
;	src/app/namur_logic.c:22: return NAMUR_INSTANT_HYST;
	mov	dpl, #0x01
;	src/app/namur_logic.c:23: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ema_filter'
;------------------------------------------------------------
;filtered      Allocated with name '_ema_filter_PARM_2'
;raw           Allocated to registers r6 r7 
;delta         Allocated to registers r6 r7 
;------------------------------------------------------------
;	src/app/namur_logic.c:25: static void ema_filter(uint16_t raw, uint16_t *filtered)
;	-----------------------------------------
;	 function ema_filter
;	-----------------------------------------
_ema_filter:
	mov	r6, dpl
	mov	r7, dph
;	src/app/namur_logic.c:27: int16_t delta = (int16_t)raw - (int16_t)(*filtered);
	mov	r3,_ema_filter_PARM_2
	mov	r4,(_ema_filter_PARM_2 + 1)
	mov	r5,(_ema_filter_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r6
	clr	c
	subb	a,r1
	mov	r6,a
	mov	a,r7
	subb	a,r2
;	src/app/namur_logic.c:28: *filtered = (uint16_t)((int16_t)(*filtered) + (delta >> BSP_EMA_ALPHA_SHIFT));
	swap	a
	rl	a
	xch	a,r6
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x1f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	jnb	acc.4,00103$
	orl	a,#0xffffffe0
00103$:
	mov	r7,a
	mov	a,r6
	add	a, r1
	mov	r1,a
	mov	a,r7
	addc	a, r2
	mov	r2,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r1
	lcall	__gptrput
	inc	dptr
	mov	a,r2
;	src/app/namur_logic.c:29: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'debounce_channel'
;------------------------------------------------------------
;ch            Allocated with name '_debounce_channel_ch_10000_10'
;sloc0         Allocated with name '_debounce_channel_sloc0_1_0'
;------------------------------------------------------------
;	src/app/namur_logic.c:31: static void debounce_channel(namur_channel_t *ch)
;	-----------------------------------------
;	 function debounce_channel
;	-----------------------------------------
_debounce_channel:
	mov	_debounce_channel_ch_10000_10,dpl
	mov	(_debounce_channel_ch_10000_10 + 1),dph
	mov	(_debounce_channel_ch_10000_10 + 2),b
;	src/app/namur_logic.c:33: if (ch->instant == ch->pending) {
	mov	a,#0x02
	add	a, _debounce_channel_ch_10000_10
	mov	r2,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	r3,a
	mov	r4,(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x03
	add	a, _debounce_channel_ch_10000_10
	mov	r1,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	r2,a
	mov	r3,(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r0,a
	mov	a,r4
	cjne	a,ar0,00104$
;	src/app/namur_logic.c:34: if (ch->debounce_count < BSP_DEBOUNCE_CYCLES) {
	mov	a,#0x04
	add	a, _debounce_channel_ch_10000_10
	mov	_debounce_channel_sloc0_1_0,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	(_debounce_channel_sloc0_1_0 + 1),a
	mov	(_debounce_channel_sloc0_1_0 + 2),(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,_debounce_channel_sloc0_1_0
	mov	dph,(_debounce_channel_sloc0_1_0 + 1)
	mov	b,(_debounce_channel_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r0,a
	cjne	r0,#0x04,00130$
00130$:
	jnc	00105$
;	src/app/namur_logic.c:35: ch->debounce_count++;
	inc	r0
	mov	dpl,_debounce_channel_sloc0_1_0
	mov	dph,(_debounce_channel_sloc0_1_0 + 1)
	mov	b,(_debounce_channel_sloc0_1_0 + 2)
	mov	a,r0
	lcall	__gptrput
	sjmp	00105$
00104$:
;	src/app/namur_logic.c:38: ch->pending = ch->instant;
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	mov	a,r4
	lcall	__gptrput
;	src/app/namur_logic.c:39: ch->debounce_count = 1U;
	mov	a,#0x04
	add	a, _debounce_channel_ch_10000_10
	mov	r0,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	r4,a
	mov	r7,(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,r0
	mov	dph,r4
	mov	b,r7
	mov	a,#0x01
	lcall	__gptrput
00105$:
;	src/app/namur_logic.c:42: if (ch->debounce_count >= BSP_DEBOUNCE_CYCLES) {
	mov	a,#0x04
	add	a, _debounce_channel_ch_10000_10
	mov	r5,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	r6,a
	mov	r7,(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	cjne	r5,#0x04,00132$
00132$:
	jc	00108$
;	src/app/namur_logic.c:43: ch->stable = ch->pending;
	mov	a,#0x05
	add	a, _debounce_channel_ch_10000_10
	mov	r5,a
	clr	a
	addc	a, (_debounce_channel_ch_10000_10 + 1)
	mov	r6,a
	mov	r7,(_debounce_channel_ch_10000_10 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
;	src/app/namur_logic.c:45: }
	ljmp	__gptrput
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'apply_fault'
;------------------------------------------------------------
;ch            Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	src/app/namur_logic.c:47: static void apply_fault(namur_channel_t *ch)
;	-----------------------------------------
;	 function apply_fault
;	-----------------------------------------
_apply_fault:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	src/app/namur_logic.c:49: if (ch->stable == NAMUR_INSTANT_LEAD_BREAK) {
	mov	a,#0x05
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x02,00105$
;	src/app/namur_logic.c:50: ch->fault = NAMUR_FAULT_LEAD_BREAK;
	mov	a,#0x06
	add	a, r5
	mov	r1,a
	clr	a
	addc	a, r6
	mov	r2,a
	mov	ar3,r7
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	mov	a,#0x01
	ljmp	__gptrput
00105$:
;	src/app/namur_logic.c:51: } else if (ch->stable == NAMUR_INSTANT_SHORT) {
	cjne	r4,#0x03,00102$
;	src/app/namur_logic.c:52: ch->fault = NAMUR_FAULT_SHORT_CIRCUIT;
	mov	a,#0x06
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0x02
	ljmp	__gptrput
00102$:
;	src/app/namur_logic.c:54: ch->fault = NAMUR_FAULT_NONE;
	mov	a,#0x06
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
;	src/app/namur_logic.c:56: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'apply_latch'
;------------------------------------------------------------
;ch            Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	src/app/namur_logic.c:58: static void apply_latch(namur_channel_t *ch)
;	-----------------------------------------
;	 function apply_latch
;	-----------------------------------------
_apply_latch:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	src/app/namur_logic.c:60: if (ch->fault != NAMUR_FAULT_NONE) {
	mov	a,#0x06
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jz	00102$
;	src/app/namur_logic.c:61: return;
	ret
00102$:
;	src/app/namur_logic.c:64: if (NAMUR_ADC_SHOULD_LATCH_ON(ch->filtered_adc)) {
	mov	ar3,r5
	mov	ar2,r6
	mov	ar4,r7
	mov	dpl,r3
	mov	dph,r2
	mov	b,r4
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	orl	a,r3
	jz	00106$
;	src/app/namur_logic.c:65: ch->latched_on = 1U;
	mov	a,#0x07
	add	a, r5
	mov	r0,a
	clr	a
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,#0x01
	ljmp	__gptrput
00106$:
;	src/app/namur_logic.c:66: } else if (NAMUR_ADC_SHOULD_LATCH_OFF(ch->filtered_adc)) {
	clr	c
	mov	a,r3
	subb	a,#0xeb
	mov	a,r4
	subb	a,#0x01
	jnc	00108$
;	src/app/namur_logic.c:67: ch->latched_on = 0U;
	mov	a,#0x07
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
;	src/app/namur_logic.c:69: }
	ljmp	__gptrput
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sense_from_latch'
;------------------------------------------------------------
;dip_nc        Allocated with name '_sense_from_latch_PARM_2'
;latched_on    Allocated to registers r7 
;sense         Allocated to registers r6 
;------------------------------------------------------------
;	src/app/namur_logic.c:71: static uint8_t sense_from_latch(uint8_t latched_on, uint8_t dip_nc)
;	-----------------------------------------
;	 function sense_from_latch
;	-----------------------------------------
_sense_from_latch:
	mov	r7, dpl
;	src/app/namur_logic.c:73: uint8_t sense = latched_on;
	mov	ar6,r7
;	src/app/namur_logic.c:75: if (dip_nc) {
	mov	a,_sense_from_latch_PARM_2
	jz	00102$
;	src/app/namur_logic.c:76: sense = (uint8_t)(sense ? 0U : 1U);
	mov	a,r7
	jz	00105$
	mov	r7,#0x00
	sjmp	00106$
00105$:
	mov	r7,#0x01
00106$:
	mov	ar6,r7
00102$:
;	src/app/namur_logic.c:78: return sense;
	mov	dpl, r6
;	src/app/namur_logic.c:79: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'fault_blink_on'
;------------------------------------------------------------
;ch            Allocated to registers r5 r6 r7 
;half          Allocated to registers r2 r3 
;------------------------------------------------------------
;	src/app/namur_logic.c:81: static uint8_t fault_blink_on(const namur_channel_t *ch)
;	-----------------------------------------
;	 function fault_blink_on
;	-----------------------------------------
_fault_blink_on:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	src/app/namur_logic.c:85: if (ch->fault == NAMUR_FAULT_LEAD_BREAK) {
	mov	a,#0x06
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x01,00105$
;	src/app/namur_logic.c:86: half = BSP_BLINK_LEAD_BREAK_HALF_TICKS;
	mov	r2,#0x19
	mov	r3,#0x00
	sjmp	00106$
00105$:
;	src/app/namur_logic.c:87: } else if (ch->fault == NAMUR_FAULT_SHORT_CIRCUIT) {
	cjne	r4,#0x02,00102$
;	src/app/namur_logic.c:88: half = BSP_BLINK_SHORT_HALF_TICKS;
	mov	r2,#0x05
	mov	r3,#0x00
	sjmp	00106$
00102$:
;	src/app/namur_logic.c:90: return 0U;
	mov	dpl, #0x00
	ret
00106$:
;	src/app/namur_logic.c:93: return (uint8_t)(((ch->blink_tick / half) & 1U) == 0U);
	mov	a,#0x08
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	__divuint_PARM_2,r2
	mov	(__divuint_PARM_2 + 1),r3
	mov	dpl, r5
	mov	dph, r6
	lcall	__divuint
	mov	r6, dpl
	anl	ar6,#0x01
	clr	a
	mov	r7,a
	cjne	r6,#0x00,00125$
	cjne	r7,#0x00,00125$
	inc	a
00125$:
	mov	dpl,a
;	src/app/namur_logic.c:94: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_channel'
;------------------------------------------------------------
;raw_adc       Allocated with name '_update_channel_PARM_2'
;dip_nc        Allocated with name '_update_channel_PARM_3'
;fault_suppress Allocated with name '_update_channel_PARM_4'
;ch            Allocated with name '_update_channel_ch_10000_34'
;------------------------------------------------------------
;	src/app/namur_logic.c:96: static void update_channel(namur_channel_t *ch, uint16_t raw_adc, uint8_t dip_nc, uint8_t fault_suppress)
;	-----------------------------------------
;	 function update_channel
;	-----------------------------------------
_update_channel:
	mov	_update_channel_ch_10000_34,dpl
	mov	(_update_channel_ch_10000_34 + 1),dph
	mov	(_update_channel_ch_10000_34 + 2),b
;	src/app/namur_logic.c:98: ema_filter(raw_adc, &ch->filtered_adc);
	mov	_ema_filter_PARM_2,_update_channel_ch_10000_34
	mov	(_ema_filter_PARM_2 + 1),(_update_channel_ch_10000_34 + 1)
	mov	(_ema_filter_PARM_2 + 2),(_update_channel_ch_10000_34 + 2)
	mov	dpl, _update_channel_PARM_2
	mov	dph, (_update_channel_PARM_2 + 1)
	lcall	_ema_filter
;	src/app/namur_logic.c:99: ch->instant = classify_adc(ch->filtered_adc);
	mov	a,#0x02
	add	a, _update_channel_ch_10000_34
	mov	r2,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r3,a
	mov	r4,(_update_channel_ch_10000_34 + 2)
	mov	r0,_update_channel_ch_10000_34
	mov	r1,(_update_channel_ch_10000_34 + 1)
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r7
	lcall	__gptrget
	mov	r0,a
	inc	dptr
	lcall	__gptrget
	mov	r1,a
	mov	dpl, r0
	mov	dph, r1
	push	ar4
	push	ar3
	push	ar2
	lcall	_classify_adc
	mov	r7, dpl
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	lcall	__gptrput
;	src/app/namur_logic.c:100: debounce_channel(ch);
	mov	dpl, _update_channel_ch_10000_34
	mov	dph, (_update_channel_ch_10000_34 + 1)
	mov	b, (_update_channel_ch_10000_34 + 2)
	lcall	_debounce_channel
;	src/app/namur_logic.c:102: if (fault_suppress) {
	mov	a,_update_channel_PARM_4
	jz	00102$
;	src/app/namur_logic.c:103: ch->fault = NAMUR_FAULT_NONE;
	mov	a,#0x06
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	sjmp	00103$
00102$:
;	src/app/namur_logic.c:105: apply_fault(ch);
	mov	dpl, _update_channel_ch_10000_34
	mov	dph, (_update_channel_ch_10000_34 + 1)
	mov	b, (_update_channel_ch_10000_34 + 2)
	lcall	_apply_fault
00103$:
;	src/app/namur_logic.c:108: apply_latch(ch);
	mov	dpl, _update_channel_ch_10000_34
	mov	dph, (_update_channel_ch_10000_34 + 1)
	mov	b, (_update_channel_ch_10000_34 + 2)
	lcall	_apply_latch
;	src/app/namur_logic.c:110: if (ch->fault != NAMUR_FAULT_NONE) {
	mov	a,#0x06
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00105$
;	src/app/namur_logic.c:111: ch->sense_led = 0U;
	mov	a,#0x0a
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:112: ch->blink_tick++;
	mov	a,#0x08
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	r3
	cjne	r3,#0x00,00123$
	inc	r4
00123$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	src/app/namur_logic.c:113: ch->fault_led = fault_blink_on(ch);
	mov	a,#0x0b
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl, _update_channel_ch_10000_34
	mov	dph, (_update_channel_ch_10000_34 + 1)
	mov	b, (_update_channel_ch_10000_34 + 2)
	push	ar7
	push	ar6
	push	ar5
	lcall	_fault_blink_on
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	ljmp	__gptrput
00105$:
;	src/app/namur_logic.c:115: ch->fault_led = 0U;
	mov	a,#0x0b
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:116: ch->blink_tick = 0U;
	mov	a,#0x08
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	src/app/namur_logic.c:117: ch->sense_led = sense_from_latch(ch->latched_on, dip_nc);
	mov	a,#0x0a
	add	a, _update_channel_ch_10000_34
	mov	r5,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r6,a
	mov	r7,(_update_channel_ch_10000_34 + 2)
	mov	a,#0x07
	add	a, _update_channel_ch_10000_34
	mov	r2,a
	clr	a
	addc	a, (_update_channel_ch_10000_34 + 1)
	mov	r3,a
	mov	r4,(_update_channel_ch_10000_34 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	mov	_sense_from_latch_PARM_2,_update_channel_PARM_3
	mov	dpl, r2
	push	ar7
	push	ar6
	push	ar5
	lcall	_sense_from_latch
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
;	src/app/namur_logic.c:119: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'namur_logic_init'
;------------------------------------------------------------
;ctx           Allocated with name '_namur_logic_init_ctx_10000_40'
;i             Allocated with name '_namur_logic_init_i_10000_41'
;------------------------------------------------------------
;	src/app/namur_logic.c:121: void namur_logic_init(namur_logic_t *ctx)
;	-----------------------------------------
;	 function namur_logic_init
;	-----------------------------------------
_namur_logic_init:
	mov	_namur_logic_init_ctx_10000_40,dpl
	mov	(_namur_logic_init_ctx_10000_40 + 1),dph
	mov	(_namur_logic_init_ctx_10000_40 + 2),b
;	src/app/namur_logic.c:125: for (i = 0; i < NAMUR_LOGIC_CHANNELS; i++) {
	mov	r2,_namur_logic_init_ctx_10000_40
	mov	r3,(_namur_logic_init_ctx_10000_40 + 1)
	mov	r4,(_namur_logic_init_ctx_10000_40 + 2)
	mov	_namur_logic_init_i_10000_41,#0x00
00102$:
;	src/app/namur_logic.c:126: ctx->ch[i].filtered_adc = 0U;
	mov	a,_namur_logic_init_i_10000_41
	mov	b,#0x0c
	mul	ab
	mov	r0,a
	add	a, r2
	mov	r5,a
	clr	a
	addc	a, r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	src/app/namur_logic.c:127: ctx->ch[i].instant = NAMUR_INSTANT_HYST;
	mov	a,r0
	add	a, _namur_logic_init_ctx_10000_40
	mov	r0,a
	clr	a
	addc	a, (_namur_logic_init_ctx_10000_40 + 1)
	mov	r7,a
	mov	r6,(_namur_logic_init_ctx_10000_40 + 2)
	push	ar2
	push	ar3
	push	ar4
	mov	a,#0x02
	add	a, r0
	mov	r1,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r1
	mov	dph,r4
	mov	b,r5
	mov	a,#0x01
	lcall	__gptrput
;	src/app/namur_logic.c:128: ctx->ch[i].pending = NAMUR_INSTANT_HYST;
	mov	a,#0x03
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,#0x01
	lcall	__gptrput
;	src/app/namur_logic.c:129: ctx->ch[i].stable = NAMUR_INSTANT_HYST;
	mov	a,#0x05
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,#0x01
	lcall	__gptrput
;	src/app/namur_logic.c:130: ctx->ch[i].debounce_count = 0U;
	mov	a,#0x04
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:131: ctx->ch[i].fault = NAMUR_FAULT_NONE;
	mov	a,#0x06
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:132: ctx->ch[i].latched_on = 0U;
	mov	a,#0x07
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:133: ctx->ch[i].blink_tick = 0U;
	mov	a,#0x08
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	src/app/namur_logic.c:134: ctx->ch[i].sense_led = 0U;
	mov	a,#0x0a
	add	a, r0
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	ar5,r6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:135: ctx->ch[i].fault_led = 0U;
	mov	a,#0x0b
	add	a, r0
	mov	r0,a
	clr	a
	addc	a, r7
	mov	r7,a
	mov	dpl,r0
	mov	dph,r7
	mov	b,r6
	clr	a
	lcall	__gptrput
;	src/app/namur_logic.c:125: for (i = 0; i < NAMUR_LOGIC_CHANNELS; i++) {
	inc	_namur_logic_init_i_10000_41
	clr	c
	mov	a,_namur_logic_init_i_10000_41
	subb	a,#0x02
	pop	ar4
	pop	ar3
	pop	ar2
	jnc	00119$
	ljmp	00102$
00119$:
;	src/app/namur_logic.c:137: ctx->dip = 0U;
	mov	a,#0x18
	add	a, _namur_logic_init_ctx_10000_40
	mov	r5,a
	clr	a
	addc	a, (_namur_logic_init_ctx_10000_40 + 1)
	mov	r6,a
	mov	r7,(_namur_logic_init_ctx_10000_40 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
;	src/app/namur_logic.c:138: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'namur_logic_update'
;------------------------------------------------------------
;adc_ch1       Allocated with name '_namur_logic_update_PARM_2'
;adc_ch2       Allocated with name '_namur_logic_update_PARM_3'
;dip           Allocated with name '_namur_logic_update_PARM_4'
;ctx           Allocated to registers r5 r6 r7 
;fault_suppress Allocated to registers r3 
;dip_ch1_nc    Allocated to registers 
;dip_ch2_nc    Allocated to registers r4 
;------------------------------------------------------------
;	src/app/namur_logic.c:140: void namur_logic_update(namur_logic_t *ctx, uint16_t adc_ch1, uint16_t adc_ch2, uint8_t dip)
;	-----------------------------------------
;	 function namur_logic_update
;	-----------------------------------------
_namur_logic_update:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	src/app/namur_logic.c:142: uint8_t fault_suppress = (uint8_t)((dip & NAMUR_DIP_FAULT_SUPPRESS) != 0U);
	mov	r4,_namur_logic_update_PARM_4
	mov	a,#0x04
	anl	a,r4
	cjne	a,#0x01,00103$
00103$:
	cpl	c
	mov	_namur_logic_update_sloc0_1_0,c
	clr	a
	rlc	a
	mov	r3,a
;	src/app/namur_logic.c:143: uint8_t dip_ch1_nc = (uint8_t)((dip & NAMUR_DIP_CH1_NC) != 0U);
	mov	a,#0x01
	anl	a,r4
	cjne	a,#0x01,00104$
00104$:
	cpl	c
	mov	_namur_logic_update_sloc0_1_0,c
	clr	a
	rlc	a
	mov	_update_channel_PARM_3,a
;	src/app/namur_logic.c:144: uint8_t dip_ch2_nc = (uint8_t)((dip & NAMUR_DIP_CH2_NC) != 0U);
	anl	ar4,#0x02
	mov	a,r4
	cjne	a,#0x01,00105$
00105$:
	cpl	c
	mov	_namur_logic_update_sloc0_1_0,c
	clr	a
	rlc	a
	mov	r4,a
;	src/app/namur_logic.c:146: ctx->dip = dip;
	mov	a,#0x18
	add	a, r5
	mov	r0,a
	clr	a
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,_namur_logic_update_PARM_4
	lcall	__gptrput
;	src/app/namur_logic.c:148: update_channel(&ctx->ch[0], adc_ch1, dip_ch1_nc, fault_suppress);
	mov	ar0,r5
	mov	ar1,r6
	mov	ar2,r7
	mov	_update_channel_PARM_2,_namur_logic_update_PARM_2
	mov	(_update_channel_PARM_2 + 1),(_namur_logic_update_PARM_2 + 1)
	mov	_update_channel_PARM_4,r3
	mov	dpl, r0
	mov	dph, r1
	mov	b, r2
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_update_channel
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	src/app/namur_logic.c:149: update_channel(&ctx->ch[1], adc_ch2, dip_ch2_nc, fault_suppress);
	mov	a,#0x0c
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	_update_channel_PARM_2,_namur_logic_update_PARM_3
	mov	(_update_channel_PARM_2 + 1),(_namur_logic_update_PARM_3 + 1)
	mov	_update_channel_PARM_3,r4
	mov	_update_channel_PARM_4,r3
	mov	dpl, r5
	mov	dph, r6
	mov	b, r7
;	src/app/namur_logic.c:150: }
	ljmp	_update_channel
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
