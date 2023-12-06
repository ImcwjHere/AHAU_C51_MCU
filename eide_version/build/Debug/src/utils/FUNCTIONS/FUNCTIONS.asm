;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module FUNCTIONS
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _initializeEverything
	.globl _floatToText
	.globl _prepareReadTemperature
	.globl _initializeDS18B20
	.globl _initializeLCD1602
	.globl _initializeFan
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _TF2
	.globl _T2
	.globl _T2EX
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _RXD
	.globl _TXD
	.globl _INT0
	.globl _INT1
	.globl _T0
	.globl _T1
	.globl _WR
	.globl _RD
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _EA
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _P37
	.globl _P36
	.globl _P35
	.globl _P34
	.globl _P33
	.globl _P32
	.globl _P31
	.globl _P30
	.globl _P27
	.globl _P26
	.globl _P25
	.globl _P24
	.globl _P23
	.globl _P22
	.globl _P21
	.globl _P20
	.globl _P17
	.globl _P16
	.globl _P15
	.globl _P14
	.globl _P13
	.globl _P12
	.globl _P11
	.globl _P10
	.globl _P07
	.globl _P06
	.globl _P05
	.globl _P04
	.globl _P03
	.globl _P02
	.globl _P01
	.globl _P00
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _IP
	.globl _IE
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
	.globl _floatToText_PARM_2
	.globl _prepareReadTemperature_PARM_3
	.globl _prepareReadTemperature_PARM_2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_P1	=	0x0090
_P2	=	0x00a0
_P3	=	0x00b0
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_IE	=	0x00a8
_IP	=	0x00b8
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P00	=	0x0080
_P01	=	0x0081
_P02	=	0x0082
_P03	=	0x0083
_P04	=	0x0084
_P05	=	0x0085
_P06	=	0x0086
_P07	=	0x0087
_P10	=	0x0090
_P11	=	0x0091
_P12	=	0x0092
_P13	=	0x0093
_P14	=	0x0094
_P15	=	0x0095
_P16	=	0x0096
_P17	=	0x0097
_P20	=	0x00a0
_P21	=	0x00a1
_P22	=	0x00a2
_P23	=	0x00a3
_P24	=	0x00a4
_P25	=	0x00a5
_P26	=	0x00a6
_P27	=	0x00a7
_P30	=	0x00b0
_P31	=	0x00b1
_P32	=	0x00b2
_P33	=	0x00b3
_P34	=	0x00b4
_P35	=	0x00b5
_P36	=	0x00b6
_P37	=	0x00b7
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_P	=	0x00d0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_EA	=	0x00af
_ET2	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PT2	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_RD	=	0x00b7
_WR	=	0x00b6
_T1	=	0x00b5
_T0	=	0x00b4
_INT1	=	0x00b3
_INT0	=	0x00b2
_TXD	=	0x00b1
_RXD	=	0x00b0
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_T2EX	=	0x0091
_T2	=	0x0090
_TF2	=	0x00cf
_EXF2	=	0x00ce
_RCLK	=	0x00cd
_TCLK	=	0x00cc
_EXEN2	=	0x00cb
_TR2	=	0x00ca
_C_T2	=	0x00c9
_CP_RL2	=	0x00c8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_prepareReadTemperature_PARM_2:
	.ds 3
_prepareReadTemperature_PARM_3:
	.ds 3
_prepareReadTemperature_sloc0_1_0:
	.ds 3
_prepareReadTemperature_sloc1_1_0:
	.ds 3
_floatToText_PARM_2:
	.ds 3
_floatToText_num_65536_6:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
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
;Allocation info for local variables in function 'prepareReadTemperature'
;------------------------------------------------------------
;buf                       Allocated with name '_prepareReadTemperature_PARM_2'
;globalVariable            Allocated with name '_prepareReadTemperature_PARM_3'
;temperature               Allocated to registers r6 
;sloc0                     Allocated with name '_prepareReadTemperature_sloc0_1_0'
;sloc1                     Allocated with name '_prepareReadTemperature_sloc1_1_0'
;------------------------------------------------------------
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:15: void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable) {
;	-----------------------------------------
;	 function prepareReadTemperature
;	-----------------------------------------
_prepareReadTemperature:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:17: if (temperature >= 129) {
	cjne	r7,#0x81,00132$
00132$:
	jnc	00133$
	ljmp	00102$
00133$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:19: temperature = 255 - temperature + 1;
	mov	ar6,r7
	clr	c
	clr	a
	subb	a,r6
	mov	r6,a
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:20: buf[0] = '-';    // 负号
	mov	r3,_prepareReadTemperature_PARM_2
	mov	r4,(_prepareReadTemperature_PARM_2 + 1)
	mov	r5,(_prepareReadTemperature_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,#0x2d
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:21: buf[1] = (unsigned char)(temperature % 100 / 10 + '0');
	mov	a,#0x01
	add	a,r3
	mov	_prepareReadTemperature_sloc0_1_0,a
	clr	a
	addc	a,r4
	mov	(_prepareReadTemperature_sloc0_1_0 + 1),a
	mov	(_prepareReadTemperature_sloc0_1_0 + 2),r5
	mov	ar2,r6
	mov	r6,#0x00
	mov	__modsint_PARM_2,#0x64
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	mov	dpl,r2
	mov	dph,r6
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	__modsint
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	lcall	__divsint
	mov	r0,dpl
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	mov	a,#0x30
	add	a,r0
	mov	r0,a
	mov	dpl,_prepareReadTemperature_sloc0_1_0
	mov	dph,(_prepareReadTemperature_sloc0_1_0 + 1)
	mov	b,(_prepareReadTemperature_sloc0_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:22: buf[2] = (unsigned char)(temperature % 10 + '0');
	mov	a,#0x02
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r2
	mov	dph,r6
	push	ar5
	push	ar4
	push	ar3
	push	ar0
	lcall	__modsint
	mov	r2,dpl
	pop	ar0
	pop	ar3
	pop	ar4
	pop	ar5
	mov	a,#0x30
	add	a,r2
	mov	r2,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:24: *globalVariable = (int)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0')));
	mov	r4,_prepareReadTemperature_PARM_3
	mov	r5,(_prepareReadTemperature_PARM_3 + 1)
	mov	r6,(_prepareReadTemperature_PARM_3 + 2)
	mov	r3,#0x00
	mov	a,r0
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r3
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000a
	push	ar6
	push	ar5
	push	ar4
	push	ar2
	lcall	__mulint
	mov	r1,dpl
	mov	r3,dph
	pop	ar2
	pop	ar4
	pop	ar5
	pop	ar6
	mov	ar0,r2
	mov	r2,#0x00
	mov	a,r0
	add	a,#0xd0
	mov	r0,a
	mov	a,r2
	addc	a,#0xff
	mov	r2,a
	mov	a,r0
	add	a,r1
	mov	r1,a
	mov	a,r2
	addc	a,r3
	mov	r3,a
	clr	c
	clr	a
	subb	a,r1
	mov	r1,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r1
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	ljmp	00103$
00102$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:28: buf[0] = (unsigned char)(temperature / 100 + '0');
	mov	r4,_prepareReadTemperature_PARM_2
	mov	r5,(_prepareReadTemperature_PARM_2 + 1)
	mov	r6,(_prepareReadTemperature_PARM_2 + 2)
	mov	r3,#0x00
	mov	__divsint_PARM_2,#0x64
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r3
	mov	dpl,r7
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	__divsint
	mov	r1,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r1
	mov	r1,a
	mov	_prepareReadTemperature_sloc0_1_0,r1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,_prepareReadTemperature_sloc0_1_0
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:29: buf[1] = (unsigned char)(temperature % 100 / 10 + '0');   
	mov	a,#0x01
	add	a,r4
	mov	_prepareReadTemperature_sloc1_1_0,a
	clr	a
	addc	a,r5
	mov	(_prepareReadTemperature_sloc1_1_0 + 1),a
	mov	(_prepareReadTemperature_sloc1_1_0 + 2),r6
	mov	__modsint_PARM_2,#0x64
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r7
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	__modsint
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	lcall	__divsint
	mov	r1,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r1
	mov	r1,a
	mov	dpl,_prepareReadTemperature_sloc1_1_0
	mov	dph,(_prepareReadTemperature_sloc1_1_0 + 1)
	mov	b,(_prepareReadTemperature_sloc1_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:30: buf[2] = (unsigned char)(temperature % 10 + '0'); 
	mov	a,#0x02
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r7
	mov	dph,r3
	push	ar6
	push	ar5
	push	ar4
	push	ar1
	lcall	__modsint
	mov	r3,dpl
	pop	ar1
	pop	ar4
	pop	ar5
	pop	ar6
	mov	a,#0x30
	add	a,r3
	mov	r3,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:32: *globalVariable = (int)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0'));
	mov	r5,_prepareReadTemperature_PARM_3
	mov	r6,(_prepareReadTemperature_PARM_3 + 1)
	mov	r7,(_prepareReadTemperature_PARM_3 + 2)
	mov	r2,_prepareReadTemperature_sloc0_1_0
	mov	r4,#0x00
	mov	a,r2
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r4
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x0064
	push	ar7
	push	ar6
	push	ar5
	push	ar3
	push	ar1
	lcall	__mulint
	mov	r2,dpl
	mov	r4,dph
	pop	ar1
	pop	ar3
	mov	ar0,r1
	mov	r1,#0x00
	mov	a,r0
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r1
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000a
	push	ar4
	push	ar3
	push	ar2
	lcall	__mulint
	mov	r0,dpl
	mov	r1,dph
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,r0
	add	a,r2
	mov	r2,a
	mov	a,r1
	addc	a,r4
	mov	r4,a
	mov	ar1,r3
	mov	r3,#0x00
	mov	a,r1
	add	a,#0xd0
	mov	r1,a
	mov	a,r3
	addc	a,#0xff
	mov	r3,a
	mov	a,r1
	add	a,r2
	mov	r2,a
	mov	a,r3
	addc	a,r4
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
00103$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:35: if (buf[0] == '0') buf[0] = ' ';
	mov	r5,_prepareReadTemperature_PARM_2
	mov	r6,(_prepareReadTemperature_PARM_2 + 1)
	mov	r7,(_prepareReadTemperature_PARM_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x30,00105$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x20
	lcall	__gptrput
00105$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:37: if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x30,00110$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x20,00138$
	sjmp	00106$
00138$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x2d,00110$
00106$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:38: buf[1] = buf[0];
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:39: buf[0] = ' ';
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x20
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:41: }
	ljmp	__gptrput
00110$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'floatToText'
;------------------------------------------------------------
;buf                       Allocated with name '_floatToText_PARM_2'
;num                       Allocated with name '_floatToText_num_65536_6'
;------------------------------------------------------------
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:44: void floatToText(int num, unsigned char *buf) {
;	-----------------------------------------
;	 function floatToText
;	-----------------------------------------
_floatToText:
	mov	_floatToText_num_65536_6,dpl
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:46: if (num < 0) {
	mov	a,dph
	mov	(_floatToText_num_65536_6 + 1),a
	jb	acc.7,00128$
	ljmp	00102$
00128$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:47: buf[0] = '-';
	mov	r3,_floatToText_PARM_2
	mov	r4,(_floatToText_PARM_2 + 1)
	mov	r5,(_floatToText_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,#0x2d
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:48: buf[1] = (unsigned char)(-1 * (int)(num / 10) + '0');
	mov	a,#0x01
	add	a,r3
	mov	r0,a
	clr	a
	addc	a,r4
	mov	r1,a
	mov	ar2,r5
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	mov	dpl,_floatToText_num_65536_6
	mov	dph,(_floatToText_num_65536_6 + 1)
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	__divsint
	mov	r6,dpl
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	clr	c
	clr	a
	subb	a,r6
	add	a,#0x30
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:49: buf[2] = (unsigned char)(-1 * (int)(num % 10) + '0');
	mov	a,#0x02
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,_floatToText_num_65536_6
	mov	dph,(_floatToText_num_65536_6 + 1)
	push	ar4
	push	ar3
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	pop	ar3
	pop	ar4
	pop	ar5
	clr	c
	clr	a
	subb	a,r6
	add	a,#0x30
	mov	r6,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrput
	ljmp	00103$
00102$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:51: buf[0] = (unsigned char)(num / 100 + '0');
	mov	r5,_floatToText_PARM_2
	mov	r6,(_floatToText_PARM_2 + 1)
	mov	r7,(_floatToText_PARM_2 + 2)
	mov	__divsint_PARM_2,#0x64
	mov	(__divsint_PARM_2 + 1),#0x00
	mov	dpl,_floatToText_num_65536_6
	mov	dph,(_floatToText_num_65536_6 + 1)
	push	ar7
	push	ar6
	push	ar5
	lcall	__divsint
	mov	r3,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r3
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:52: buf[1] = (unsigned char)(num % 100 / 10 + '0');
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	__modsint_PARM_2,#0x64
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,_floatToText_num_65536_6
	mov	dph,(_floatToText_num_65536_6 + 1)
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	__modsint
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	lcall	__divsint
	mov	r0,dpl
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	mov	a,#0x30
	add	a,r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:53: buf[2] = (unsigned char)(num % 10 + '0');
	mov	a,#0x02
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,_floatToText_num_65536_6
	mov	dph,(_floatToText_num_65536_6 + 1)
	push	ar6
	push	ar5
	lcall	__modsint
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r3
	mov	r3,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
00103$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:56: if (buf[0] == '0') buf[0] = ' ';
	mov	r5,_floatToText_PARM_2
	mov	r6,(_floatToText_PARM_2 + 1)
	mov	r7,(_floatToText_PARM_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x30,00105$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x20
	lcall	__gptrput
00105$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:58: if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x30,00110$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x20,00133$
	sjmp	00106$
00133$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	cjne	r1,#0x2d,00110$
00106$:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:59: buf[1] = buf[0];
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:60: buf[0] = ' ';
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x20
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:62: }
	ljmp	__gptrput
00110$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializeEverything'
;------------------------------------------------------------
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:64: void initializeEverything() {
;	-----------------------------------------
;	 function initializeEverything
;	-----------------------------------------
_initializeEverything:
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:66: BEEP=1;
;	assignBit
	setb	_P14
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:67: FAN=0;
;	assignBit
	clr	_P27
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:68: LED=1;
;	assignBit
	setb	_P20
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:70: initializeFan();    // 初始化风扇
	lcall	_initializeFan
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:71: initializeLCD1602();    // 初始化LCD1602
	lcall	_initializeLCD1602
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:72: initializeDS18B20();    // 初始化DS18B20，返回1表示初始化成功，返回0表示初始化失败，这里不做处理
;	.\src\utils\FUNCTIONS\FUNCTIONS.c:73: }
	ljmp	_initializeDS18B20
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
