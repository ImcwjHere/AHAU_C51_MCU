;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module startupScreen
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putStringOnLCD1602
	.globl _writeCharOnLCD1602
	.globl _delayOneSecond
	.globl _delayOneMillisecond
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
	.globl _startupScreen
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
_startupScreen_line_1_65536_10:
	.ds 17
_startupScreen_line_2_65536_10:
	.ds 17
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
;Allocation info for local variables in function 'startupScreen'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;j                         Allocated to registers r6 
;delay_ms                  Allocated to registers 
;line_1                    Allocated with name '_startupScreen_line_1_65536_10'
;line_2                    Allocated with name '_startupScreen_line_2_65536_10'
;------------------------------------------------------------
;	.\src\screens\startupScreen.c:4: void startupScreen() {
;	-----------------------------------------
;	 function startupScreen
;	-----------------------------------------
_startupScreen:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\src\screens\startupScreen.c:7: xdata unsigned char line_1[] = "Welcome to AAUCS";
	mov	dptr,#_startupScreen_line_1_65536_10
	mov	a,#0x57
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0001)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0002)
	mov	a,#0x6c
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0003)
	mov	a,#0x63
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0004)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0005)
	mov	a,#0x6d
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0006)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0007)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0008)
	mov	a,#0x74
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0009)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000a)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000b)
	mov	a,#0x41
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000c)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000d)
	mov	a,#0x55
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000e)
	mov	a,#0x43
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000f)
	mov	a,#0x53
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x0010)
	clr	a
	movx	@dptr,a
;	.\src\screens\startupScreen.c:8: xdata unsigned char line_2[] = "     No. 31     ";
	mov	dptr,#_startupScreen_line_2_65536_10
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0001)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0002)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0003)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0004)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0005)
	mov	a,#0x4e
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0006)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0007)
	mov	a,#0x2e
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0008)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0009)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000a)
	mov	a,#0x31
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000b)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000c)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000d)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000e)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000f)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x0010)
	clr	a
	movx	@dptr,a
;	.\src\screens\startupScreen.c:10: for (i = 0; i < 16; i++) {
	mov	r7,#0x00
00106$:
;	.\src\screens\startupScreen.c:11: writeCharOnLCD1602(0, i, line_1[i]);
	mov	a,r7
	add	a,#_startupScreen_line_1_65536_10
	mov	dpl,a
	clr	a
	addc	a,#(_startupScreen_line_1_65536_10 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_writeCharOnLCD1602_PARM_3,a
	mov	_writeCharOnLCD1602_PARM_2,r7
	mov	dpl,#0x00
	push	ar7
	lcall	_writeCharOnLCD1602
	pop	ar7
;	.\src\screens\startupScreen.c:12: if (i < 7) writeCharOnLCD1602(1, i+5, line_2[i+5]);
	cjne	r7,#0x07,00141$
00141$:
	jnc	00102$
	mov	ar6,r7
	mov	a,#0x05
	add	a,r6
	mov	r6,a
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	a,r4
	add	a,#_startupScreen_line_2_65536_10
	mov	dpl,a
	mov	a,r5
	addc	a,#(_startupScreen_line_2_65536_10 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_writeCharOnLCD1602_PARM_3,a
	mov	_writeCharOnLCD1602_PARM_2,r6
	mov	dpl,#0x01
	push	ar7
	lcall	_writeCharOnLCD1602
	pop	ar7
00102$:
;	.\src\screens\startupScreen.c:13: delayOneMillisecond(delay_ms);
	mov	dptr,#0x0032
	push	ar7
	lcall	_delayOneMillisecond
	pop	ar7
;	.\src\screens\startupScreen.c:10: for (i = 0; i < 16; i++) {
	inc	r7
	cjne	r7,#0x10,00143$
00143$:
	jc	00106$
;	.\src\screens\startupScreen.c:15: delayOneSecond(1);
	mov	dptr,#0x0001
	lcall	_delayOneSecond
;	.\src\screens\startupScreen.c:17: for (i = 0; i < 16; i++) {
	mov	r7,#0x00
;	.\src\screens\startupScreen.c:19: for (j = 0; j < 16; j++) {
00117$:
	mov	r6,#0x00
00108$:
;	.\src\screens\startupScreen.c:20: line_1[j] = line_1[j+1];
	mov	a,r6
	add	a,#_startupScreen_line_1_65536_10
	mov	r4,a
	clr	a
	addc	a,#(_startupScreen_line_1_65536_10 >> 8)
	mov	r5,a
	mov	ar3,r6
	inc	r3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a,#_startupScreen_line_1_65536_10
	mov	dpl,a
	mov	a,r2
	addc	a,#(_startupScreen_line_1_65536_10 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
;	.\src\screens\startupScreen.c:21: line_2[j] = line_2[j+1];
	mov	a,r6
	add	a,#_startupScreen_line_2_65536_10
	mov	r4,a
	clr	a
	addc	a,#(_startupScreen_line_2_65536_10 >> 8)
	mov	r5,a
	mov	a,r3
	add	a,#_startupScreen_line_2_65536_10
	mov	dpl,a
	mov	a,r2
	addc	a,#(_startupScreen_line_2_65536_10 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
;	.\src\screens\startupScreen.c:19: for (j = 0; j < 16; j++) {
	inc	r6
	cjne	r6,#0x10,00145$
00145$:
	jc	00108$
;	.\src\screens\startupScreen.c:23: line_1[15] = ' ';
	mov	dptr,#(_startupScreen_line_1_65536_10 + 0x000f)
	mov	a,#0x20
	movx	@dptr,a
;	.\src\screens\startupScreen.c:24: line_2[15] = ' ';
	mov	dptr,#(_startupScreen_line_2_65536_10 + 0x000f)
	movx	@dptr,a
;	.\src\screens\startupScreen.c:26: putStringOnLCD1602(0, 0, line_1);
	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_1_65536_10
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_1_65536_10 >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	push	ar7
	lcall	_putStringOnLCD1602
;	.\src\screens\startupScreen.c:27: putStringOnLCD1602(1, 0, line_2);
	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_2_65536_10
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_2_65536_10 >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x01
	lcall	_putStringOnLCD1602
;	.\src\screens\startupScreen.c:28: delayOneMillisecond(delay_ms/2);
	mov	dptr,#0x0019
	lcall	_delayOneMillisecond
	pop	ar7
;	.\src\screens\startupScreen.c:17: for (i = 0; i < 16; i++) {
	inc	r7
	cjne	r7,#0x10,00147$
00147$:
	jnc	00148$
	ljmp	00117$
00148$:
;	.\src\screens\startupScreen.c:30: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
