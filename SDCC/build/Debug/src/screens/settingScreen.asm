;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module settingScreen
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _alartScreen
	.globl _floatToText
	.globl _writeAT24C02
	.globl _putStringOnLCD1602
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
	.globl _settingScreen
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
_settingScreen_blankspaceText_65536_20:
	.ds 4
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
_settingScreen_currentCursor_65536_20:
	.ds 1
_settingScreen_prevCursor_65536_20:
	.ds 1
_settingScreen_splashState_65536_20:
	.ds 1
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
;Allocation info for local variables in function 'settingScreen'
;------------------------------------------------------------
;blankspaceText            Allocated with name '_settingScreen_blankspaceText_65536_20'
;------------------------------------------------------------
;	.\src\screens\settingScreen.c:3: void settingScreen() {
;	-----------------------------------------
;	 function settingScreen
;	-----------------------------------------
_settingScreen:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\src\screens\settingScreen.c:4: bit currentCursor=0, prevCursor=0;    // 当前/上一个光标位置，0表示控制最高温度，1表示控制最低温度
;	assignBit
	clr	_settingScreen_currentCursor_65536_20
;	assignBit
	clr	_settingScreen_prevCursor_65536_20
;	.\src\screens\settingScreen.c:5: bit splashState=0;  // 闪烁光标状态，0表示显示温度，1表示显示空格
;	assignBit
	clr	_settingScreen_splashState_65536_20
;	.\src\screens\settingScreen.c:6: unsigned char blankspaceText[] = "   ";    // 空格
	mov	_settingScreen_blankspaceText_65536_20,#0x20
	mov	(_settingScreen_blankspaceText_65536_20 + 0x0001),#0x20
	mov	(_settingScreen_blankspaceText_65536_20 + 0x0002),#0x20
	mov	(_settingScreen_blankspaceText_65536_20 + 0x0003),#0x00
;	.\src\screens\settingScreen.c:10: while (!SETTING_BUTTON);    // 等待按键释放
00101$:
	jnb	_P37,00101$
;	.\src\screens\settingScreen.c:11: alartScreen("Setting...");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\screens\settingScreen.c:15: while (APPLY_BUTTON) {
00142$:
	jb	_P34,00240$
	ljmp	00144$
00240$:
;	.\src\screens\settingScreen.c:18: if (currentCursor != prevCursor) {
	mov	c,_settingScreen_currentCursor_65536_20
	jb	_settingScreen_prevCursor_65536_20,00241$
	cpl	c
00241$:
	jc	00105$
;	.\src\screens\settingScreen.c:19: putStringOnLCD1602(0, 0, firstLine);
	mov	_putStringOnLCD1602_PARM_3,#_firstLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
;	.\src\screens\settingScreen.c:20: prevCursor = currentCursor;
;	assignBit
	mov	c,_settingScreen_currentCursor_65536_20
	mov	_settingScreen_prevCursor_65536_20,c
00105$:
;	.\src\screens\settingScreen.c:24: if (!SETTING_BUTTON) {
	jb	_P37,00110$
;	.\src\screens\settingScreen.c:25: while (!SETTING_BUTTON);    // 等待按键释放
00106$:
	jnb	_P37,00106$
;	.\src\screens\settingScreen.c:26: currentCursor = !currentCursor;
	cpl	_settingScreen_currentCursor_65536_20
00110$:
;	.\src\screens\settingScreen.c:30: if (!currentCursor) {   // 控制最高温度
	jnb	_settingScreen_currentCursor_65536_20,00245$
	ljmp	00140$
00245$:
;	.\src\screens\settingScreen.c:32: splashState = !splashState;
	cpl	_settingScreen_splashState_65536_20
;	.\src\screens\settingScreen.c:33: splashState?putStringOnLCD1602(0, 2, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
	jnb	_settingScreen_splashState_65536_20,00147$
	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65536_20
	mov	(_putStringOnLCD1602_PARM_3 + 1),#0x00
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x40
	mov	_putStringOnLCD1602_PARM_2,#0x02
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
	sjmp	00148$
00147$:
	mov	_putStringOnLCD1602_PARM_3,#_firstLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
00148$:
;	.\src\screens\settingScreen.c:34: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最高温度（不超过128摄氏度）
	jb	_P36,00117$
;	.\src\screens\settingScreen.c:35: while (!ADD_BUTTON);    // 等待按键释放
00111$:
	jnb	_P36,00111$
;	.\src\screens\settingScreen.c:36: highestTemperature ++;
	inc	_highestTemperature
	clr	a
	cjne	a,_highestTemperature,00249$
	inc	(_highestTemperature + 1)
00249$:
;	.\src\screens\settingScreen.c:37: if (highestTemperature > 128) highestTemperature = 128;
	clr	c
	mov	a,#0x80
	subb	a,_highestTemperature
	mov	a,#(0x00 ^ 0x80)
	mov	b,(_highestTemperature + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00115$
	mov	_highestTemperature,#0x80
	mov	(_highestTemperature + 1),#0x00
00115$:
;	.\src\screens\settingScreen.c:39: floatToText(highestTemperature, onScreenHighestTemperature);
	mov	_floatToText_PARM_2,_onScreenHighestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_highestTemperature
	mov	dph,(_highestTemperature + 1)
	lcall	_floatToText
00117$:
;	.\src\screens\settingScreen.c:41: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最高温度（不低于最低温度）
	jnb	_P35,00251$
	ljmp	00141$
00251$:
;	.\src\screens\settingScreen.c:42: while (!SUB_BUTTON);    // 等待按键释放
00118$:
	jnb	_P35,00118$
;	.\src\screens\settingScreen.c:43: highestTemperature --;
	dec	_highestTemperature
	mov	a,#0xff
	cjne	a,_highestTemperature,00253$
	dec	(_highestTemperature + 1)
00253$:
;	.\src\screens\settingScreen.c:44: if (highestTemperature < lowestTemperature) highestTemperature = lowestTemperature;
	clr	c
	mov	a,_highestTemperature
	subb	a,_lowestTemperature
	mov	a,(_highestTemperature + 1)
	xrl	a,#0x80
	mov	b,(_lowestTemperature + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00122$
	mov	_highestTemperature,_lowestTemperature
	mov	(_highestTemperature + 1),(_lowestTemperature + 1)
00122$:
;	.\src\screens\settingScreen.c:46: floatToText(highestTemperature, onScreenHighestTemperature);
	mov	_floatToText_PARM_2,_onScreenHighestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_highestTemperature
	mov	dph,(_highestTemperature + 1)
	lcall	_floatToText
	ljmp	00141$
00140$:
;	.\src\screens\settingScreen.c:50: splashState = !splashState;
	cpl	_settingScreen_splashState_65536_20
;	.\src\screens\settingScreen.c:51: splashState?putStringOnLCD1602(0, 11, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
	jnb	_settingScreen_splashState_65536_20,00149$
	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65536_20
	mov	(_putStringOnLCD1602_PARM_3 + 1),#0x00
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x40
	mov	_putStringOnLCD1602_PARM_2,#0x0b
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
	sjmp	00150$
00149$:
	mov	_putStringOnLCD1602_PARM_3,#_firstLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
00150$:
;	.\src\screens\settingScreen.c:52: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最低温度（不高于最高温度）
	jb	_P36,00131$
;	.\src\screens\settingScreen.c:53: while (!ADD_BUTTON);    // 等待按键释放
00125$:
	jnb	_P36,00125$
;	.\src\screens\settingScreen.c:54: lowestTemperature ++;
	inc	_lowestTemperature
	clr	a
	cjne	a,_lowestTemperature,00258$
	inc	(_lowestTemperature + 1)
00258$:
;	.\src\screens\settingScreen.c:55: if (lowestTemperature > highestTemperature) lowestTemperature = highestTemperature;
	clr	c
	mov	a,_highestTemperature
	subb	a,_lowestTemperature
	mov	a,(_highestTemperature + 1)
	xrl	a,#0x80
	mov	b,(_lowestTemperature + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00129$
	mov	_lowestTemperature,_highestTemperature
	mov	(_lowestTemperature + 1),(_highestTemperature + 1)
00129$:
;	.\src\screens\settingScreen.c:57: floatToText(lowestTemperature, onScreenLowestTemperature);
	mov	_floatToText_PARM_2,_onScreenLowestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_lowestTemperature
	mov	dph,(_lowestTemperature + 1)
	lcall	_floatToText
00131$:
;	.\src\screens\settingScreen.c:59: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最低温度（不低于-55摄氏度）
	jb	_P35,00141$
;	.\src\screens\settingScreen.c:60: while (!SUB_BUTTON);    // 等待按键释放
00132$:
	jnb	_P35,00132$
;	.\src\screens\settingScreen.c:61: lowestTemperature --;
	dec	_lowestTemperature
	mov	a,#0xff
	cjne	a,_lowestTemperature,00262$
	dec	(_lowestTemperature + 1)
00262$:
;	.\src\screens\settingScreen.c:62: if (lowestTemperature < -55) lowestTemperature = -55;
	clr	c
	mov	a,_lowestTemperature
	subb	a,#0xc9
	mov	a,(_lowestTemperature + 1)
	xrl	a,#0x80
	subb	a,#0x7f
	jnc	00136$
	mov	_lowestTemperature,#0xc9
	mov	(_lowestTemperature + 1),#0xff
00136$:
;	.\src\screens\settingScreen.c:64: floatToText(lowestTemperature, onScreenLowestTemperature);
	mov	_floatToText_PARM_2,_onScreenLowestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_lowestTemperature
	mov	dph,(_lowestTemperature + 1)
	lcall	_floatToText
00141$:
;	.\src\screens\settingScreen.c:67: delayOneMillisecond(300);
	mov	dptr,#0x012c
	lcall	_delayOneMillisecond
	ljmp	00142$
00144$:
;	.\src\screens\settingScreen.c:71: alartScreen("Writing...");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\screens\settingScreen.c:72: writeAT24C02(0x00, (unsigned char)(highestTemperature));
	mov	_writeAT24C02_PARM_2,_highestTemperature
	mov	dpl,#0x00
	lcall	_writeAT24C02
;	.\src\screens\settingScreen.c:73: writeAT24C02(0x01, (unsigned char)(lowestTemperature));
	mov	_writeAT24C02_PARM_2,_lowestTemperature
	mov	dpl,#0x01
;	.\src\screens\settingScreen.c:74: }
	ljmp	_writeAT24C02
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Setting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "Writing..."
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
