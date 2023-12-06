;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module BEEP
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BEEPER
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
	.globl _Music
	.globl _FreqTable
	.globl _MusicSelect
	.globl _FreqSelect
	.globl _initializeBeeper
	.globl _doBeep
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
_FreqSelect::
	.ds 1
_MusicSelect::
	.ds 1
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
_FreqTable::
	.ds 74
_Music::
	.ds 139
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
;	.\src\utils\BEEP.c:137: unsigned char FreqSelect=0, MusicSelect=0;
	mov	_FreqSelect,#0x00
;	.\src\utils\BEEP.c:137: 
	mov	_MusicSelect,#0x00
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
;Allocation info for local variables in function 'initializeBeeper'
;------------------------------------------------------------
;	.\src\utils\BEEP.c:140: void initializeBeeper() {
;	-----------------------------------------
;	 function initializeBeeper
;	-----------------------------------------
_initializeBeeper:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\src\utils\BEEP.c:142: BEEP = 1;
;	assignBit
	setb	_P14
;	.\src\utils\BEEP.c:144: TMOD &= 0x0F;   // 清除定时器1模式位
	anl	_TMOD,#0x0f
;	.\src\utils\BEEP.c:145: TMOD |= 0x10;   // 设置定时器模式
	orl	_TMOD,#0x10
;	.\src\utils\BEEP.c:146: TL1 = 0x00;  // 设置定时初值
	mov	_TL1,#0x00
;	.\src\utils\BEEP.c:147: TH1 = 0x00;  // 设置定时初值
	mov	_TH1,#0x00
;	.\src\utils\BEEP.c:148: TF1 = 0;    // 清除TF1标志
;	assignBit
	clr	_TF1
;	.\src\utils\BEEP.c:149: TR1 = 1;    // 定时器1开始计时
;	assignBit
	setb	_TR1
;	.\src\utils\BEEP.c:150: ET1 = 1;    // 使能定时器1中断
;	assignBit
	setb	_ET1
;	.\src\utils\BEEP.c:151: EA = 1; // 开启总中断
;	assignBit
	setb	_EA
;	.\src\utils\BEEP.c:152: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'BEEPER'
;------------------------------------------------------------
;	.\src\utils\BEEP.c:154: void BEEPER () interrupt 3 {
;	-----------------------------------------
;	 function BEEPER
;	-----------------------------------------
_BEEPER:
	push	acc
	push	b
	push	dpl
	push	dph
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	psw
	mov	psw,#0x00
;	.\src\utils\BEEP.c:155: if(FreqTable[FreqSelect]) { //如果不是休止符
	mov	a,_FreqSelect
	mov	b,#0x02
	mul	ab
	add	a,#_FreqTable
	mov	dpl,a
	mov	a,#(_FreqTable >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jz	00103$
;	.\src\utils\BEEP.c:157: TL1 = FreqTable[FreqSelect]%256;		//设置定时初值
	mov	ar4,r6
	mov	r5,#0x00
	mov	_TL1,r4
;	.\src\utils\BEEP.c:158: TH1 = FreqTable[FreqSelect]/256;		//设置定时初值
	mov	ar6,r7
	mov	r7,#0x00
	mov	_TH1,r6
;	.\src\utils\BEEP.c:159: BEEP=!BEEP;	//翻转蜂鸣器IO口
	cpl	_P14
00103$:
;	.\src\utils\BEEP.c:161: }
	pop	psw
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'doBeep'
;------------------------------------------------------------
;	.\src\utils\BEEP.c:163: void doBeep() {
;	-----------------------------------------
;	 function doBeep
;	-----------------------------------------
_doBeep:
;	.\src\utils\BEEP.c:164: while(1) {
00105$:
;	.\src\utils\BEEP.c:165: if(Music[MusicSelect]!=0xFF) {  // 如果不是停止标志位
	mov	a,_MusicSelect
	add	a,#_Music
	mov	dpl,a
	clr	a
	addc	a,#(_Music >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,00117$
	sjmp	00102$
00117$:
;	.\src\utils\BEEP.c:166: FreqSelect=Music[MusicSelect];  // 选择音符对应的频率
	mov	_FreqSelect,r7
;	.\src\utils\BEEP.c:167: MusicSelect++;
	inc	_MusicSelect
;	.\src\utils\BEEP.c:168: delayOneMillisecond(SPEED/4*Music[MusicSelect]);  // 选择音符对应的时值
	mov	a,_MusicSelect
	add	a,#_Music
	mov	dpl,a
	clr	a
	addc	a,#(_Music >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	b,#0x7d
	mul	ab
	mov	dpl,a
	mov	dph,b
	lcall	_delayOneMillisecond
;	.\src\utils\BEEP.c:169: MusicSelect++;
	inc	_MusicSelect
;	.\src\utils\BEEP.c:170: TR1 = 0;
;	assignBit
	clr	_TR1
;	.\src\utils\BEEP.c:171: delayOneMillisecond(5);	// 音符间短暂停顿
	mov	dptr,#0x0005
	lcall	_delayOneMillisecond
;	.\src\utils\BEEP.c:172: TR1 = 1;
;	assignBit
	setb	_TR1
	sjmp	00105$
00102$:
;	.\src\utils\BEEP.c:175: TR1 = 0;
;	assignBit
	clr	_TR1
;	.\src\utils\BEEP.c:176: BEEP = 1;
;	assignBit
	setb	_P14
;	.\src\utils\BEEP.c:177: break;
;	.\src\utils\BEEP.c:180: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__FreqTable:
	.byte #0x00, #0x00	; 0
	.byte #0x8c, #0xf8	; 63628
	.byte #0xf3, #0xf8	; 63731
	.byte #0x5b, #0xf9	; 63835
	.byte #0xb8, #0xf9	; 63928
	.byte #0x15, #0xfa	; 64021
	.byte #0x67, #0xfa	; 64103
	.byte #0xb9, #0xfa	; 64185
	.byte #0x04, #0xfb	; 64260
	.byte #0x4b, #0xfb	; 64331
	.byte #0x90, #0xfb	; 64400
	.byte #0xcf, #0xfb	; 64463
	.byte #0x10, #0xfc	; 64528
	.byte #0x44, #0xfc	; 64580
	.byte #0x79, #0xfc	; 64633
	.byte #0xac, #0xfc	; 64684
	.byte #0xdc, #0xfc	; 64732
	.byte #0x09, #0xfd	; 64777
	.byte #0x34, #0xfd	; 64820
	.byte #0x5c, #0xfd	; 64860
	.byte #0x82, #0xfd	; 64898
	.byte #0xa6, #0xfd	; 64934
	.byte #0xc8, #0xfd	; 64968
	.byte #0xe8, #0xfd	; 65000
	.byte #0x06, #0xfe	; 65030
	.byte #0x22, #0xfe	; 65058
	.byte #0x3d, #0xfe	; 65085
	.byte #0x56, #0xfe	; 65110
	.byte #0x6e, #0xfe	; 65134
	.byte #0x85, #0xfe	; 65157
	.byte #0x9a, #0xfe	; 65178
	.byte #0xae, #0xfe	; 65198
	.byte #0xc1, #0xfe	; 65217
	.byte #0xd3, #0xfe	; 65235
	.byte #0xe4, #0xfe	; 65252
	.byte #0xf4, #0xfe	; 65268
	.byte #0x03, #0xff	; 65283
__xinit__Music:
	.db #0x19	; 25
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x04	; 4
	.db #0x1d	; 29
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0xff	; 255
	.area CABS    (ABS,CODE)
