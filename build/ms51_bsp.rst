                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module ms51_bsp
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _AINDIDS
                                     12 	.globl _ADCDH
                                     13 	.globl _ADCDL
                                     14 	.globl _ADCCON2
                                     15 	.globl _ADCDLY
                                     16 	.globl _ADCCON1
                                     17 	.globl _ADCCON0
                                     18 	.globl _P2M2
                                     19 	.globl _P2M1
                                     20 	.globl _P1M2
                                     21 	.globl _P1M1
                                     22 	.globl _P0M2
                                     23 	.globl _P0M1
                                     24 	.globl _WDCON
                                     25 	.globl _BODCON0
                                     26 	.globl _CLKCON
                                     27 	.globl _P2
                                     28 	.globl _P1
                                     29 	.globl _P0
                                     30 	.globl _bsp_init
                                     31 	.globl _bsp_delay_ms
                                     32 	.globl _bsp_read_dip
                                     33 	.globl _bsp_adc_read_channel
                                     34 	.globl _bsp_led_ch1_sense
                                     35 	.globl _bsp_led_ch2_sense
                                     36 	.globl _bsp_led_ch1_fault
                                     37 	.globl _bsp_led_ch2_fault
                                     38 	.globl _bsp_clear_wdt
                                     39 	.globl _bsp_hardware_failure
                                     40 ;--------------------------------------------------------
                                     41 ; special function registers
                                     42 ;--------------------------------------------------------
                                     43 	.area RSEG    (ABS,DATA)
      000000                         44 	.org 0x0000
                           000080    45 _P0	=	0x0080
                           000090    46 _P1	=	0x0090
                           0000A0    47 _P2	=	0x00a0
                           00008E    48 _CLKCON	=	0x008e
                           000086    49 _BODCON0	=	0x0086
                           0000AA    50 _WDCON	=	0x00aa
                           0000B1    51 _P0M1	=	0x00b1
                           0000B2    52 _P0M2	=	0x00b2
                           0000B3    53 _P1M1	=	0x00b3
                           0000B4    54 _P1M2	=	0x00b4
                           0000B5    55 _P2M1	=	0x00b5
                           0000B6    56 _P2M2	=	0x00b6
                           0000E8    57 _ADCCON0	=	0x00e8
                           0000E9    58 _ADCCON1	=	0x00e9
                           0000EA    59 _ADCDLY	=	0x00ea
                           0000EB    60 _ADCCON2	=	0x00eb
                           0000EC    61 _ADCDL	=	0x00ec
                           0000ED    62 _ADCDH	=	0x00ed
                           0000CE    63 _AINDIDS	=	0x00ce
                                     64 ;--------------------------------------------------------
                                     65 ; special function bits
                                     66 ;--------------------------------------------------------
                                     67 	.area RSEG    (ABS,DATA)
      000000                         68 	.org 0x0000
                                     69 ;--------------------------------------------------------
                                     70 ; overlayable register banks
                                     71 ;--------------------------------------------------------
                                     72 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                         73 	.ds 8
                                     74 ;--------------------------------------------------------
                                     75 ; internal ram data
                                     76 ;--------------------------------------------------------
                                     77 	.area DSEG    (DATA)
                                     78 ;--------------------------------------------------------
                                     79 ; overlayable items in internal ram
                                     80 ;--------------------------------------------------------
                                     81 	.area	OSEG    (OVR,DATA)
      000014                         82 _gpio_set_mode_PARM_2:
      000014                         83 	.ds 1
      000015                         84 _gpio_set_mode_PARM_3:
      000015                         85 	.ds 1
                                     86 	.area	OSEG    (OVR,DATA)
      000014                         87 _gpio_write_PARM_2:
      000014                         88 	.ds 1
      000015                         89 _gpio_write_PARM_3:
      000015                         90 	.ds 1
                                     91 	.area	OSEG    (OVR,DATA)
      000014                         92 _gpio_read_PARM_2:
      000014                         93 	.ds 1
                                     94 	.area	OSEG    (OVR,DATA)
                                     95 ;--------------------------------------------------------
                                     96 ; indirectly addressable internal ram data
                                     97 ;--------------------------------------------------------
                                     98 	.area ISEG    (DATA)
                                     99 ;--------------------------------------------------------
                                    100 ; absolute internal ram data
                                    101 ;--------------------------------------------------------
                                    102 	.area IABS    (ABS,DATA)
                                    103 	.area IABS    (ABS,DATA)
                                    104 ;--------------------------------------------------------
                                    105 ; bit data
                                    106 ;--------------------------------------------------------
                                    107 	.area BSEG    (BIT)
                                    108 ;--------------------------------------------------------
                                    109 ; paged external ram data
                                    110 ;--------------------------------------------------------
                                    111 	.area PSEG    (PAG,XDATA)
                                    112 ;--------------------------------------------------------
                                    113 ; uninitialized external ram data
                                    114 ;--------------------------------------------------------
                                    115 	.area XSEG    (XDATA)
                                    116 ;--------------------------------------------------------
                                    117 ; absolute external ram data
                                    118 ;--------------------------------------------------------
                                    119 	.area XABS    (ABS,XDATA)
                                    120 ;--------------------------------------------------------
                                    121 ; initialized external ram data
                                    122 ;--------------------------------------------------------
                                    123 	.area XISEG   (XDATA)
                                    124 	.area HOME    (CODE)
                                    125 	.area GSINIT0 (CODE)
                                    126 	.area GSINIT1 (CODE)
                                    127 	.area GSINIT2 (CODE)
                                    128 	.area GSINIT3 (CODE)
                                    129 	.area GSINIT4 (CODE)
                                    130 	.area GSINIT5 (CODE)
                                    131 	.area GSINIT  (CODE)
                                    132 	.area GSFINAL (CODE)
                                    133 	.area CSEG    (CODE)
                                    134 ;--------------------------------------------------------
                                    135 ; global & static initialisations
                                    136 ;--------------------------------------------------------
                                    137 	.area HOME    (CODE)
                                    138 	.area GSINIT  (CODE)
                                    139 	.area GSFINAL (CODE)
                                    140 	.area GSINIT  (CODE)
                                    141 ;--------------------------------------------------------
                                    142 ; Home
                                    143 ;--------------------------------------------------------
                                    144 	.area HOME    (CODE)
                                    145 	.area HOME    (CODE)
                                    146 ;--------------------------------------------------------
                                    147 ; code
                                    148 ;--------------------------------------------------------
                                    149 	.area CSEG    (CODE)
                                    150 ;------------------------------------------------------------
                                    151 ;Allocation info for local variables in function 'bsp_clock_init'
                                    152 ;------------------------------------------------------------
                                    153 ;	src/bsp/ms51_bsp.c:27: static void bsp_clock_init(void)
                                    154 ;	-----------------------------------------
                                    155 ;	 function bsp_clock_init
                                    156 ;	-----------------------------------------
      00010D                        157 _bsp_clock_init:
                           000007   158 	ar7 = 0x07
                           000006   159 	ar6 = 0x06
                           000005   160 	ar5 = 0x05
                           000004   161 	ar4 = 0x04
                           000003   162 	ar3 = 0x03
                           000002   163 	ar2 = 0x02
                           000001   164 	ar1 = 0x01
                           000000   165 	ar0 = 0x00
                                    166 ;	src/bsp/ms51_bsp.c:29: CLKCON = (CLKCON & (unsigned char)~0x70) | CLKCON_HIRC_16M;
      00010D 74 8F            [12]  167 	mov	a,#0x8f
      00010F 55 8E            [12]  168 	anl	a,_CLKCON
      000111 44 30            [12]  169 	orl	a,#0x30
      000113 F5 8E            [12]  170 	mov	_CLKCON,a
                                    171 ;	src/bsp/ms51_bsp.c:30: }
      000115 22               [24]  172 	ret
                                    173 ;------------------------------------------------------------
                                    174 ;Allocation info for local variables in function 'bsp_configure_bod'
                                    175 ;------------------------------------------------------------
                                    176 ;	src/bsp/ms51_bsp.c:32: static void bsp_configure_bod(void)
                                    177 ;	-----------------------------------------
                                    178 ;	 function bsp_configure_bod
                                    179 ;	-----------------------------------------
      000116                        180 _bsp_configure_bod:
                                    181 ;	src/bsp/ms51_bsp.c:35: BODCON0 = (unsigned char)(BODCON0_BOVEN | BODCON0_BODRSTEN | 0x06);
      000116 75 86 86         [24]  182 	mov	_BODCON0,#0x86
                                    183 ;	src/bsp/ms51_bsp.c:36: (void)BSP_BOD_THRESHOLD_MV;
                                    184 ;	src/bsp/ms51_bsp.c:37: }
      000119 22               [24]  185 	ret
                                    186 ;------------------------------------------------------------
                                    187 ;Allocation info for local variables in function 'bsp_configure_wdt'
                                    188 ;------------------------------------------------------------
                                    189 ;	src/bsp/ms51_bsp.c:39: static void bsp_configure_wdt(void)
                                    190 ;	-----------------------------------------
                                    191 ;	 function bsp_configure_wdt
                                    192 ;	-----------------------------------------
      00011A                        193 _bsp_configure_wdt:
                                    194 ;	src/bsp/ms51_bsp.c:41: WDCON = (unsigned char)((WDCON & (unsigned char)~0x07) | WDCON_WDTEN | 0x05);
      00011A 74 F8            [12]  195 	mov	a,#0xf8
      00011C 55 AA            [12]  196 	anl	a,_WDCON
      00011E 44 05            [12]  197 	orl	a,#0x05
      000120 F5 AA            [12]  198 	mov	_WDCON,a
                                    199 ;	src/bsp/ms51_bsp.c:42: (void)BSP_WDT_TIMEOUT_MS;
                                    200 ;	src/bsp/ms51_bsp.c:43: }
      000122 22               [24]  201 	ret
                                    202 ;------------------------------------------------------------
                                    203 ;Allocation info for local variables in function 'gpio_set_mode'
                                    204 ;------------------------------------------------------------
                                    205 ;bit           Allocated with name '_gpio_set_mode_PARM_2'
                                    206 ;is_output     Allocated with name '_gpio_set_mode_PARM_3'
                                    207 ;port          Allocated to registers r7 
                                    208 ;------------------------------------------------------------
                                    209 ;	src/bsp/ms51_bsp.c:45: static void gpio_set_mode(uint8_t port, uint8_t bit, uint8_t is_output)
                                    210 ;	-----------------------------------------
                                    211 ;	 function gpio_set_mode
                                    212 ;	-----------------------------------------
      000123                        213 _gpio_set_mode:
      000123 AF 82            [24]  214 	mov	r7, dpl
                                    215 ;	src/bsp/ms51_bsp.c:47: if (port == 1U) {
      000125 BF 01 30         [24]  216 	cjne	r7,#0x01,00110$
                                    217 ;	src/bsp/ms51_bsp.c:48: if (is_output) {
      000128 E5 15            [12]  218 	mov	a,_gpio_set_mode_PARM_3
      00012A 60 16            [24]  219 	jz	00102$
                                    220 ;	src/bsp/ms51_bsp.c:49: P1M1 &= (unsigned char)~(1U << bit);
      00012C 85 14 F0         [24]  221 	mov	b,_gpio_set_mode_PARM_2
      00012F 05 F0            [12]  222 	inc	b
      000131 74 01            [12]  223 	mov	a,#0x01
      000133 80 02            [24]  224 	sjmp	00142$
      000135                        225 00141$:
      000135 25 E0            [12]  226 	add	a,acc
      000137                        227 00142$:
      000137 D5 F0 FB         [24]  228 	djnz	b,00141$
      00013A FE               [12]  229 	mov	r6,a
      00013B F4               [12]  230 	cpl	a
      00013C 52 B3            [12]  231 	anl	_P1M1,a
                                    232 ;	src/bsp/ms51_bsp.c:50: P1M2 |= (unsigned char)(1U << bit);
      00013E EE               [12]  233 	mov	a,r6
      00013F 42 B4            [12]  234 	orl	_P1M2,a
      000141 22               [24]  235 	ret
      000142                        236 00102$:
                                    237 ;	src/bsp/ms51_bsp.c:52: P1M1 |= (unsigned char)(1U << bit);
      000142 85 14 F0         [24]  238 	mov	b,_gpio_set_mode_PARM_2
      000145 05 F0            [12]  239 	inc	b
      000147 74 01            [12]  240 	mov	a,#0x01
      000149 80 02            [24]  241 	sjmp	00144$
      00014B                        242 00143$:
      00014B 25 E0            [12]  243 	add	a,acc
      00014D                        244 00144$:
      00014D D5 F0 FB         [24]  245 	djnz	b,00143$
      000150 FE               [12]  246 	mov	r6,a
      000151 42 B3            [12]  247 	orl	_P1M1,a
                                    248 ;	src/bsp/ms51_bsp.c:53: P1M2 &= (unsigned char)~(1U << bit);
      000153 EE               [12]  249 	mov	a,r6
      000154 F4               [12]  250 	cpl	a
      000155 52 B4            [12]  251 	anl	_P1M2,a
      000157 22               [24]  252 	ret
      000158                        253 00110$:
                                    254 ;	src/bsp/ms51_bsp.c:55: } else if (port == 2U) {
      000158 BF 02 2F         [24]  255 	cjne	r7,#0x02,00112$
                                    256 ;	src/bsp/ms51_bsp.c:56: if (is_output) {
      00015B E5 15            [12]  257 	mov	a,_gpio_set_mode_PARM_3
      00015D 60 16            [24]  258 	jz	00105$
                                    259 ;	src/bsp/ms51_bsp.c:57: P2M1 &= (unsigned char)~(1U << bit);
      00015F 85 14 F0         [24]  260 	mov	b,_gpio_set_mode_PARM_2
      000162 05 F0            [12]  261 	inc	b
      000164 74 01            [12]  262 	mov	a,#0x01
      000166 80 02            [24]  263 	sjmp	00149$
      000168                        264 00148$:
      000168 25 E0            [12]  265 	add	a,acc
      00016A                        266 00149$:
      00016A D5 F0 FB         [24]  267 	djnz	b,00148$
      00016D FF               [12]  268 	mov	r7,a
      00016E F4               [12]  269 	cpl	a
      00016F 52 B5            [12]  270 	anl	_P2M1,a
                                    271 ;	src/bsp/ms51_bsp.c:58: P2M2 |= (unsigned char)(1U << bit);
      000171 EF               [12]  272 	mov	a,r7
      000172 42 B6            [12]  273 	orl	_P2M2,a
      000174 22               [24]  274 	ret
      000175                        275 00105$:
                                    276 ;	src/bsp/ms51_bsp.c:60: P2M1 |= (unsigned char)(1U << bit);
      000175 85 14 F0         [24]  277 	mov	b,_gpio_set_mode_PARM_2
      000178 05 F0            [12]  278 	inc	b
      00017A 74 01            [12]  279 	mov	a,#0x01
      00017C 80 02            [24]  280 	sjmp	00151$
      00017E                        281 00150$:
      00017E 25 E0            [12]  282 	add	a,acc
      000180                        283 00151$:
      000180 D5 F0 FB         [24]  284 	djnz	b,00150$
      000183 FF               [12]  285 	mov	r7,a
      000184 42 B5            [12]  286 	orl	_P2M1,a
                                    287 ;	src/bsp/ms51_bsp.c:61: P2M2 &= (unsigned char)~(1U << bit);
      000186 EF               [12]  288 	mov	a,r7
      000187 F4               [12]  289 	cpl	a
      000188 52 B6            [12]  290 	anl	_P2M2,a
      00018A                        291 00112$:
                                    292 ;	src/bsp/ms51_bsp.c:64: }
      00018A 22               [24]  293 	ret
                                    294 ;------------------------------------------------------------
                                    295 ;Allocation info for local variables in function 'gpio_write'
                                    296 ;------------------------------------------------------------
                                    297 ;bit           Allocated with name '_gpio_write_PARM_2'
                                    298 ;on            Allocated with name '_gpio_write_PARM_3'
                                    299 ;port          Allocated to registers r7 
                                    300 ;------------------------------------------------------------
                                    301 ;	src/bsp/ms51_bsp.c:66: static void gpio_write(uint8_t port, uint8_t bit, uint8_t on)
                                    302 ;	-----------------------------------------
                                    303 ;	 function gpio_write
                                    304 ;	-----------------------------------------
      00018B                        305 _gpio_write:
      00018B AF 82            [24]  306 	mov	r7, dpl
                                    307 ;	src/bsp/ms51_bsp.c:68: if (port == 1U) {
      00018D BF 01 27         [24]  308 	cjne	r7,#0x01,00110$
                                    309 ;	src/bsp/ms51_bsp.c:69: if (on) {
      000190 E5 15            [12]  310 	mov	a,_gpio_write_PARM_3
      000192 60 11            [24]  311 	jz	00102$
                                    312 ;	src/bsp/ms51_bsp.c:70: P1 |= (unsigned char)(1U << bit);
      000194 85 14 F0         [24]  313 	mov	b,_gpio_write_PARM_2
      000197 05 F0            [12]  314 	inc	b
      000199 74 01            [12]  315 	mov	a,#0x01
      00019B 80 02            [24]  316 	sjmp	00142$
      00019D                        317 00141$:
      00019D 25 E0            [12]  318 	add	a,acc
      00019F                        319 00142$:
      00019F D5 F0 FB         [24]  320 	djnz	b,00141$
      0001A2 42 90            [12]  321 	orl	_P1,a
      0001A4 22               [24]  322 	ret
      0001A5                        323 00102$:
                                    324 ;	src/bsp/ms51_bsp.c:72: P1 &= (unsigned char)~(1U << bit);
      0001A5 85 14 F0         [24]  325 	mov	b,_gpio_write_PARM_2
      0001A8 05 F0            [12]  326 	inc	b
      0001AA 74 01            [12]  327 	mov	a,#0x01
      0001AC 80 02            [24]  328 	sjmp	00144$
      0001AE                        329 00143$:
      0001AE 25 E0            [12]  330 	add	a,acc
      0001B0                        331 00144$:
      0001B0 D5 F0 FB         [24]  332 	djnz	b,00143$
      0001B3 F4               [12]  333 	cpl	a
      0001B4 52 90            [12]  334 	anl	_P1,a
      0001B6 22               [24]  335 	ret
      0001B7                        336 00110$:
                                    337 ;	src/bsp/ms51_bsp.c:74: } else if (port == 2U) {
      0001B7 BF 02 26         [24]  338 	cjne	r7,#0x02,00112$
                                    339 ;	src/bsp/ms51_bsp.c:75: if (on) {
      0001BA E5 15            [12]  340 	mov	a,_gpio_write_PARM_3
      0001BC 60 11            [24]  341 	jz	00105$
                                    342 ;	src/bsp/ms51_bsp.c:76: P2 |= (unsigned char)(1U << bit);
      0001BE 85 14 F0         [24]  343 	mov	b,_gpio_write_PARM_2
      0001C1 05 F0            [12]  344 	inc	b
      0001C3 74 01            [12]  345 	mov	a,#0x01
      0001C5 80 02            [24]  346 	sjmp	00149$
      0001C7                        347 00148$:
      0001C7 25 E0            [12]  348 	add	a,acc
      0001C9                        349 00149$:
      0001C9 D5 F0 FB         [24]  350 	djnz	b,00148$
      0001CC 42 A0            [12]  351 	orl	_P2,a
      0001CE 22               [24]  352 	ret
      0001CF                        353 00105$:
                                    354 ;	src/bsp/ms51_bsp.c:78: P2 &= (unsigned char)~(1U << bit);
      0001CF 85 14 F0         [24]  355 	mov	b,_gpio_write_PARM_2
      0001D2 05 F0            [12]  356 	inc	b
      0001D4 74 01            [12]  357 	mov	a,#0x01
      0001D6 80 02            [24]  358 	sjmp	00151$
      0001D8                        359 00150$:
      0001D8 25 E0            [12]  360 	add	a,acc
      0001DA                        361 00151$:
      0001DA D5 F0 FB         [24]  362 	djnz	b,00150$
      0001DD F4               [12]  363 	cpl	a
      0001DE 52 A0            [12]  364 	anl	_P2,a
      0001E0                        365 00112$:
                                    366 ;	src/bsp/ms51_bsp.c:81: }
      0001E0 22               [24]  367 	ret
                                    368 ;------------------------------------------------------------
                                    369 ;Allocation info for local variables in function 'gpio_read'
                                    370 ;------------------------------------------------------------
                                    371 ;bit           Allocated with name '_gpio_read_PARM_2'
                                    372 ;port          Allocated to registers r7 
                                    373 ;------------------------------------------------------------
                                    374 ;	src/bsp/ms51_bsp.c:83: static uint8_t gpio_read(uint8_t port, uint8_t bit)
                                    375 ;	-----------------------------------------
                                    376 ;	 function gpio_read
                                    377 ;	-----------------------------------------
      0001E1                        378 _gpio_read:
      0001E1 AF 82            [24]  379 	mov	r7, dpl
                                    380 ;	src/bsp/ms51_bsp.c:85: if (port == 1U) {
      0001E3 BF 01 13         [24]  381 	cjne	r7,#0x01,00102$
                                    382 ;	src/bsp/ms51_bsp.c:86: return (P1 >> bit) & 1U;
      0001E6 85 14 F0         [24]  383 	mov	b,_gpio_read_PARM_2
      0001E9 05 F0            [12]  384 	inc	b
      0001EB E5 90            [12]  385 	mov	a,_P1
      0001ED 80 02            [24]  386 	sjmp	00122$
      0001EF                        387 00121$:
      0001EF C3               [12]  388 	clr	c
      0001F0 13               [12]  389 	rrc	a
      0001F1                        390 00122$:
      0001F1 D5 F0 FB         [24]  391 	djnz	b,00121$
      0001F4 54 01            [12]  392 	anl	a,#0x01
      0001F6 F5 82            [12]  393 	mov	dpl,a
      0001F8 22               [24]  394 	ret
      0001F9                        395 00102$:
                                    396 ;	src/bsp/ms51_bsp.c:88: if (port == 2U) {
      0001F9 BF 02 13         [24]  397 	cjne	r7,#0x02,00104$
                                    398 ;	src/bsp/ms51_bsp.c:89: return (P2 >> bit) & 1U;
      0001FC 85 14 F0         [24]  399 	mov	b,_gpio_read_PARM_2
      0001FF 05 F0            [12]  400 	inc	b
      000201 E5 A0            [12]  401 	mov	a,_P2
      000203 80 02            [24]  402 	sjmp	00126$
      000205                        403 00125$:
      000205 C3               [12]  404 	clr	c
      000206 13               [12]  405 	rrc	a
      000207                        406 00126$:
      000207 D5 F0 FB         [24]  407 	djnz	b,00125$
      00020A 54 01            [12]  408 	anl	a,#0x01
      00020C F5 82            [12]  409 	mov	dpl,a
      00020E 22               [24]  410 	ret
      00020F                        411 00104$:
                                    412 ;	src/bsp/ms51_bsp.c:91: return 0U;
      00020F 75 82 00         [24]  413 	mov	dpl, #0x00
                                    414 ;	src/bsp/ms51_bsp.c:92: }
      000212 22               [24]  415 	ret
                                    416 ;------------------------------------------------------------
                                    417 ;Allocation info for local variables in function 'bsp_gpio_init'
                                    418 ;------------------------------------------------------------
                                    419 ;	src/bsp/ms51_bsp.c:94: static void bsp_gpio_init(void)
                                    420 ;	-----------------------------------------
                                    421 ;	 function bsp_gpio_init
                                    422 ;	-----------------------------------------
      000213                        423 _bsp_gpio_init:
                                    424 ;	src/bsp/ms51_bsp.c:96: gpio_set_mode(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT, 0U);
      000213 75 14 00         [24]  425 	mov	_gpio_set_mode_PARM_2,#0x00
      000216 75 15 00         [24]  426 	mov	_gpio_set_mode_PARM_3,#0x00
      000219 75 82 01         [24]  427 	mov	dpl, #0x01
      00021C 12 01 23         [24]  428 	lcall	_gpio_set_mode
                                    429 ;	src/bsp/ms51_bsp.c:97: gpio_set_mode(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT, 0U);
      00021F 75 14 01         [24]  430 	mov	_gpio_set_mode_PARM_2,#0x01
      000222 75 15 00         [24]  431 	mov	_gpio_set_mode_PARM_3,#0x00
      000225 75 82 01         [24]  432 	mov	dpl, #0x01
      000228 12 01 23         [24]  433 	lcall	_gpio_set_mode
                                    434 ;	src/bsp/ms51_bsp.c:98: gpio_set_mode(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT, 0U);
      00022B 75 14 02         [24]  435 	mov	_gpio_set_mode_PARM_2,#0x02
      00022E 75 15 00         [24]  436 	mov	_gpio_set_mode_PARM_3,#0x00
      000231 75 82 01         [24]  437 	mov	dpl, #0x01
      000234 12 01 23         [24]  438 	lcall	_gpio_set_mode
                                    439 ;	src/bsp/ms51_bsp.c:100: gpio_set_mode(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 1U);
      000237 75 14 00         [24]  440 	mov	_gpio_set_mode_PARM_2,#0x00
      00023A 75 15 01         [24]  441 	mov	_gpio_set_mode_PARM_3,#0x01
      00023D 75 82 02         [24]  442 	mov	dpl, #0x02
      000240 12 01 23         [24]  443 	lcall	_gpio_set_mode
                                    444 ;	src/bsp/ms51_bsp.c:101: gpio_set_mode(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 1U);
      000243 75 14 01         [24]  445 	mov	_gpio_set_mode_PARM_2,#0x01
      000246 75 15 01         [24]  446 	mov	_gpio_set_mode_PARM_3,#0x01
      000249 75 82 02         [24]  447 	mov	dpl, #0x02
      00024C 12 01 23         [24]  448 	lcall	_gpio_set_mode
                                    449 ;	src/bsp/ms51_bsp.c:102: gpio_set_mode(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 1U);
      00024F 75 14 02         [24]  450 	mov	_gpio_set_mode_PARM_2,#0x02
      000252 75 15 01         [24]  451 	mov	_gpio_set_mode_PARM_3,#0x01
      000255 75 82 02         [24]  452 	mov	dpl, #0x02
      000258 12 01 23         [24]  453 	lcall	_gpio_set_mode
                                    454 ;	src/bsp/ms51_bsp.c:103: gpio_set_mode(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 1U);
      00025B 75 14 03         [24]  455 	mov	_gpio_set_mode_PARM_2,#0x03
      00025E 75 15 01         [24]  456 	mov	_gpio_set_mode_PARM_3,#0x01
      000261 75 82 02         [24]  457 	mov	dpl, #0x02
      000264 12 01 23         [24]  458 	lcall	_gpio_set_mode
                                    459 ;	src/bsp/ms51_bsp.c:105: gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, 0U);
      000267 75 14 00         [24]  460 	mov	_gpio_write_PARM_2,#0x00
      00026A 75 15 00         [24]  461 	mov	_gpio_write_PARM_3,#0x00
      00026D 75 82 02         [24]  462 	mov	dpl, #0x02
      000270 12 01 8B         [24]  463 	lcall	_gpio_write
                                    464 ;	src/bsp/ms51_bsp.c:106: gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, 0U);
      000273 75 14 01         [24]  465 	mov	_gpio_write_PARM_2,#0x01
      000276 75 15 00         [24]  466 	mov	_gpio_write_PARM_3,#0x00
      000279 75 82 02         [24]  467 	mov	dpl, #0x02
      00027C 12 01 8B         [24]  468 	lcall	_gpio_write
                                    469 ;	src/bsp/ms51_bsp.c:107: gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, 0U);
      00027F 75 14 02         [24]  470 	mov	_gpio_write_PARM_2,#0x02
      000282 75 15 00         [24]  471 	mov	_gpio_write_PARM_3,#0x00
      000285 75 82 02         [24]  472 	mov	dpl, #0x02
      000288 12 01 8B         [24]  473 	lcall	_gpio_write
                                    474 ;	src/bsp/ms51_bsp.c:108: gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, 0U);
      00028B 75 14 03         [24]  475 	mov	_gpio_write_PARM_2,#0x03
      00028E 75 15 00         [24]  476 	mov	_gpio_write_PARM_3,#0x00
      000291 75 82 02         [24]  477 	mov	dpl, #0x02
                                    478 ;	src/bsp/ms51_bsp.c:109: }
      000294 02 01 8B         [24]  479 	ljmp	_gpio_write
                                    480 ;------------------------------------------------------------
                                    481 ;Allocation info for local variables in function 'bsp_adc_init'
                                    482 ;------------------------------------------------------------
                                    483 ;	src/bsp/ms51_bsp.c:111: static void bsp_adc_init(void)
                                    484 ;	-----------------------------------------
                                    485 ;	 function bsp_adc_init
                                    486 ;	-----------------------------------------
      000297                        487 _bsp_adc_init:
                                    488 ;	src/bsp/ms51_bsp.c:113: ADCCON1 = 0x00;
      000297 75 E9 00         [24]  489 	mov	_ADCCON1,#0x00
                                    490 ;	src/bsp/ms51_bsp.c:114: ADCCON2 = 0x00;
      00029A 75 EB 00         [24]  491 	mov	_ADCCON2,#0x00
                                    492 ;	src/bsp/ms51_bsp.c:115: ADCDLY = 0x0A;
      00029D 75 EA 0A         [24]  493 	mov	_ADCDLY,#0x0a
                                    494 ;	src/bsp/ms51_bsp.c:116: ADCCON0 = 0x01;
      0002A0 75 E8 01         [24]  495 	mov	_ADCCON0,#0x01
                                    496 ;	src/bsp/ms51_bsp.c:117: AINDIDS = 0x03;
      0002A3 75 CE 03         [24]  497 	mov	_AINDIDS,#0x03
                                    498 ;	src/bsp/ms51_bsp.c:118: }
      0002A6 22               [24]  499 	ret
                                    500 ;------------------------------------------------------------
                                    501 ;Allocation info for local variables in function 'bsp_init'
                                    502 ;------------------------------------------------------------
                                    503 ;	src/bsp/ms51_bsp.c:120: void bsp_init(void)
                                    504 ;	-----------------------------------------
                                    505 ;	 function bsp_init
                                    506 ;	-----------------------------------------
      0002A7                        507 _bsp_init:
                                    508 ;	src/bsp/ms51_bsp.c:122: bsp_clock_init();
      0002A7 12 01 0D         [24]  509 	lcall	_bsp_clock_init
                                    510 ;	src/bsp/ms51_bsp.c:123: bsp_gpio_init();
      0002AA 12 02 13         [24]  511 	lcall	_bsp_gpio_init
                                    512 ;	src/bsp/ms51_bsp.c:124: bsp_configure_bod();
      0002AD 12 01 16         [24]  513 	lcall	_bsp_configure_bod
                                    514 ;	src/bsp/ms51_bsp.c:125: bsp_configure_wdt();
      0002B0 12 01 1A         [24]  515 	lcall	_bsp_configure_wdt
                                    516 ;	src/bsp/ms51_bsp.c:126: bsp_adc_init();
                                    517 ;	src/bsp/ms51_bsp.c:127: }
      0002B3 02 02 97         [24]  518 	ljmp	_bsp_adc_init
                                    519 ;------------------------------------------------------------
                                    520 ;Allocation info for local variables in function 'bsp_delay_ms'
                                    521 ;------------------------------------------------------------
                                    522 ;ms            Allocated to registers 
                                    523 ;i             Allocated to registers r4 r5 
                                    524 ;------------------------------------------------------------
                                    525 ;	src/bsp/ms51_bsp.c:129: void bsp_delay_ms(uint16_t ms)
                                    526 ;	-----------------------------------------
                                    527 ;	 function bsp_delay_ms
                                    528 ;	-----------------------------------------
      0002B6                        529 _bsp_delay_ms:
      0002B6 AE 82            [24]  530 	mov	r6, dpl
      0002B8 AF 83            [24]  531 	mov	r7, dph
                                    532 ;	src/bsp/ms51_bsp.c:132: while (ms--) {
      0002BA                        533 00102$:
      0002BA 8E 04            [24]  534 	mov	ar4,r6
      0002BC 8F 05            [24]  535 	mov	ar5,r7
      0002BE 1E               [12]  536 	dec	r6
      0002BF BE FF 01         [24]  537 	cjne	r6,#0xff,00136$
      0002C2 1F               [12]  538 	dec	r7
      0002C3                        539 00136$:
      0002C3 EC               [12]  540 	mov	a,r4
      0002C4 4D               [12]  541 	orl	a,r5
      0002C5 60 10            [24]  542 	jz	00108$
                                    543 ;	src/bsp/ms51_bsp.c:134: for (i = 0; i < 1600U; i++) {
      0002C7 7C 40            [12]  544 	mov	r4,#0x40
      0002C9 7D 06            [12]  545 	mov	r5,#0x06
      0002CB                        546 00107$:
                                    547 ;	src/bsp/ms51_bsp.c:135: __asm__("nop");
      0002CB 00               [12]  548 	nop
      0002CC 1C               [12]  549 	dec	r4
      0002CD BC FF 01         [24]  550 	cjne	r4,#0xff,00138$
      0002D0 1D               [12]  551 	dec	r5
      0002D1                        552 00138$:
                                    553 ;	src/bsp/ms51_bsp.c:134: for (i = 0; i < 1600U; i++) {
      0002D1 EC               [12]  554 	mov	a,r4
      0002D2 4D               [12]  555 	orl	a,r5
      0002D3 70 F6            [24]  556 	jnz	00107$
      0002D5 80 E3            [24]  557 	sjmp	00102$
      0002D7                        558 00108$:
                                    559 ;	src/bsp/ms51_bsp.c:138: }
      0002D7 22               [24]  560 	ret
                                    561 ;------------------------------------------------------------
                                    562 ;Allocation info for local variables in function 'bsp_read_dip'
                                    563 ;------------------------------------------------------------
                                    564 ;dip           Allocated to registers r7 
                                    565 ;------------------------------------------------------------
                                    566 ;	src/bsp/ms51_bsp.c:140: uint8_t bsp_read_dip(void)
                                    567 ;	-----------------------------------------
                                    568 ;	 function bsp_read_dip
                                    569 ;	-----------------------------------------
      0002D8                        570 _bsp_read_dip:
                                    571 ;	src/bsp/ms51_bsp.c:142: uint8_t dip = 0U;
      0002D8 7F 00            [12]  572 	mov	r7,#0x00
                                    573 ;	src/bsp/ms51_bsp.c:144: if (gpio_read(NAMUR_DIP_CH1_PORT, NAMUR_DIP_CH1_BIT) == 0U) {
      0002DA 8F 14            [24]  574 	mov	_gpio_read_PARM_2,r7
      0002DC 75 82 01         [24]  575 	mov	dpl, #0x01
      0002DF C0 07            [24]  576 	push	ar7
      0002E1 12 01 E1         [24]  577 	lcall	_gpio_read
      0002E4 E5 82            [12]  578 	mov	a, dpl
      0002E6 D0 07            [24]  579 	pop	ar7
      0002E8 70 02            [24]  580 	jnz	00102$
                                    581 ;	src/bsp/ms51_bsp.c:145: dip |= NAMUR_DIP_CH1_NC;
      0002EA 7F 01            [12]  582 	mov	r7,#0x01
      0002EC                        583 00102$:
                                    584 ;	src/bsp/ms51_bsp.c:147: if (gpio_read(NAMUR_DIP_CH2_PORT, NAMUR_DIP_CH2_BIT) == 0U) {
      0002EC 75 14 01         [24]  585 	mov	_gpio_read_PARM_2,#0x01
      0002EF 75 82 01         [24]  586 	mov	dpl, #0x01
      0002F2 C0 07            [24]  587 	push	ar7
      0002F4 12 01 E1         [24]  588 	lcall	_gpio_read
      0002F7 E5 82            [12]  589 	mov	a, dpl
      0002F9 D0 07            [24]  590 	pop	ar7
      0002FB 70 03            [24]  591 	jnz	00104$
                                    592 ;	src/bsp/ms51_bsp.c:148: dip |= NAMUR_DIP_CH2_NC;
      0002FD 43 07 02         [24]  593 	orl	ar7,#0x02
      000300                        594 00104$:
                                    595 ;	src/bsp/ms51_bsp.c:150: if (gpio_read(NAMUR_DIP_FAULT_SUPPRESS_PORT, NAMUR_DIP_FAULT_SUPPRESS_BIT) == 0U) {
      000300 75 14 02         [24]  596 	mov	_gpio_read_PARM_2,#0x02
      000303 75 82 01         [24]  597 	mov	dpl, #0x01
      000306 C0 07            [24]  598 	push	ar7
      000308 12 01 E1         [24]  599 	lcall	_gpio_read
      00030B E5 82            [12]  600 	mov	a, dpl
      00030D D0 07            [24]  601 	pop	ar7
      00030F 70 03            [24]  602 	jnz	00106$
                                    603 ;	src/bsp/ms51_bsp.c:151: dip |= NAMUR_DIP_FAULT_SUPPRESS;
      000311 43 07 04         [24]  604 	orl	ar7,#0x04
      000314                        605 00106$:
                                    606 ;	src/bsp/ms51_bsp.c:153: return dip;
      000314 8F 82            [24]  607 	mov	dpl, r7
                                    608 ;	src/bsp/ms51_bsp.c:154: }
      000316 22               [24]  609 	ret
                                    610 ;------------------------------------------------------------
                                    611 ;Allocation info for local variables in function 'bsp_adc_read_channel'
                                    612 ;------------------------------------------------------------
                                    613 ;channel       Allocated to registers r7 
                                    614 ;timeout       Allocated to registers r6 r7 
                                    615 ;value         Allocated to registers 
                                    616 ;------------------------------------------------------------
                                    617 ;	src/bsp/ms51_bsp.c:156: uint16_t bsp_adc_read_channel(uint8_t channel)
                                    618 ;	-----------------------------------------
                                    619 ;	 function bsp_adc_read_channel
                                    620 ;	-----------------------------------------
      000317                        621 _bsp_adc_read_channel:
      000317 AF 82            [24]  622 	mov	r7, dpl
                                    623 ;	src/bsp/ms51_bsp.c:161: ADCCON0 = (unsigned char)((ADCCON0 & 0xF0) | (channel & 0x0FU) | ADCCON0_ADCTRG);
      000319 E5 E8            [12]  624 	mov	a,_ADCCON0
      00031B 54 F0            [12]  625 	anl	a,#0xf0
      00031D FE               [12]  626 	mov	r6,a
      00031E 74 0F            [12]  627 	mov	a,#0x0f
      000320 5F               [12]  628 	anl	a,r7
      000321 4E               [12]  629 	orl	a,r6
      000322 44 04            [12]  630 	orl	a,#0x04
      000324 F5 E8            [12]  631 	mov	_ADCCON0,a
                                    632 ;	src/bsp/ms51_bsp.c:162: while (((ADCCON0 & ADCCON0_ADCF) == 0U) && (timeout > 0U)) {
      000326 7E D0            [12]  633 	mov	r6,#0xd0
      000328 7F 07            [12]  634 	mov	r7,#0x07
      00032A                        635 00102$:
      00032A E5 E8            [12]  636 	mov	a,_ADCCON0
      00032C 20 E5 0B         [24]  637 	jb	acc.5,00104$
      00032F EE               [12]  638 	mov	a,r6
      000330 4F               [12]  639 	orl	a,r7
      000331 60 07            [24]  640 	jz	00104$
                                    641 ;	src/bsp/ms51_bsp.c:163: timeout--;
      000333 1E               [12]  642 	dec	r6
      000334 BE FF 01         [24]  643 	cjne	r6,#0xff,00136$
      000337 1F               [12]  644 	dec	r7
      000338                        645 00136$:
      000338 80 F0            [24]  646 	sjmp	00102$
      00033A                        647 00104$:
                                    648 ;	src/bsp/ms51_bsp.c:165: if (timeout == 0U) {
      00033A EE               [12]  649 	mov	a,r6
      00033B 4F               [12]  650 	orl	a,r7
      00033C 70 07            [24]  651 	jnz	00106$
                                    652 ;	src/bsp/ms51_bsp.c:166: bsp_hardware_failure();
      00033E 12 03 98         [24]  653 	lcall	_bsp_hardware_failure
                                    654 ;	src/bsp/ms51_bsp.c:167: return 0U;
      000341 90 00 00         [24]  655 	mov	dptr,#0x0000
      000344 22               [24]  656 	ret
      000345                        657 00106$:
                                    658 ;	src/bsp/ms51_bsp.c:170: value = (uint16_t)(((uint16_t)ADCDH << 4) | ((uint16_t)ADCDL & 0x0FU));
      000345 AE ED            [24]  659 	mov	r6,_ADCDH
      000347 E4               [12]  660 	clr	a
      000348 CE               [12]  661 	xch	a,r6
      000349 C4               [12]  662 	swap	a
      00034A CE               [12]  663 	xch	a,r6
      00034B 6E               [12]  664 	xrl	a,r6
      00034C CE               [12]  665 	xch	a,r6
      00034D 54 F0            [12]  666 	anl	a,#0xf0
      00034F CE               [12]  667 	xch	a,r6
      000350 6E               [12]  668 	xrl	a,r6
      000351 FF               [12]  669 	mov	r7,a
      000352 AC EC            [24]  670 	mov	r4,_ADCDL
      000354 53 04 0F         [24]  671 	anl	ar4,#0x0f
      000357 7D 00            [12]  672 	mov	r5,#0x00
      000359 EE               [12]  673 	mov	a,r6
      00035A 42 04            [12]  674 	orl	ar4,a
      00035C EF               [12]  675 	mov	a,r7
      00035D 42 05            [12]  676 	orl	ar5,a
      00035F 8C 82            [24]  677 	mov	dpl,r4
      000361 8D 83            [24]  678 	mov	dph,r5
                                    679 ;	src/bsp/ms51_bsp.c:171: return value;
                                    680 ;	src/bsp/ms51_bsp.c:172: }
      000363 22               [24]  681 	ret
                                    682 ;------------------------------------------------------------
                                    683 ;Allocation info for local variables in function 'bsp_led_ch1_sense'
                                    684 ;------------------------------------------------------------
                                    685 ;on            Allocated to registers 
                                    686 ;------------------------------------------------------------
                                    687 ;	src/bsp/ms51_bsp.c:174: void bsp_led_ch1_sense(uint8_t on) { gpio_write(NAMUR_LED_CH1_SENSE_PORT, NAMUR_LED_CH1_SENSE_BIT, on); }
                                    688 ;	-----------------------------------------
                                    689 ;	 function bsp_led_ch1_sense
                                    690 ;	-----------------------------------------
      000364                        691 _bsp_led_ch1_sense:
      000364 85 82 15         [24]  692 	mov	_gpio_write_PARM_3,dpl
      000367 75 14 00         [24]  693 	mov	_gpio_write_PARM_2,#0x00
      00036A 75 82 02         [24]  694 	mov	dpl, #0x02
      00036D 02 01 8B         [24]  695 	ljmp	_gpio_write
                                    696 ;------------------------------------------------------------
                                    697 ;Allocation info for local variables in function 'bsp_led_ch2_sense'
                                    698 ;------------------------------------------------------------
                                    699 ;on            Allocated to registers 
                                    700 ;------------------------------------------------------------
                                    701 ;	src/bsp/ms51_bsp.c:175: void bsp_led_ch2_sense(uint8_t on) { gpio_write(NAMUR_LED_CH2_SENSE_PORT, NAMUR_LED_CH2_SENSE_BIT, on); }
                                    702 ;	-----------------------------------------
                                    703 ;	 function bsp_led_ch2_sense
                                    704 ;	-----------------------------------------
      000370                        705 _bsp_led_ch2_sense:
      000370 85 82 15         [24]  706 	mov	_gpio_write_PARM_3,dpl
      000373 75 14 01         [24]  707 	mov	_gpio_write_PARM_2,#0x01
      000376 75 82 02         [24]  708 	mov	dpl, #0x02
      000379 02 01 8B         [24]  709 	ljmp	_gpio_write
                                    710 ;------------------------------------------------------------
                                    711 ;Allocation info for local variables in function 'bsp_led_ch1_fault'
                                    712 ;------------------------------------------------------------
                                    713 ;on            Allocated to registers 
                                    714 ;------------------------------------------------------------
                                    715 ;	src/bsp/ms51_bsp.c:176: void bsp_led_ch1_fault(uint8_t on) { gpio_write(NAMUR_LED_CH1_FAULT_PORT, NAMUR_LED_CH1_FAULT_BIT, on); }
                                    716 ;	-----------------------------------------
                                    717 ;	 function bsp_led_ch1_fault
                                    718 ;	-----------------------------------------
      00037C                        719 _bsp_led_ch1_fault:
      00037C 85 82 15         [24]  720 	mov	_gpio_write_PARM_3,dpl
      00037F 75 14 02         [24]  721 	mov	_gpio_write_PARM_2,#0x02
      000382 75 82 02         [24]  722 	mov	dpl, #0x02
      000385 02 01 8B         [24]  723 	ljmp	_gpio_write
                                    724 ;------------------------------------------------------------
                                    725 ;Allocation info for local variables in function 'bsp_led_ch2_fault'
                                    726 ;------------------------------------------------------------
                                    727 ;on            Allocated to registers 
                                    728 ;------------------------------------------------------------
                                    729 ;	src/bsp/ms51_bsp.c:177: void bsp_led_ch2_fault(uint8_t on) { gpio_write(NAMUR_LED_CH2_FAULT_PORT, NAMUR_LED_CH2_FAULT_BIT, on); }
                                    730 ;	-----------------------------------------
                                    731 ;	 function bsp_led_ch2_fault
                                    732 ;	-----------------------------------------
      000388                        733 _bsp_led_ch2_fault:
      000388 85 82 15         [24]  734 	mov	_gpio_write_PARM_3,dpl
      00038B 75 14 03         [24]  735 	mov	_gpio_write_PARM_2,#0x03
      00038E 75 82 02         [24]  736 	mov	dpl, #0x02
      000391 02 01 8B         [24]  737 	ljmp	_gpio_write
                                    738 ;------------------------------------------------------------
                                    739 ;Allocation info for local variables in function 'bsp_clear_wdt'
                                    740 ;------------------------------------------------------------
                                    741 ;	src/bsp/ms51_bsp.c:179: void bsp_clear_wdt(void)
                                    742 ;	-----------------------------------------
                                    743 ;	 function bsp_clear_wdt
                                    744 ;	-----------------------------------------
      000394                        745 _bsp_clear_wdt:
                                    746 ;	src/bsp/ms51_bsp.c:181: WDCON |= WDCON_WDCLR;
      000394 43 AA 80         [24]  747 	orl	_WDCON,#0x80
                                    748 ;	src/bsp/ms51_bsp.c:182: }
      000397 22               [24]  749 	ret
                                    750 ;------------------------------------------------------------
                                    751 ;Allocation info for local variables in function 'bsp_hardware_failure'
                                    752 ;------------------------------------------------------------
                                    753 ;	src/bsp/ms51_bsp.c:184: void bsp_hardware_failure(void)
                                    754 ;	-----------------------------------------
                                    755 ;	 function bsp_hardware_failure
                                    756 ;	-----------------------------------------
      000398                        757 _bsp_hardware_failure:
                                    758 ;	src/bsp/ms51_bsp.c:186: bsp_led_ch1_sense(0U);
      000398 75 82 00         [24]  759 	mov	dpl, #0x00
      00039B 12 03 64         [24]  760 	lcall	_bsp_led_ch1_sense
                                    761 ;	src/bsp/ms51_bsp.c:187: bsp_led_ch2_sense(0U);
      00039E 75 82 00         [24]  762 	mov	dpl, #0x00
      0003A1 12 03 70         [24]  763 	lcall	_bsp_led_ch2_sense
                                    764 ;	src/bsp/ms51_bsp.c:188: bsp_led_ch1_fault(0U);
      0003A4 75 82 00         [24]  765 	mov	dpl, #0x00
      0003A7 12 03 7C         [24]  766 	lcall	_bsp_led_ch1_fault
                                    767 ;	src/bsp/ms51_bsp.c:189: bsp_led_ch2_fault(0U);
      0003AA 75 82 00         [24]  768 	mov	dpl, #0x00
      0003AD 12 03 88         [24]  769 	lcall	_bsp_led_ch2_fault
                                    770 ;	src/bsp/ms51_bsp.c:190: while (1) {
      0003B0                        771 00102$:
                                    772 ;	src/bsp/ms51_bsp.c:193: }
      0003B0 80 FE            [24]  773 	sjmp	00102$
                                    774 	.area CSEG    (CODE)
                                    775 	.area CONST   (CODE)
                                    776 	.area XINIT   (CODE)
                                    777 	.area CABS    (ABS,CODE)
