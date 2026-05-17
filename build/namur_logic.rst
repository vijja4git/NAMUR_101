                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module namur_logic
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _namur_logic_update_PARM_4
                                     12 	.globl _namur_logic_update_PARM_3
                                     13 	.globl _namur_logic_update_PARM_2
                                     14 	.globl _namur_logic_init
                                     15 	.globl _namur_logic_update
                                     16 ;--------------------------------------------------------
                                     17 ; special function registers
                                     18 ;--------------------------------------------------------
                                     19 	.area RSEG    (ABS,DATA)
      000000                         20 	.org 0x0000
                                     21 ;--------------------------------------------------------
                                     22 ; special function bits
                                     23 ;--------------------------------------------------------
                                     24 	.area RSEG    (ABS,DATA)
      000000                         25 	.org 0x0000
                                     26 ;--------------------------------------------------------
                                     27 ; overlayable register banks
                                     28 ;--------------------------------------------------------
                                     29 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                         30 	.ds 8
                                     31 ;--------------------------------------------------------
                                     32 ; internal ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DSEG    (DATA)
      000008                         35 _update_channel_PARM_2:
      000008                         36 	.ds 2
      00000A                         37 _update_channel_PARM_3:
      00000A                         38 	.ds 1
      00000B                         39 _update_channel_PARM_4:
      00000B                         40 	.ds 1
      00000C                         41 _update_channel_ch_10000_34:
      00000C                         42 	.ds 3
      00000F                         43 _namur_logic_update_PARM_2:
      00000F                         44 	.ds 2
      000011                         45 _namur_logic_update_PARM_3:
      000011                         46 	.ds 2
      000013                         47 _namur_logic_update_PARM_4:
      000013                         48 	.ds 1
                                     49 ;--------------------------------------------------------
                                     50 ; overlayable items in internal ram
                                     51 ;--------------------------------------------------------
                                     52 	.area	OSEG    (OVR,DATA)
                                     53 	.area	OSEG    (OVR,DATA)
      000014                         54 _ema_filter_PARM_2:
      000014                         55 	.ds 3
                                     56 	.area	OSEG    (OVR,DATA)
      000014                         57 _debounce_channel_ch_10000_10:
      000014                         58 	.ds 3
      000017                         59 _debounce_channel_sloc0_1_0:
      000017                         60 	.ds 3
                                     61 	.area	OSEG    (OVR,DATA)
                                     62 	.area	OSEG    (OVR,DATA)
                                     63 	.area	OSEG    (OVR,DATA)
      000014                         64 _sense_from_latch_PARM_2:
      000014                         65 	.ds 1
                                     66 	.area	OSEG    (OVR,DATA)
      000014                         67 _namur_logic_init_ctx_10000_40:
      000014                         68 	.ds 3
      000017                         69 _namur_logic_init_i_10000_41:
      000017                         70 	.ds 1
                                     71 ;--------------------------------------------------------
                                     72 ; indirectly addressable internal ram data
                                     73 ;--------------------------------------------------------
                                     74 	.area ISEG    (DATA)
                                     75 ;--------------------------------------------------------
                                     76 ; absolute internal ram data
                                     77 ;--------------------------------------------------------
                                     78 	.area IABS    (ABS,DATA)
                                     79 	.area IABS    (ABS,DATA)
                                     80 ;--------------------------------------------------------
                                     81 ; bit data
                                     82 ;--------------------------------------------------------
                                     83 	.area BSEG    (BIT)
      000000                         84 _namur_logic_update_sloc0_1_0:
      000000                         85 	.ds 1
                                     86 ;--------------------------------------------------------
                                     87 ; paged external ram data
                                     88 ;--------------------------------------------------------
                                     89 	.area PSEG    (PAG,XDATA)
                                     90 ;--------------------------------------------------------
                                     91 ; uninitialized external ram data
                                     92 ;--------------------------------------------------------
                                     93 	.area XSEG    (XDATA)
                                     94 ;--------------------------------------------------------
                                     95 ; absolute external ram data
                                     96 ;--------------------------------------------------------
                                     97 	.area XABS    (ABS,XDATA)
                                     98 ;--------------------------------------------------------
                                     99 ; initialized external ram data
                                    100 ;--------------------------------------------------------
                                    101 	.area XISEG   (XDATA)
                                    102 	.area HOME    (CODE)
                                    103 	.area GSINIT0 (CODE)
                                    104 	.area GSINIT1 (CODE)
                                    105 	.area GSINIT2 (CODE)
                                    106 	.area GSINIT3 (CODE)
                                    107 	.area GSINIT4 (CODE)
                                    108 	.area GSINIT5 (CODE)
                                    109 	.area GSINIT  (CODE)
                                    110 	.area GSFINAL (CODE)
                                    111 	.area CSEG    (CODE)
                                    112 ;--------------------------------------------------------
                                    113 ; global & static initialisations
                                    114 ;--------------------------------------------------------
                                    115 	.area HOME    (CODE)
                                    116 	.area GSINIT  (CODE)
                                    117 	.area GSFINAL (CODE)
                                    118 	.area GSINIT  (CODE)
                                    119 ;--------------------------------------------------------
                                    120 ; Home
                                    121 ;--------------------------------------------------------
                                    122 	.area HOME    (CODE)
                                    123 	.area HOME    (CODE)
                                    124 ;--------------------------------------------------------
                                    125 ; code
                                    126 ;--------------------------------------------------------
                                    127 	.area CSEG    (CODE)
                                    128 ;------------------------------------------------------------
                                    129 ;Allocation info for local variables in function 'classify_adc'
                                    130 ;------------------------------------------------------------
                                    131 ;adc           Allocated to registers r6 r7 
                                    132 ;------------------------------------------------------------
                                    133 ;	src/app/namur_logic.c:11: static namur_instant_class_t classify_adc(uint16_t adc)
                                    134 ;	-----------------------------------------
                                    135 ;	 function classify_adc
                                    136 ;	-----------------------------------------
      0003B2                        137 _classify_adc:
                           000007   138 	ar7 = 0x07
                           000006   139 	ar6 = 0x06
                           000005   140 	ar5 = 0x05
                           000004   141 	ar4 = 0x04
                           000003   142 	ar3 = 0x03
                           000002   143 	ar2 = 0x02
                           000001   144 	ar1 = 0x01
                           000000   145 	ar0 = 0x00
      0003B2 AE 82            [24]  146 	mov	r6, dpl
      0003B4 AF 83            [24]  147 	mov	r7, dph
                                    148 ;	src/app/namur_logic.c:13: if (NAMUR_ADC_IS_LEAD_BREAK(adc)) {
      0003B6 8E 04            [24]  149 	mov	ar4,r6
      0003B8 8F 05            [24]  150 	mov	ar5,r7
      0003BA C3               [12]  151 	clr	c
      0003BB EC               [12]  152 	mov	a,r4
      0003BC 94 3D            [12]  153 	subb	a,#0x3d
      0003BE ED               [12]  154 	mov	a,r5
      0003BF 94 00            [12]  155 	subb	a,#0x00
      0003C1 50 04            [24]  156 	jnc	00102$
                                    157 ;	src/app/namur_logic.c:14: return NAMUR_INSTANT_LEAD_BREAK;
      0003C3 75 82 02         [24]  158 	mov	dpl, #0x02
      0003C6 22               [24]  159 	ret
      0003C7                        160 00102$:
                                    161 ;	src/app/namur_logic.c:16: if (NAMUR_ADC_IS_SHORT_CIRCUIT(adc)) {
      0003C7 C3               [12]  162 	clr	c
      0003C8 74 E3            [12]  163 	mov	a,#0xe3
      0003CA 9C               [12]  164 	subb	a,r4
      0003CB 74 02            [12]  165 	mov	a,#0x02
      0003CD 9D               [12]  166 	subb	a,r5
      0003CE 50 04            [24]  167 	jnc	00104$
                                    168 ;	src/app/namur_logic.c:17: return NAMUR_INSTANT_SHORT;
      0003D0 75 82 03         [24]  169 	mov	dpl, #0x03
      0003D3 22               [24]  170 	ret
      0003D4                        171 00104$:
                                    172 ;	src/app/namur_logic.c:19: if (NAMUR_ADC_SHOULD_LATCH_ON(adc) || NAMUR_ADC_SHOULD_LATCH_OFF(adc)) {
      0003D4 EE               [12]  173 	mov	a,r6
      0003D5 4F               [12]  174 	orl	a,r7
      0003D6 70 09            [24]  175 	jnz	00105$
      0003D8 C3               [12]  176 	clr	c
      0003D9 EC               [12]  177 	mov	a,r4
      0003DA 94 EB            [12]  178 	subb	a,#0xeb
      0003DC ED               [12]  179 	mov	a,r5
      0003DD 94 01            [12]  180 	subb	a,#0x01
      0003DF 50 04            [24]  181 	jnc	00106$
      0003E1                        182 00105$:
                                    183 ;	src/app/namur_logic.c:20: return NAMUR_INSTANT_NORMAL;
      0003E1 75 82 00         [24]  184 	mov	dpl, #0x00
      0003E4 22               [24]  185 	ret
      0003E5                        186 00106$:
                                    187 ;	src/app/namur_logic.c:22: return NAMUR_INSTANT_HYST;
      0003E5 75 82 01         [24]  188 	mov	dpl, #0x01
                                    189 ;	src/app/namur_logic.c:23: }
      0003E8 22               [24]  190 	ret
                                    191 ;------------------------------------------------------------
                                    192 ;Allocation info for local variables in function 'ema_filter'
                                    193 ;------------------------------------------------------------
                                    194 ;filtered      Allocated with name '_ema_filter_PARM_2'
                                    195 ;raw           Allocated to registers r6 r7 
                                    196 ;delta         Allocated to registers r6 r7 
                                    197 ;------------------------------------------------------------
                                    198 ;	src/app/namur_logic.c:25: static void ema_filter(uint16_t raw, uint16_t *filtered)
                                    199 ;	-----------------------------------------
                                    200 ;	 function ema_filter
                                    201 ;	-----------------------------------------
      0003E9                        202 _ema_filter:
      0003E9 AE 82            [24]  203 	mov	r6, dpl
      0003EB AF 83            [24]  204 	mov	r7, dph
                                    205 ;	src/app/namur_logic.c:27: int16_t delta = (int16_t)raw - (int16_t)(*filtered);
      0003ED AB 14            [24]  206 	mov	r3,_ema_filter_PARM_2
      0003EF AC 15            [24]  207 	mov	r4,(_ema_filter_PARM_2 + 1)
      0003F1 AD 16            [24]  208 	mov	r5,(_ema_filter_PARM_2 + 2)
      0003F3 8B 82            [24]  209 	mov	dpl,r3
      0003F5 8C 83            [24]  210 	mov	dph,r4
      0003F7 8D F0            [24]  211 	mov	b,r5
      0003F9 12 09 90         [24]  212 	lcall	__gptrget
      0003FC F9               [12]  213 	mov	r1,a
      0003FD A3               [24]  214 	inc	dptr
      0003FE 12 09 90         [24]  215 	lcall	__gptrget
      000401 FA               [12]  216 	mov	r2,a
      000402 EE               [12]  217 	mov	a,r6
      000403 C3               [12]  218 	clr	c
      000404 99               [12]  219 	subb	a,r1
      000405 FE               [12]  220 	mov	r6,a
      000406 EF               [12]  221 	mov	a,r7
      000407 9A               [12]  222 	subb	a,r2
                                    223 ;	src/app/namur_logic.c:28: *filtered = (uint16_t)((int16_t)(*filtered) + (delta >> BSP_EMA_ALPHA_SHIFT));
      000408 C4               [12]  224 	swap	a
      000409 23               [12]  225 	rl	a
      00040A CE               [12]  226 	xch	a,r6
      00040B C4               [12]  227 	swap	a
      00040C 23               [12]  228 	rl	a
      00040D 54 1F            [12]  229 	anl	a,#0x1f
      00040F 6E               [12]  230 	xrl	a,r6
      000410 CE               [12]  231 	xch	a,r6
      000411 54 1F            [12]  232 	anl	a,#0x1f
      000413 CE               [12]  233 	xch	a,r6
      000414 6E               [12]  234 	xrl	a,r6
      000415 CE               [12]  235 	xch	a,r6
      000416 30 E4 02         [24]  236 	jnb	acc.4,00103$
      000419 44 E0            [12]  237 	orl	a,#0xffffffe0
      00041B                        238 00103$:
      00041B FF               [12]  239 	mov	r7,a
      00041C EE               [12]  240 	mov	a,r6
      00041D 29               [12]  241 	add	a, r1
      00041E F9               [12]  242 	mov	r1,a
      00041F EF               [12]  243 	mov	a,r7
      000420 3A               [12]  244 	addc	a, r2
      000421 FA               [12]  245 	mov	r2,a
      000422 8B 82            [24]  246 	mov	dpl,r3
      000424 8C 83            [24]  247 	mov	dph,r4
      000426 8D F0            [24]  248 	mov	b,r5
      000428 E9               [12]  249 	mov	a,r1
      000429 12 09 75         [24]  250 	lcall	__gptrput
      00042C A3               [24]  251 	inc	dptr
      00042D EA               [12]  252 	mov	a,r2
                                    253 ;	src/app/namur_logic.c:29: }
      00042E 02 09 75         [24]  254 	ljmp	__gptrput
                                    255 ;------------------------------------------------------------
                                    256 ;Allocation info for local variables in function 'debounce_channel'
                                    257 ;------------------------------------------------------------
                                    258 ;ch            Allocated with name '_debounce_channel_ch_10000_10'
                                    259 ;sloc0         Allocated with name '_debounce_channel_sloc0_1_0'
                                    260 ;------------------------------------------------------------
                                    261 ;	src/app/namur_logic.c:31: static void debounce_channel(namur_channel_t *ch)
                                    262 ;	-----------------------------------------
                                    263 ;	 function debounce_channel
                                    264 ;	-----------------------------------------
      000431                        265 _debounce_channel:
      000431 85 82 14         [24]  266 	mov	_debounce_channel_ch_10000_10,dpl
      000434 85 83 15         [24]  267 	mov	(_debounce_channel_ch_10000_10 + 1),dph
      000437 85 F0 16         [24]  268 	mov	(_debounce_channel_ch_10000_10 + 2),b
                                    269 ;	src/app/namur_logic.c:33: if (ch->instant == ch->pending) {
      00043A 74 02            [12]  270 	mov	a,#0x02
      00043C 25 14            [12]  271 	add	a, _debounce_channel_ch_10000_10
      00043E FA               [12]  272 	mov	r2,a
      00043F E4               [12]  273 	clr	a
      000440 35 15            [12]  274 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      000442 FB               [12]  275 	mov	r3,a
      000443 AC 16            [24]  276 	mov	r4,(_debounce_channel_ch_10000_10 + 2)
      000445 8A 82            [24]  277 	mov	dpl,r2
      000447 8B 83            [24]  278 	mov	dph,r3
      000449 8C F0            [24]  279 	mov	b,r4
      00044B 12 09 90         [24]  280 	lcall	__gptrget
      00044E FC               [12]  281 	mov	r4,a
      00044F 74 03            [12]  282 	mov	a,#0x03
      000451 25 14            [12]  283 	add	a, _debounce_channel_ch_10000_10
      000453 F9               [12]  284 	mov	r1,a
      000454 E4               [12]  285 	clr	a
      000455 35 15            [12]  286 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      000457 FA               [12]  287 	mov	r2,a
      000458 AB 16            [24]  288 	mov	r3,(_debounce_channel_ch_10000_10 + 2)
      00045A 89 82            [24]  289 	mov	dpl,r1
      00045C 8A 83            [24]  290 	mov	dph,r2
      00045E 8B F0            [24]  291 	mov	b,r3
      000460 12 09 90         [24]  292 	lcall	__gptrget
      000463 F8               [12]  293 	mov	r0,a
      000464 EC               [12]  294 	mov	a,r4
      000465 B5 00 30         [24]  295 	cjne	a,ar0,00104$
                                    296 ;	src/app/namur_logic.c:34: if (ch->debounce_count < BSP_DEBOUNCE_CYCLES) {
      000468 74 04            [12]  297 	mov	a,#0x04
      00046A 25 14            [12]  298 	add	a, _debounce_channel_ch_10000_10
      00046C F5 17            [12]  299 	mov	_debounce_channel_sloc0_1_0,a
      00046E E4               [12]  300 	clr	a
      00046F 35 15            [12]  301 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      000471 F5 18            [12]  302 	mov	(_debounce_channel_sloc0_1_0 + 1),a
      000473 85 16 19         [24]  303 	mov	(_debounce_channel_sloc0_1_0 + 2),(_debounce_channel_ch_10000_10 + 2)
      000476 85 17 82         [24]  304 	mov	dpl,_debounce_channel_sloc0_1_0
      000479 85 18 83         [24]  305 	mov	dph,(_debounce_channel_sloc0_1_0 + 1)
      00047C 85 19 F0         [24]  306 	mov	b,(_debounce_channel_sloc0_1_0 + 2)
      00047F 12 09 90         [24]  307 	lcall	__gptrget
      000482 F8               [12]  308 	mov	r0,a
      000483 B8 04 00         [24]  309 	cjne	r0,#0x04,00130$
      000486                        310 00130$:
      000486 50 30            [24]  311 	jnc	00105$
                                    312 ;	src/app/namur_logic.c:35: ch->debounce_count++;
      000488 08               [12]  313 	inc	r0
      000489 85 17 82         [24]  314 	mov	dpl,_debounce_channel_sloc0_1_0
      00048C 85 18 83         [24]  315 	mov	dph,(_debounce_channel_sloc0_1_0 + 1)
      00048F 85 19 F0         [24]  316 	mov	b,(_debounce_channel_sloc0_1_0 + 2)
      000492 E8               [12]  317 	mov	a,r0
      000493 12 09 75         [24]  318 	lcall	__gptrput
      000496 80 20            [24]  319 	sjmp	00105$
      000498                        320 00104$:
                                    321 ;	src/app/namur_logic.c:38: ch->pending = ch->instant;
      000498 89 82            [24]  322 	mov	dpl,r1
      00049A 8A 83            [24]  323 	mov	dph,r2
      00049C 8B F0            [24]  324 	mov	b,r3
      00049E EC               [12]  325 	mov	a,r4
      00049F 12 09 75         [24]  326 	lcall	__gptrput
                                    327 ;	src/app/namur_logic.c:39: ch->debounce_count = 1U;
      0004A2 74 04            [12]  328 	mov	a,#0x04
      0004A4 25 14            [12]  329 	add	a, _debounce_channel_ch_10000_10
      0004A6 F8               [12]  330 	mov	r0,a
      0004A7 E4               [12]  331 	clr	a
      0004A8 35 15            [12]  332 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      0004AA FC               [12]  333 	mov	r4,a
      0004AB AF 16            [24]  334 	mov	r7,(_debounce_channel_ch_10000_10 + 2)
      0004AD 88 82            [24]  335 	mov	dpl,r0
      0004AF 8C 83            [24]  336 	mov	dph,r4
      0004B1 8F F0            [24]  337 	mov	b,r7
      0004B3 74 01            [12]  338 	mov	a,#0x01
      0004B5 12 09 75         [24]  339 	lcall	__gptrput
      0004B8                        340 00105$:
                                    341 ;	src/app/namur_logic.c:42: if (ch->debounce_count >= BSP_DEBOUNCE_CYCLES) {
      0004B8 74 04            [12]  342 	mov	a,#0x04
      0004BA 25 14            [12]  343 	add	a, _debounce_channel_ch_10000_10
      0004BC FD               [12]  344 	mov	r5,a
      0004BD E4               [12]  345 	clr	a
      0004BE 35 15            [12]  346 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      0004C0 FE               [12]  347 	mov	r6,a
      0004C1 AF 16            [24]  348 	mov	r7,(_debounce_channel_ch_10000_10 + 2)
      0004C3 8D 82            [24]  349 	mov	dpl,r5
      0004C5 8E 83            [24]  350 	mov	dph,r6
      0004C7 8F F0            [24]  351 	mov	b,r7
      0004C9 12 09 90         [24]  352 	lcall	__gptrget
      0004CC FD               [12]  353 	mov	r5,a
      0004CD BD 04 00         [24]  354 	cjne	r5,#0x04,00132$
      0004D0                        355 00132$:
      0004D0 40 1D            [24]  356 	jc	00108$
                                    357 ;	src/app/namur_logic.c:43: ch->stable = ch->pending;
      0004D2 74 05            [12]  358 	mov	a,#0x05
      0004D4 25 14            [12]  359 	add	a, _debounce_channel_ch_10000_10
      0004D6 FD               [12]  360 	mov	r5,a
      0004D7 E4               [12]  361 	clr	a
      0004D8 35 15            [12]  362 	addc	a, (_debounce_channel_ch_10000_10 + 1)
      0004DA FE               [12]  363 	mov	r6,a
      0004DB AF 16            [24]  364 	mov	r7,(_debounce_channel_ch_10000_10 + 2)
      0004DD 89 82            [24]  365 	mov	dpl,r1
      0004DF 8A 83            [24]  366 	mov	dph,r2
      0004E1 8B F0            [24]  367 	mov	b,r3
      0004E3 12 09 90         [24]  368 	lcall	__gptrget
      0004E6 8D 82            [24]  369 	mov	dpl,r5
      0004E8 8E 83            [24]  370 	mov	dph,r6
      0004EA 8F F0            [24]  371 	mov	b,r7
                                    372 ;	src/app/namur_logic.c:45: }
      0004EC 02 09 75         [24]  373 	ljmp	__gptrput
      0004EF                        374 00108$:
      0004EF 22               [24]  375 	ret
                                    376 ;------------------------------------------------------------
                                    377 ;Allocation info for local variables in function 'apply_fault'
                                    378 ;------------------------------------------------------------
                                    379 ;ch            Allocated to registers r5 r6 r7 
                                    380 ;------------------------------------------------------------
                                    381 ;	src/app/namur_logic.c:47: static void apply_fault(namur_channel_t *ch)
                                    382 ;	-----------------------------------------
                                    383 ;	 function apply_fault
                                    384 ;	-----------------------------------------
      0004F0                        385 _apply_fault:
      0004F0 AD 82            [24]  386 	mov	r5, dpl
      0004F2 AE 83            [24]  387 	mov	r6, dph
      0004F4 AF F0            [24]  388 	mov	r7, b
                                    389 ;	src/app/namur_logic.c:49: if (ch->stable == NAMUR_INSTANT_LEAD_BREAK) {
      0004F6 74 05            [12]  390 	mov	a,#0x05
      0004F8 2D               [12]  391 	add	a, r5
      0004F9 FA               [12]  392 	mov	r2,a
      0004FA E4               [12]  393 	clr	a
      0004FB 3E               [12]  394 	addc	a, r6
      0004FC FB               [12]  395 	mov	r3,a
      0004FD 8F 04            [24]  396 	mov	ar4,r7
      0004FF 8A 82            [24]  397 	mov	dpl,r2
      000501 8B 83            [24]  398 	mov	dph,r3
      000503 8C F0            [24]  399 	mov	b,r4
      000505 12 09 90         [24]  400 	lcall	__gptrget
      000508 FC               [12]  401 	mov	r4,a
      000509 BC 02 14         [24]  402 	cjne	r4,#0x02,00105$
                                    403 ;	src/app/namur_logic.c:50: ch->fault = NAMUR_FAULT_LEAD_BREAK;
      00050C 74 06            [12]  404 	mov	a,#0x06
      00050E 2D               [12]  405 	add	a, r5
      00050F F9               [12]  406 	mov	r1,a
      000510 E4               [12]  407 	clr	a
      000511 3E               [12]  408 	addc	a, r6
      000512 FA               [12]  409 	mov	r2,a
      000513 8F 03            [24]  410 	mov	ar3,r7
      000515 89 82            [24]  411 	mov	dpl,r1
      000517 8A 83            [24]  412 	mov	dph,r2
      000519 8B F0            [24]  413 	mov	b,r3
      00051B 74 01            [12]  414 	mov	a,#0x01
      00051D 02 09 75         [24]  415 	ljmp	__gptrput
      000520                        416 00105$:
                                    417 ;	src/app/namur_logic.c:51: } else if (ch->stable == NAMUR_INSTANT_SHORT) {
      000520 BC 03 14         [24]  418 	cjne	r4,#0x03,00102$
                                    419 ;	src/app/namur_logic.c:52: ch->fault = NAMUR_FAULT_SHORT_CIRCUIT;
      000523 74 06            [12]  420 	mov	a,#0x06
      000525 2D               [12]  421 	add	a, r5
      000526 FA               [12]  422 	mov	r2,a
      000527 E4               [12]  423 	clr	a
      000528 3E               [12]  424 	addc	a, r6
      000529 FB               [12]  425 	mov	r3,a
      00052A 8F 04            [24]  426 	mov	ar4,r7
      00052C 8A 82            [24]  427 	mov	dpl,r2
      00052E 8B 83            [24]  428 	mov	dph,r3
      000530 8C F0            [24]  429 	mov	b,r4
      000532 74 02            [12]  430 	mov	a,#0x02
      000534 02 09 75         [24]  431 	ljmp	__gptrput
      000537                        432 00102$:
                                    433 ;	src/app/namur_logic.c:54: ch->fault = NAMUR_FAULT_NONE;
      000537 74 06            [12]  434 	mov	a,#0x06
      000539 2D               [12]  435 	add	a, r5
      00053A FD               [12]  436 	mov	r5,a
      00053B E4               [12]  437 	clr	a
      00053C 3E               [12]  438 	addc	a, r6
      00053D FE               [12]  439 	mov	r6,a
      00053E 8D 82            [24]  440 	mov	dpl,r5
      000540 8E 83            [24]  441 	mov	dph,r6
      000542 8F F0            [24]  442 	mov	b,r7
      000544 E4               [12]  443 	clr	a
                                    444 ;	src/app/namur_logic.c:56: }
      000545 02 09 75         [24]  445 	ljmp	__gptrput
                                    446 ;------------------------------------------------------------
                                    447 ;Allocation info for local variables in function 'apply_latch'
                                    448 ;------------------------------------------------------------
                                    449 ;ch            Allocated to registers r5 r6 r7 
                                    450 ;------------------------------------------------------------
                                    451 ;	src/app/namur_logic.c:58: static void apply_latch(namur_channel_t *ch)
                                    452 ;	-----------------------------------------
                                    453 ;	 function apply_latch
                                    454 ;	-----------------------------------------
      000548                        455 _apply_latch:
      000548 AD 82            [24]  456 	mov	r5, dpl
      00054A AE 83            [24]  457 	mov	r6, dph
      00054C AF F0            [24]  458 	mov	r7, b
                                    459 ;	src/app/namur_logic.c:60: if (ch->fault != NAMUR_FAULT_NONE) {
      00054E 74 06            [12]  460 	mov	a,#0x06
      000550 2D               [12]  461 	add	a, r5
      000551 FA               [12]  462 	mov	r2,a
      000552 E4               [12]  463 	clr	a
      000553 3E               [12]  464 	addc	a, r6
      000554 FB               [12]  465 	mov	r3,a
      000555 8F 04            [24]  466 	mov	ar4,r7
      000557 8A 82            [24]  467 	mov	dpl,r2
      000559 8B 83            [24]  468 	mov	dph,r3
      00055B 8C F0            [24]  469 	mov	b,r4
      00055D 12 09 90         [24]  470 	lcall	__gptrget
      000560 60 01            [24]  471 	jz	00102$
                                    472 ;	src/app/namur_logic.c:61: return;
      000562 22               [24]  473 	ret
      000563                        474 00102$:
                                    475 ;	src/app/namur_logic.c:64: if (NAMUR_ADC_SHOULD_LATCH_ON(ch->filtered_adc)) {
      000563 8D 03            [24]  476 	mov	ar3,r5
      000565 8E 02            [24]  477 	mov	ar2,r6
      000567 8F 04            [24]  478 	mov	ar4,r7
      000569 8B 82            [24]  479 	mov	dpl,r3
      00056B 8A 83            [24]  480 	mov	dph,r2
      00056D 8C F0            [24]  481 	mov	b,r4
      00056F 12 09 90         [24]  482 	lcall	__gptrget
      000572 FB               [12]  483 	mov	r3,a
      000573 A3               [24]  484 	inc	dptr
      000574 12 09 90         [24]  485 	lcall	__gptrget
      000577 FC               [12]  486 	mov	r4,a
      000578 4B               [12]  487 	orl	a,r3
      000579 60 14            [24]  488 	jz	00106$
                                    489 ;	src/app/namur_logic.c:65: ch->latched_on = 1U;
      00057B 74 07            [12]  490 	mov	a,#0x07
      00057D 2D               [12]  491 	add	a, r5
      00057E F8               [12]  492 	mov	r0,a
      00057F E4               [12]  493 	clr	a
      000580 3E               [12]  494 	addc	a, r6
      000581 F9               [12]  495 	mov	r1,a
      000582 8F 02            [24]  496 	mov	ar2,r7
      000584 88 82            [24]  497 	mov	dpl,r0
      000586 89 83            [24]  498 	mov	dph,r1
      000588 8A F0            [24]  499 	mov	b,r2
      00058A 74 01            [12]  500 	mov	a,#0x01
      00058C 02 09 75         [24]  501 	ljmp	__gptrput
      00058F                        502 00106$:
                                    503 ;	src/app/namur_logic.c:66: } else if (NAMUR_ADC_SHOULD_LATCH_OFF(ch->filtered_adc)) {
      00058F C3               [12]  504 	clr	c
      000590 EB               [12]  505 	mov	a,r3
      000591 94 EB            [12]  506 	subb	a,#0xeb
      000593 EC               [12]  507 	mov	a,r4
      000594 94 01            [12]  508 	subb	a,#0x01
      000596 50 11            [24]  509 	jnc	00108$
                                    510 ;	src/app/namur_logic.c:67: ch->latched_on = 0U;
      000598 74 07            [12]  511 	mov	a,#0x07
      00059A 2D               [12]  512 	add	a, r5
      00059B FD               [12]  513 	mov	r5,a
      00059C E4               [12]  514 	clr	a
      00059D 3E               [12]  515 	addc	a, r6
      00059E FE               [12]  516 	mov	r6,a
      00059F 8D 82            [24]  517 	mov	dpl,r5
      0005A1 8E 83            [24]  518 	mov	dph,r6
      0005A3 8F F0            [24]  519 	mov	b,r7
      0005A5 E4               [12]  520 	clr	a
                                    521 ;	src/app/namur_logic.c:69: }
      0005A6 02 09 75         [24]  522 	ljmp	__gptrput
      0005A9                        523 00108$:
      0005A9 22               [24]  524 	ret
                                    525 ;------------------------------------------------------------
                                    526 ;Allocation info for local variables in function 'sense_from_latch'
                                    527 ;------------------------------------------------------------
                                    528 ;dip_nc        Allocated with name '_sense_from_latch_PARM_2'
                                    529 ;latched_on    Allocated to registers r7 
                                    530 ;sense         Allocated to registers r6 
                                    531 ;------------------------------------------------------------
                                    532 ;	src/app/namur_logic.c:71: static uint8_t sense_from_latch(uint8_t latched_on, uint8_t dip_nc)
                                    533 ;	-----------------------------------------
                                    534 ;	 function sense_from_latch
                                    535 ;	-----------------------------------------
      0005AA                        536 _sense_from_latch:
      0005AA AF 82            [24]  537 	mov	r7, dpl
                                    538 ;	src/app/namur_logic.c:73: uint8_t sense = latched_on;
      0005AC 8F 06            [24]  539 	mov	ar6,r7
                                    540 ;	src/app/namur_logic.c:75: if (dip_nc) {
      0005AE E5 14            [12]  541 	mov	a,_sense_from_latch_PARM_2
      0005B0 60 0B            [24]  542 	jz	00102$
                                    543 ;	src/app/namur_logic.c:76: sense = (uint8_t)(sense ? 0U : 1U);
      0005B2 EF               [12]  544 	mov	a,r7
      0005B3 60 04            [24]  545 	jz	00105$
      0005B5 7F 00            [12]  546 	mov	r7,#0x00
      0005B7 80 02            [24]  547 	sjmp	00106$
      0005B9                        548 00105$:
      0005B9 7F 01            [12]  549 	mov	r7,#0x01
      0005BB                        550 00106$:
      0005BB 8F 06            [24]  551 	mov	ar6,r7
      0005BD                        552 00102$:
                                    553 ;	src/app/namur_logic.c:78: return sense;
      0005BD 8E 82            [24]  554 	mov	dpl, r6
                                    555 ;	src/app/namur_logic.c:79: }
      0005BF 22               [24]  556 	ret
                                    557 ;------------------------------------------------------------
                                    558 ;Allocation info for local variables in function 'fault_blink_on'
                                    559 ;------------------------------------------------------------
                                    560 ;ch            Allocated to registers r5 r6 r7 
                                    561 ;half          Allocated to registers r2 r3 
                                    562 ;------------------------------------------------------------
                                    563 ;	src/app/namur_logic.c:81: static uint8_t fault_blink_on(const namur_channel_t *ch)
                                    564 ;	-----------------------------------------
                                    565 ;	 function fault_blink_on
                                    566 ;	-----------------------------------------
      0005C0                        567 _fault_blink_on:
      0005C0 AD 82            [24]  568 	mov	r5, dpl
      0005C2 AE 83            [24]  569 	mov	r6, dph
      0005C4 AF F0            [24]  570 	mov	r7, b
                                    571 ;	src/app/namur_logic.c:85: if (ch->fault == NAMUR_FAULT_LEAD_BREAK) {
      0005C6 74 06            [12]  572 	mov	a,#0x06
      0005C8 2D               [12]  573 	add	a, r5
      0005C9 FA               [12]  574 	mov	r2,a
      0005CA E4               [12]  575 	clr	a
      0005CB 3E               [12]  576 	addc	a, r6
      0005CC FB               [12]  577 	mov	r3,a
      0005CD 8F 04            [24]  578 	mov	ar4,r7
      0005CF 8A 82            [24]  579 	mov	dpl,r2
      0005D1 8B 83            [24]  580 	mov	dph,r3
      0005D3 8C F0            [24]  581 	mov	b,r4
      0005D5 12 09 90         [24]  582 	lcall	__gptrget
      0005D8 FC               [12]  583 	mov	r4,a
      0005D9 BC 01 06         [24]  584 	cjne	r4,#0x01,00105$
                                    585 ;	src/app/namur_logic.c:86: half = BSP_BLINK_LEAD_BREAK_HALF_TICKS;
      0005DC 7A 19            [12]  586 	mov	r2,#0x19
      0005DE 7B 00            [12]  587 	mov	r3,#0x00
      0005E0 80 0D            [24]  588 	sjmp	00106$
      0005E2                        589 00105$:
                                    590 ;	src/app/namur_logic.c:87: } else if (ch->fault == NAMUR_FAULT_SHORT_CIRCUIT) {
      0005E2 BC 02 06         [24]  591 	cjne	r4,#0x02,00102$
                                    592 ;	src/app/namur_logic.c:88: half = BSP_BLINK_SHORT_HALF_TICKS;
      0005E5 7A 05            [12]  593 	mov	r2,#0x05
      0005E7 7B 00            [12]  594 	mov	r3,#0x00
      0005E9 80 04            [24]  595 	sjmp	00106$
      0005EB                        596 00102$:
                                    597 ;	src/app/namur_logic.c:90: return 0U;
      0005EB 75 82 00         [24]  598 	mov	dpl, #0x00
      0005EE 22               [24]  599 	ret
      0005EF                        600 00106$:
                                    601 ;	src/app/namur_logic.c:93: return (uint8_t)(((ch->blink_tick / half) & 1U) == 0U);
      0005EF 74 08            [12]  602 	mov	a,#0x08
      0005F1 2D               [12]  603 	add	a, r5
      0005F2 FD               [12]  604 	mov	r5,a
      0005F3 E4               [12]  605 	clr	a
      0005F4 3E               [12]  606 	addc	a, r6
      0005F5 FE               [12]  607 	mov	r6,a
      0005F6 8D 82            [24]  608 	mov	dpl,r5
      0005F8 8E 83            [24]  609 	mov	dph,r6
      0005FA 8F F0            [24]  610 	mov	b,r7
      0005FC 12 09 90         [24]  611 	lcall	__gptrget
      0005FF FD               [12]  612 	mov	r5,a
      000600 A3               [24]  613 	inc	dptr
      000601 12 09 90         [24]  614 	lcall	__gptrget
      000604 FE               [12]  615 	mov	r6,a
      000605 8A 14            [24]  616 	mov	__divuint_PARM_2,r2
      000607 8B 15            [24]  617 	mov	(__divuint_PARM_2 + 1),r3
      000609 8D 82            [24]  618 	mov	dpl, r5
      00060B 8E 83            [24]  619 	mov	dph, r6
      00060D 12 09 4C         [24]  620 	lcall	__divuint
      000610 AE 82            [24]  621 	mov	r6, dpl
      000612 53 06 01         [24]  622 	anl	ar6,#0x01
      000615 E4               [12]  623 	clr	a
      000616 FF               [12]  624 	mov	r7,a
      000617 BE 00 04         [24]  625 	cjne	r6,#0x00,00125$
      00061A BF 00 01         [24]  626 	cjne	r7,#0x00,00125$
      00061D 04               [12]  627 	inc	a
      00061E                        628 00125$:
      00061E F5 82            [12]  629 	mov	dpl,a
                                    630 ;	src/app/namur_logic.c:94: }
      000620 22               [24]  631 	ret
                                    632 ;------------------------------------------------------------
                                    633 ;Allocation info for local variables in function 'update_channel'
                                    634 ;------------------------------------------------------------
                                    635 ;raw_adc       Allocated with name '_update_channel_PARM_2'
                                    636 ;dip_nc        Allocated with name '_update_channel_PARM_3'
                                    637 ;fault_suppress Allocated with name '_update_channel_PARM_4'
                                    638 ;ch            Allocated with name '_update_channel_ch_10000_34'
                                    639 ;------------------------------------------------------------
                                    640 ;	src/app/namur_logic.c:96: static void update_channel(namur_channel_t *ch, uint16_t raw_adc, uint8_t dip_nc, uint8_t fault_suppress)
                                    641 ;	-----------------------------------------
                                    642 ;	 function update_channel
                                    643 ;	-----------------------------------------
      000621                        644 _update_channel:
      000621 85 82 0C         [24]  645 	mov	_update_channel_ch_10000_34,dpl
      000624 85 83 0D         [24]  646 	mov	(_update_channel_ch_10000_34 + 1),dph
      000627 85 F0 0E         [24]  647 	mov	(_update_channel_ch_10000_34 + 2),b
                                    648 ;	src/app/namur_logic.c:98: ema_filter(raw_adc, &ch->filtered_adc);
      00062A 85 0C 14         [24]  649 	mov	_ema_filter_PARM_2,_update_channel_ch_10000_34
      00062D 85 0D 15         [24]  650 	mov	(_ema_filter_PARM_2 + 1),(_update_channel_ch_10000_34 + 1)
      000630 85 0E 16         [24]  651 	mov	(_ema_filter_PARM_2 + 2),(_update_channel_ch_10000_34 + 2)
      000633 85 08 82         [24]  652 	mov	dpl, _update_channel_PARM_2
      000636 85 09 83         [24]  653 	mov	dph, (_update_channel_PARM_2 + 1)
      000639 12 03 E9         [24]  654 	lcall	_ema_filter
                                    655 ;	src/app/namur_logic.c:99: ch->instant = classify_adc(ch->filtered_adc);
      00063C 74 02            [12]  656 	mov	a,#0x02
      00063E 25 0C            [12]  657 	add	a, _update_channel_ch_10000_34
      000640 FA               [12]  658 	mov	r2,a
      000641 E4               [12]  659 	clr	a
      000642 35 0D            [12]  660 	addc	a, (_update_channel_ch_10000_34 + 1)
      000644 FB               [12]  661 	mov	r3,a
      000645 AC 0E            [24]  662 	mov	r4,(_update_channel_ch_10000_34 + 2)
      000647 A8 0C            [24]  663 	mov	r0,_update_channel_ch_10000_34
      000649 A9 0D            [24]  664 	mov	r1,(_update_channel_ch_10000_34 + 1)
      00064B AF 0E            [24]  665 	mov	r7,(_update_channel_ch_10000_34 + 2)
      00064D 88 82            [24]  666 	mov	dpl,r0
      00064F 89 83            [24]  667 	mov	dph,r1
      000651 8F F0            [24]  668 	mov	b,r7
      000653 12 09 90         [24]  669 	lcall	__gptrget
      000656 F8               [12]  670 	mov	r0,a
      000657 A3               [24]  671 	inc	dptr
      000658 12 09 90         [24]  672 	lcall	__gptrget
      00065B F9               [12]  673 	mov	r1,a
      00065C 88 82            [24]  674 	mov	dpl, r0
      00065E 89 83            [24]  675 	mov	dph, r1
      000660 C0 04            [24]  676 	push	ar4
      000662 C0 03            [24]  677 	push	ar3
      000664 C0 02            [24]  678 	push	ar2
      000666 12 03 B2         [24]  679 	lcall	_classify_adc
      000669 AF 82            [24]  680 	mov	r7, dpl
      00066B D0 02            [24]  681 	pop	ar2
      00066D D0 03            [24]  682 	pop	ar3
      00066F D0 04            [24]  683 	pop	ar4
      000671 8A 82            [24]  684 	mov	dpl,r2
      000673 8B 83            [24]  685 	mov	dph,r3
      000675 8C F0            [24]  686 	mov	b,r4
      000677 EF               [12]  687 	mov	a,r7
      000678 12 09 75         [24]  688 	lcall	__gptrput
                                    689 ;	src/app/namur_logic.c:100: debounce_channel(ch);
      00067B 85 0C 82         [24]  690 	mov	dpl, _update_channel_ch_10000_34
      00067E 85 0D 83         [24]  691 	mov	dph, (_update_channel_ch_10000_34 + 1)
      000681 85 0E F0         [24]  692 	mov	b, (_update_channel_ch_10000_34 + 2)
      000684 12 04 31         [24]  693 	lcall	_debounce_channel
                                    694 ;	src/app/namur_logic.c:102: if (fault_suppress) {
      000687 E5 0B            [12]  695 	mov	a,_update_channel_PARM_4
      000689 60 17            [24]  696 	jz	00102$
                                    697 ;	src/app/namur_logic.c:103: ch->fault = NAMUR_FAULT_NONE;
      00068B 74 06            [12]  698 	mov	a,#0x06
      00068D 25 0C            [12]  699 	add	a, _update_channel_ch_10000_34
      00068F FD               [12]  700 	mov	r5,a
      000690 E4               [12]  701 	clr	a
      000691 35 0D            [12]  702 	addc	a, (_update_channel_ch_10000_34 + 1)
      000693 FE               [12]  703 	mov	r6,a
      000694 AF 0E            [24]  704 	mov	r7,(_update_channel_ch_10000_34 + 2)
      000696 8D 82            [24]  705 	mov	dpl,r5
      000698 8E 83            [24]  706 	mov	dph,r6
      00069A 8F F0            [24]  707 	mov	b,r7
      00069C E4               [12]  708 	clr	a
      00069D 12 09 75         [24]  709 	lcall	__gptrput
      0006A0 80 0C            [24]  710 	sjmp	00103$
      0006A2                        711 00102$:
                                    712 ;	src/app/namur_logic.c:105: apply_fault(ch);
      0006A2 85 0C 82         [24]  713 	mov	dpl, _update_channel_ch_10000_34
      0006A5 85 0D 83         [24]  714 	mov	dph, (_update_channel_ch_10000_34 + 1)
      0006A8 85 0E F0         [24]  715 	mov	b, (_update_channel_ch_10000_34 + 2)
      0006AB 12 04 F0         [24]  716 	lcall	_apply_fault
      0006AE                        717 00103$:
                                    718 ;	src/app/namur_logic.c:108: apply_latch(ch);
      0006AE 85 0C 82         [24]  719 	mov	dpl, _update_channel_ch_10000_34
      0006B1 85 0D 83         [24]  720 	mov	dph, (_update_channel_ch_10000_34 + 1)
      0006B4 85 0E F0         [24]  721 	mov	b, (_update_channel_ch_10000_34 + 2)
      0006B7 12 05 48         [24]  722 	lcall	_apply_latch
                                    723 ;	src/app/namur_logic.c:110: if (ch->fault != NAMUR_FAULT_NONE) {
      0006BA 74 06            [12]  724 	mov	a,#0x06
      0006BC 25 0C            [12]  725 	add	a, _update_channel_ch_10000_34
      0006BE FD               [12]  726 	mov	r5,a
      0006BF E4               [12]  727 	clr	a
      0006C0 35 0D            [12]  728 	addc	a, (_update_channel_ch_10000_34 + 1)
      0006C2 FE               [12]  729 	mov	r6,a
      0006C3 AF 0E            [24]  730 	mov	r7,(_update_channel_ch_10000_34 + 2)
      0006C5 8D 82            [24]  731 	mov	dpl,r5
      0006C7 8E 83            [24]  732 	mov	dph,r6
      0006C9 8F F0            [24]  733 	mov	b,r7
      0006CB 12 09 90         [24]  734 	lcall	__gptrget
      0006CE 60 72            [24]  735 	jz	00105$
                                    736 ;	src/app/namur_logic.c:111: ch->sense_led = 0U;
      0006D0 74 0A            [12]  737 	mov	a,#0x0a
      0006D2 25 0C            [12]  738 	add	a, _update_channel_ch_10000_34
      0006D4 FD               [12]  739 	mov	r5,a
      0006D5 E4               [12]  740 	clr	a
      0006D6 35 0D            [12]  741 	addc	a, (_update_channel_ch_10000_34 + 1)
      0006D8 FE               [12]  742 	mov	r6,a
      0006D9 AF 0E            [24]  743 	mov	r7,(_update_channel_ch_10000_34 + 2)
      0006DB 8D 82            [24]  744 	mov	dpl,r5
      0006DD 8E 83            [24]  745 	mov	dph,r6
      0006DF 8F F0            [24]  746 	mov	b,r7
      0006E1 E4               [12]  747 	clr	a
      0006E2 12 09 75         [24]  748 	lcall	__gptrput
                                    749 ;	src/app/namur_logic.c:112: ch->blink_tick++;
      0006E5 74 08            [12]  750 	mov	a,#0x08
      0006E7 25 0C            [12]  751 	add	a, _update_channel_ch_10000_34
      0006E9 FD               [12]  752 	mov	r5,a
      0006EA E4               [12]  753 	clr	a
      0006EB 35 0D            [12]  754 	addc	a, (_update_channel_ch_10000_34 + 1)
      0006ED FE               [12]  755 	mov	r6,a
      0006EE AF 0E            [24]  756 	mov	r7,(_update_channel_ch_10000_34 + 2)
      0006F0 8D 82            [24]  757 	mov	dpl,r5
      0006F2 8E 83            [24]  758 	mov	dph,r6
      0006F4 8F F0            [24]  759 	mov	b,r7
      0006F6 12 09 90         [24]  760 	lcall	__gptrget
      0006F9 FB               [12]  761 	mov	r3,a
      0006FA A3               [24]  762 	inc	dptr
      0006FB 12 09 90         [24]  763 	lcall	__gptrget
      0006FE FC               [12]  764 	mov	r4,a
      0006FF 0B               [12]  765 	inc	r3
      000700 BB 00 01         [24]  766 	cjne	r3,#0x00,00123$
      000703 0C               [12]  767 	inc	r4
      000704                        768 00123$:
      000704 8D 82            [24]  769 	mov	dpl,r5
      000706 8E 83            [24]  770 	mov	dph,r6
      000708 8F F0            [24]  771 	mov	b,r7
      00070A EB               [12]  772 	mov	a,r3
      00070B 12 09 75         [24]  773 	lcall	__gptrput
      00070E A3               [24]  774 	inc	dptr
      00070F EC               [12]  775 	mov	a,r4
      000710 12 09 75         [24]  776 	lcall	__gptrput
                                    777 ;	src/app/namur_logic.c:113: ch->fault_led = fault_blink_on(ch);
      000713 74 0B            [12]  778 	mov	a,#0x0b
      000715 25 0C            [12]  779 	add	a, _update_channel_ch_10000_34
      000717 FD               [12]  780 	mov	r5,a
      000718 E4               [12]  781 	clr	a
      000719 35 0D            [12]  782 	addc	a, (_update_channel_ch_10000_34 + 1)
      00071B FE               [12]  783 	mov	r6,a
      00071C AF 0E            [24]  784 	mov	r7,(_update_channel_ch_10000_34 + 2)
      00071E 85 0C 82         [24]  785 	mov	dpl, _update_channel_ch_10000_34
      000721 85 0D 83         [24]  786 	mov	dph, (_update_channel_ch_10000_34 + 1)
      000724 85 0E F0         [24]  787 	mov	b, (_update_channel_ch_10000_34 + 2)
      000727 C0 07            [24]  788 	push	ar7
      000729 C0 06            [24]  789 	push	ar6
      00072B C0 05            [24]  790 	push	ar5
      00072D 12 05 C0         [24]  791 	lcall	_fault_blink_on
      000730 AC 82            [24]  792 	mov	r4, dpl
      000732 D0 05            [24]  793 	pop	ar5
      000734 D0 06            [24]  794 	pop	ar6
      000736 D0 07            [24]  795 	pop	ar7
      000738 8D 82            [24]  796 	mov	dpl,r5
      00073A 8E 83            [24]  797 	mov	dph,r6
      00073C 8F F0            [24]  798 	mov	b,r7
      00073E EC               [12]  799 	mov	a,r4
      00073F 02 09 75         [24]  800 	ljmp	__gptrput
      000742                        801 00105$:
                                    802 ;	src/app/namur_logic.c:115: ch->fault_led = 0U;
      000742 74 0B            [12]  803 	mov	a,#0x0b
      000744 25 0C            [12]  804 	add	a, _update_channel_ch_10000_34
      000746 FD               [12]  805 	mov	r5,a
      000747 E4               [12]  806 	clr	a
      000748 35 0D            [12]  807 	addc	a, (_update_channel_ch_10000_34 + 1)
      00074A FE               [12]  808 	mov	r6,a
      00074B AF 0E            [24]  809 	mov	r7,(_update_channel_ch_10000_34 + 2)
      00074D 8D 82            [24]  810 	mov	dpl,r5
      00074F 8E 83            [24]  811 	mov	dph,r6
      000751 8F F0            [24]  812 	mov	b,r7
      000753 E4               [12]  813 	clr	a
      000754 12 09 75         [24]  814 	lcall	__gptrput
                                    815 ;	src/app/namur_logic.c:116: ch->blink_tick = 0U;
      000757 74 08            [12]  816 	mov	a,#0x08
      000759 25 0C            [12]  817 	add	a, _update_channel_ch_10000_34
      00075B FD               [12]  818 	mov	r5,a
      00075C E4               [12]  819 	clr	a
      00075D 35 0D            [12]  820 	addc	a, (_update_channel_ch_10000_34 + 1)
      00075F FE               [12]  821 	mov	r6,a
      000760 AF 0E            [24]  822 	mov	r7,(_update_channel_ch_10000_34 + 2)
      000762 8D 82            [24]  823 	mov	dpl,r5
      000764 8E 83            [24]  824 	mov	dph,r6
      000766 8F F0            [24]  825 	mov	b,r7
      000768 E4               [12]  826 	clr	a
      000769 12 09 75         [24]  827 	lcall	__gptrput
      00076C A3               [24]  828 	inc	dptr
      00076D 12 09 75         [24]  829 	lcall	__gptrput
                                    830 ;	src/app/namur_logic.c:117: ch->sense_led = sense_from_latch(ch->latched_on, dip_nc);
      000770 74 0A            [12]  831 	mov	a,#0x0a
      000772 25 0C            [12]  832 	add	a, _update_channel_ch_10000_34
      000774 FD               [12]  833 	mov	r5,a
      000775 E4               [12]  834 	clr	a
      000776 35 0D            [12]  835 	addc	a, (_update_channel_ch_10000_34 + 1)
      000778 FE               [12]  836 	mov	r6,a
      000779 AF 0E            [24]  837 	mov	r7,(_update_channel_ch_10000_34 + 2)
      00077B 74 07            [12]  838 	mov	a,#0x07
      00077D 25 0C            [12]  839 	add	a, _update_channel_ch_10000_34
      00077F FA               [12]  840 	mov	r2,a
      000780 E4               [12]  841 	clr	a
      000781 35 0D            [12]  842 	addc	a, (_update_channel_ch_10000_34 + 1)
      000783 FB               [12]  843 	mov	r3,a
      000784 AC 0E            [24]  844 	mov	r4,(_update_channel_ch_10000_34 + 2)
      000786 8A 82            [24]  845 	mov	dpl,r2
      000788 8B 83            [24]  846 	mov	dph,r3
      00078A 8C F0            [24]  847 	mov	b,r4
      00078C 12 09 90         [24]  848 	lcall	__gptrget
      00078F FA               [12]  849 	mov	r2,a
      000790 85 0A 14         [24]  850 	mov	_sense_from_latch_PARM_2,_update_channel_PARM_3
      000793 8A 82            [24]  851 	mov	dpl, r2
      000795 C0 07            [24]  852 	push	ar7
      000797 C0 06            [24]  853 	push	ar6
      000799 C0 05            [24]  854 	push	ar5
      00079B 12 05 AA         [24]  855 	lcall	_sense_from_latch
      00079E AC 82            [24]  856 	mov	r4, dpl
      0007A0 D0 05            [24]  857 	pop	ar5
      0007A2 D0 06            [24]  858 	pop	ar6
      0007A4 D0 07            [24]  859 	pop	ar7
      0007A6 8D 82            [24]  860 	mov	dpl,r5
      0007A8 8E 83            [24]  861 	mov	dph,r6
      0007AA 8F F0            [24]  862 	mov	b,r7
      0007AC EC               [12]  863 	mov	a,r4
                                    864 ;	src/app/namur_logic.c:119: }
      0007AD 02 09 75         [24]  865 	ljmp	__gptrput
                                    866 ;------------------------------------------------------------
                                    867 ;Allocation info for local variables in function 'namur_logic_init'
                                    868 ;------------------------------------------------------------
                                    869 ;ctx           Allocated with name '_namur_logic_init_ctx_10000_40'
                                    870 ;i             Allocated with name '_namur_logic_init_i_10000_41'
                                    871 ;------------------------------------------------------------
                                    872 ;	src/app/namur_logic.c:121: void namur_logic_init(namur_logic_t *ctx)
                                    873 ;	-----------------------------------------
                                    874 ;	 function namur_logic_init
                                    875 ;	-----------------------------------------
      0007B0                        876 _namur_logic_init:
      0007B0 85 82 14         [24]  877 	mov	_namur_logic_init_ctx_10000_40,dpl
      0007B3 85 83 15         [24]  878 	mov	(_namur_logic_init_ctx_10000_40 + 1),dph
      0007B6 85 F0 16         [24]  879 	mov	(_namur_logic_init_ctx_10000_40 + 2),b
                                    880 ;	src/app/namur_logic.c:125: for (i = 0; i < NAMUR_LOGIC_CHANNELS; i++) {
      0007B9 AA 14            [24]  881 	mov	r2,_namur_logic_init_ctx_10000_40
      0007BB AB 15            [24]  882 	mov	r3,(_namur_logic_init_ctx_10000_40 + 1)
      0007BD AC 16            [24]  883 	mov	r4,(_namur_logic_init_ctx_10000_40 + 2)
      0007BF 75 17 00         [24]  884 	mov	_namur_logic_init_i_10000_41,#0x00
      0007C2                        885 00102$:
                                    886 ;	src/app/namur_logic.c:126: ctx->ch[i].filtered_adc = 0U;
      0007C2 E5 17            [12]  887 	mov	a,_namur_logic_init_i_10000_41
      0007C4 75 F0 0C         [24]  888 	mov	b,#0x0c
      0007C7 A4               [48]  889 	mul	ab
      0007C8 F8               [12]  890 	mov	r0,a
      0007C9 2A               [12]  891 	add	a, r2
      0007CA FD               [12]  892 	mov	r5,a
      0007CB E4               [12]  893 	clr	a
      0007CC 3B               [12]  894 	addc	a, r3
      0007CD FE               [12]  895 	mov	r6,a
      0007CE 8C 07            [24]  896 	mov	ar7,r4
      0007D0 8D 82            [24]  897 	mov	dpl,r5
      0007D2 8E 83            [24]  898 	mov	dph,r6
      0007D4 8F F0            [24]  899 	mov	b,r7
      0007D6 E4               [12]  900 	clr	a
      0007D7 12 09 75         [24]  901 	lcall	__gptrput
      0007DA A3               [24]  902 	inc	dptr
      0007DB 12 09 75         [24]  903 	lcall	__gptrput
                                    904 ;	src/app/namur_logic.c:127: ctx->ch[i].instant = NAMUR_INSTANT_HYST;
      0007DE E8               [12]  905 	mov	a,r0
      0007DF 25 14            [12]  906 	add	a, _namur_logic_init_ctx_10000_40
      0007E1 F8               [12]  907 	mov	r0,a
      0007E2 E4               [12]  908 	clr	a
      0007E3 35 15            [12]  909 	addc	a, (_namur_logic_init_ctx_10000_40 + 1)
      0007E5 FF               [12]  910 	mov	r7,a
      0007E6 AE 16            [24]  911 	mov	r6,(_namur_logic_init_ctx_10000_40 + 2)
      0007E8 C0 02            [24]  912 	push	ar2
      0007EA C0 03            [24]  913 	push	ar3
      0007EC C0 04            [24]  914 	push	ar4
      0007EE 74 02            [12]  915 	mov	a,#0x02
      0007F0 28               [12]  916 	add	a, r0
      0007F1 F9               [12]  917 	mov	r1,a
      0007F2 E4               [12]  918 	clr	a
      0007F3 3F               [12]  919 	addc	a, r7
      0007F4 FC               [12]  920 	mov	r4,a
      0007F5 8E 05            [24]  921 	mov	ar5,r6
      0007F7 89 82            [24]  922 	mov	dpl,r1
      0007F9 8C 83            [24]  923 	mov	dph,r4
      0007FB 8D F0            [24]  924 	mov	b,r5
      0007FD 74 01            [12]  925 	mov	a,#0x01
      0007FF 12 09 75         [24]  926 	lcall	__gptrput
                                    927 ;	src/app/namur_logic.c:128: ctx->ch[i].pending = NAMUR_INSTANT_HYST;
      000802 74 03            [12]  928 	mov	a,#0x03
      000804 28               [12]  929 	add	a, r0
      000805 FB               [12]  930 	mov	r3,a
      000806 E4               [12]  931 	clr	a
      000807 3F               [12]  932 	addc	a, r7
      000808 FC               [12]  933 	mov	r4,a
      000809 8E 05            [24]  934 	mov	ar5,r6
      00080B 8B 82            [24]  935 	mov	dpl,r3
      00080D 8C 83            [24]  936 	mov	dph,r4
      00080F 8D F0            [24]  937 	mov	b,r5
      000811 74 01            [12]  938 	mov	a,#0x01
      000813 12 09 75         [24]  939 	lcall	__gptrput
                                    940 ;	src/app/namur_logic.c:129: ctx->ch[i].stable = NAMUR_INSTANT_HYST;
      000816 74 05            [12]  941 	mov	a,#0x05
      000818 28               [12]  942 	add	a, r0
      000819 FB               [12]  943 	mov	r3,a
      00081A E4               [12]  944 	clr	a
      00081B 3F               [12]  945 	addc	a, r7
      00081C FC               [12]  946 	mov	r4,a
      00081D 8E 05            [24]  947 	mov	ar5,r6
      00081F 8B 82            [24]  948 	mov	dpl,r3
      000821 8C 83            [24]  949 	mov	dph,r4
      000823 8D F0            [24]  950 	mov	b,r5
      000825 74 01            [12]  951 	mov	a,#0x01
      000827 12 09 75         [24]  952 	lcall	__gptrput
                                    953 ;	src/app/namur_logic.c:130: ctx->ch[i].debounce_count = 0U;
      00082A 74 04            [12]  954 	mov	a,#0x04
      00082C 28               [12]  955 	add	a, r0
      00082D FB               [12]  956 	mov	r3,a
      00082E E4               [12]  957 	clr	a
      00082F 3F               [12]  958 	addc	a, r7
      000830 FC               [12]  959 	mov	r4,a
      000831 8E 05            [24]  960 	mov	ar5,r6
      000833 8B 82            [24]  961 	mov	dpl,r3
      000835 8C 83            [24]  962 	mov	dph,r4
      000837 8D F0            [24]  963 	mov	b,r5
      000839 E4               [12]  964 	clr	a
      00083A 12 09 75         [24]  965 	lcall	__gptrput
                                    966 ;	src/app/namur_logic.c:131: ctx->ch[i].fault = NAMUR_FAULT_NONE;
      00083D 74 06            [12]  967 	mov	a,#0x06
      00083F 28               [12]  968 	add	a, r0
      000840 FB               [12]  969 	mov	r3,a
      000841 E4               [12]  970 	clr	a
      000842 3F               [12]  971 	addc	a, r7
      000843 FC               [12]  972 	mov	r4,a
      000844 8E 05            [24]  973 	mov	ar5,r6
      000846 8B 82            [24]  974 	mov	dpl,r3
      000848 8C 83            [24]  975 	mov	dph,r4
      00084A 8D F0            [24]  976 	mov	b,r5
      00084C E4               [12]  977 	clr	a
      00084D 12 09 75         [24]  978 	lcall	__gptrput
                                    979 ;	src/app/namur_logic.c:132: ctx->ch[i].latched_on = 0U;
      000850 74 07            [12]  980 	mov	a,#0x07
      000852 28               [12]  981 	add	a, r0
      000853 FB               [12]  982 	mov	r3,a
      000854 E4               [12]  983 	clr	a
      000855 3F               [12]  984 	addc	a, r7
      000856 FC               [12]  985 	mov	r4,a
      000857 8E 05            [24]  986 	mov	ar5,r6
      000859 8B 82            [24]  987 	mov	dpl,r3
      00085B 8C 83            [24]  988 	mov	dph,r4
      00085D 8D F0            [24]  989 	mov	b,r5
      00085F E4               [12]  990 	clr	a
      000860 12 09 75         [24]  991 	lcall	__gptrput
                                    992 ;	src/app/namur_logic.c:133: ctx->ch[i].blink_tick = 0U;
      000863 74 08            [12]  993 	mov	a,#0x08
      000865 28               [12]  994 	add	a, r0
      000866 FB               [12]  995 	mov	r3,a
      000867 E4               [12]  996 	clr	a
      000868 3F               [12]  997 	addc	a, r7
      000869 FC               [12]  998 	mov	r4,a
      00086A 8E 05            [24]  999 	mov	ar5,r6
      00086C 8B 82            [24] 1000 	mov	dpl,r3
      00086E 8C 83            [24] 1001 	mov	dph,r4
      000870 8D F0            [24] 1002 	mov	b,r5
      000872 E4               [12] 1003 	clr	a
      000873 12 09 75         [24] 1004 	lcall	__gptrput
      000876 A3               [24] 1005 	inc	dptr
      000877 12 09 75         [24] 1006 	lcall	__gptrput
                                   1007 ;	src/app/namur_logic.c:134: ctx->ch[i].sense_led = 0U;
      00087A 74 0A            [12] 1008 	mov	a,#0x0a
      00087C 28               [12] 1009 	add	a, r0
      00087D FB               [12] 1010 	mov	r3,a
      00087E E4               [12] 1011 	clr	a
      00087F 3F               [12] 1012 	addc	a, r7
      000880 FC               [12] 1013 	mov	r4,a
      000881 8E 05            [24] 1014 	mov	ar5,r6
      000883 8B 82            [24] 1015 	mov	dpl,r3
      000885 8C 83            [24] 1016 	mov	dph,r4
      000887 8D F0            [24] 1017 	mov	b,r5
      000889 E4               [12] 1018 	clr	a
      00088A 12 09 75         [24] 1019 	lcall	__gptrput
                                   1020 ;	src/app/namur_logic.c:135: ctx->ch[i].fault_led = 0U;
      00088D 74 0B            [12] 1021 	mov	a,#0x0b
      00088F 28               [12] 1022 	add	a, r0
      000890 F8               [12] 1023 	mov	r0,a
      000891 E4               [12] 1024 	clr	a
      000892 3F               [12] 1025 	addc	a, r7
      000893 FF               [12] 1026 	mov	r7,a
      000894 88 82            [24] 1027 	mov	dpl,r0
      000896 8F 83            [24] 1028 	mov	dph,r7
      000898 8E F0            [24] 1029 	mov	b,r6
      00089A E4               [12] 1030 	clr	a
      00089B 12 09 75         [24] 1031 	lcall	__gptrput
                                   1032 ;	src/app/namur_logic.c:125: for (i = 0; i < NAMUR_LOGIC_CHANNELS; i++) {
      00089E 05 17            [12] 1033 	inc	_namur_logic_init_i_10000_41
      0008A0 C3               [12] 1034 	clr	c
      0008A1 E5 17            [12] 1035 	mov	a,_namur_logic_init_i_10000_41
      0008A3 94 02            [12] 1036 	subb	a,#0x02
      0008A5 D0 04            [24] 1037 	pop	ar4
      0008A7 D0 03            [24] 1038 	pop	ar3
      0008A9 D0 02            [24] 1039 	pop	ar2
      0008AB 50 03            [24] 1040 	jnc	00119$
      0008AD 02 07 C2         [24] 1041 	ljmp	00102$
      0008B0                       1042 00119$:
                                   1043 ;	src/app/namur_logic.c:137: ctx->dip = 0U;
      0008B0 74 18            [12] 1044 	mov	a,#0x18
      0008B2 25 14            [12] 1045 	add	a, _namur_logic_init_ctx_10000_40
      0008B4 FD               [12] 1046 	mov	r5,a
      0008B5 E4               [12] 1047 	clr	a
      0008B6 35 15            [12] 1048 	addc	a, (_namur_logic_init_ctx_10000_40 + 1)
      0008B8 FE               [12] 1049 	mov	r6,a
      0008B9 AF 16            [24] 1050 	mov	r7,(_namur_logic_init_ctx_10000_40 + 2)
      0008BB 8D 82            [24] 1051 	mov	dpl,r5
      0008BD 8E 83            [24] 1052 	mov	dph,r6
      0008BF 8F F0            [24] 1053 	mov	b,r7
      0008C1 E4               [12] 1054 	clr	a
                                   1055 ;	src/app/namur_logic.c:138: }
      0008C2 02 09 75         [24] 1056 	ljmp	__gptrput
                                   1057 ;------------------------------------------------------------
                                   1058 ;Allocation info for local variables in function 'namur_logic_update'
                                   1059 ;------------------------------------------------------------
                                   1060 ;adc_ch1       Allocated with name '_namur_logic_update_PARM_2'
                                   1061 ;adc_ch2       Allocated with name '_namur_logic_update_PARM_3'
                                   1062 ;dip           Allocated with name '_namur_logic_update_PARM_4'
                                   1063 ;ctx           Allocated to registers r5 r6 r7 
                                   1064 ;fault_suppress Allocated to registers r3 
                                   1065 ;dip_ch1_nc    Allocated to registers 
                                   1066 ;dip_ch2_nc    Allocated to registers r4 
                                   1067 ;------------------------------------------------------------
                                   1068 ;	src/app/namur_logic.c:140: void namur_logic_update(namur_logic_t *ctx, uint16_t adc_ch1, uint16_t adc_ch2, uint8_t dip)
                                   1069 ;	-----------------------------------------
                                   1070 ;	 function namur_logic_update
                                   1071 ;	-----------------------------------------
      0008C5                       1072 _namur_logic_update:
      0008C5 AD 82            [24] 1073 	mov	r5, dpl
      0008C7 AE 83            [24] 1074 	mov	r6, dph
      0008C9 AF F0            [24] 1075 	mov	r7, b
                                   1076 ;	src/app/namur_logic.c:142: uint8_t fault_suppress = (uint8_t)((dip & NAMUR_DIP_FAULT_SUPPRESS) != 0U);
      0008CB AC 13            [24] 1077 	mov	r4,_namur_logic_update_PARM_4
      0008CD 74 04            [12] 1078 	mov	a,#0x04
      0008CF 5C               [12] 1079 	anl	a,r4
      0008D0 B4 01 00         [24] 1080 	cjne	a,#0x01,00103$
      0008D3                       1081 00103$:
      0008D3 B3               [12] 1082 	cpl	c
      0008D4 92 00            [24] 1083 	mov	_namur_logic_update_sloc0_1_0,c
      0008D6 E4               [12] 1084 	clr	a
      0008D7 33               [12] 1085 	rlc	a
      0008D8 FB               [12] 1086 	mov	r3,a
                                   1087 ;	src/app/namur_logic.c:143: uint8_t dip_ch1_nc = (uint8_t)((dip & NAMUR_DIP_CH1_NC) != 0U);
      0008D9 74 01            [12] 1088 	mov	a,#0x01
      0008DB 5C               [12] 1089 	anl	a,r4
      0008DC B4 01 00         [24] 1090 	cjne	a,#0x01,00104$
      0008DF                       1091 00104$:
      0008DF B3               [12] 1092 	cpl	c
      0008E0 92 00            [24] 1093 	mov	_namur_logic_update_sloc0_1_0,c
      0008E2 E4               [12] 1094 	clr	a
      0008E3 33               [12] 1095 	rlc	a
      0008E4 F5 0A            [12] 1096 	mov	_update_channel_PARM_3,a
                                   1097 ;	src/app/namur_logic.c:144: uint8_t dip_ch2_nc = (uint8_t)((dip & NAMUR_DIP_CH2_NC) != 0U);
      0008E6 53 04 02         [24] 1098 	anl	ar4,#0x02
      0008E9 EC               [12] 1099 	mov	a,r4
      0008EA B4 01 00         [24] 1100 	cjne	a,#0x01,00105$
      0008ED                       1101 00105$:
      0008ED B3               [12] 1102 	cpl	c
      0008EE 92 00            [24] 1103 	mov	_namur_logic_update_sloc0_1_0,c
      0008F0 E4               [12] 1104 	clr	a
      0008F1 33               [12] 1105 	rlc	a
      0008F2 FC               [12] 1106 	mov	r4,a
                                   1107 ;	src/app/namur_logic.c:146: ctx->dip = dip;
      0008F3 74 18            [12] 1108 	mov	a,#0x18
      0008F5 2D               [12] 1109 	add	a, r5
      0008F6 F8               [12] 1110 	mov	r0,a
      0008F7 E4               [12] 1111 	clr	a
      0008F8 3E               [12] 1112 	addc	a, r6
      0008F9 F9               [12] 1113 	mov	r1,a
      0008FA 8F 02            [24] 1114 	mov	ar2,r7
      0008FC 88 82            [24] 1115 	mov	dpl,r0
      0008FE 89 83            [24] 1116 	mov	dph,r1
      000900 8A F0            [24] 1117 	mov	b,r2
      000902 E5 13            [12] 1118 	mov	a,_namur_logic_update_PARM_4
      000904 12 09 75         [24] 1119 	lcall	__gptrput
                                   1120 ;	src/app/namur_logic.c:148: update_channel(&ctx->ch[0], adc_ch1, dip_ch1_nc, fault_suppress);
      000907 8D 00            [24] 1121 	mov	ar0,r5
      000909 8E 01            [24] 1122 	mov	ar1,r6
      00090B 8F 02            [24] 1123 	mov	ar2,r7
      00090D 85 0F 08         [24] 1124 	mov	_update_channel_PARM_2,_namur_logic_update_PARM_2
      000910 85 10 09         [24] 1125 	mov	(_update_channel_PARM_2 + 1),(_namur_logic_update_PARM_2 + 1)
      000913 8B 0B            [24] 1126 	mov	_update_channel_PARM_4,r3
      000915 88 82            [24] 1127 	mov	dpl, r0
      000917 89 83            [24] 1128 	mov	dph, r1
      000919 8A F0            [24] 1129 	mov	b, r2
      00091B C0 07            [24] 1130 	push	ar7
      00091D C0 06            [24] 1131 	push	ar6
      00091F C0 05            [24] 1132 	push	ar5
      000921 C0 04            [24] 1133 	push	ar4
      000923 C0 03            [24] 1134 	push	ar3
      000925 12 06 21         [24] 1135 	lcall	_update_channel
      000928 D0 03            [24] 1136 	pop	ar3
      00092A D0 04            [24] 1137 	pop	ar4
      00092C D0 05            [24] 1138 	pop	ar5
      00092E D0 06            [24] 1139 	pop	ar6
      000930 D0 07            [24] 1140 	pop	ar7
                                   1141 ;	src/app/namur_logic.c:149: update_channel(&ctx->ch[1], adc_ch2, dip_ch2_nc, fault_suppress);
      000932 74 0C            [12] 1142 	mov	a,#0x0c
      000934 2D               [12] 1143 	add	a, r5
      000935 FD               [12] 1144 	mov	r5,a
      000936 E4               [12] 1145 	clr	a
      000937 3E               [12] 1146 	addc	a, r6
      000938 FE               [12] 1147 	mov	r6,a
      000939 85 11 08         [24] 1148 	mov	_update_channel_PARM_2,_namur_logic_update_PARM_3
      00093C 85 12 09         [24] 1149 	mov	(_update_channel_PARM_2 + 1),(_namur_logic_update_PARM_3 + 1)
      00093F 8C 0A            [24] 1150 	mov	_update_channel_PARM_3,r4
      000941 8B 0B            [24] 1151 	mov	_update_channel_PARM_4,r3
      000943 8D 82            [24] 1152 	mov	dpl, r5
      000945 8E 83            [24] 1153 	mov	dph, r6
      000947 8F F0            [24] 1154 	mov	b, r7
                                   1155 ;	src/app/namur_logic.c:150: }
      000949 02 06 21         [24] 1156 	ljmp	_update_channel
                                   1157 	.area CSEG    (CODE)
                                   1158 	.area CONST   (CODE)
                                   1159 	.area XINIT   (CODE)
                                   1160 	.area CABS    (ABS,CODE)
