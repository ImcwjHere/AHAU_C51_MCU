;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _mainScreen
	.globl _settingScreen
	.globl _alartScreen
	.globl _startupScreen
	.globl _doBeep
	.globl _initializeBeeper
	.globl _initializeEverything
	.globl _floatToText
	.globl _prepareReadTemperature
	.globl _getTemperatureOfDS18B20
	.globl _readAT24C02
	.globl _writeAT24C02
	.globl _putStringOnLCD1602
	.globl _writeCharOnLCD1602
	.globl _clearLineInLCD1602
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
	.globl _secondLine
	.globl _firstLine
	.globl _onScreenFanLevel
	.globl _onScreenCurrentTemperature
	.globl _onScreenLowestTemperature
	.globl _onScreenHighestTemperature
	.globl _lowestTemperature
	.globl _highestTemperature
	.globl _currentTemperature
	.globl _fanState
	.globl _fanLevel
	.globl _TL_INIT
	.globl _TH_INIT
	.globl _alartScreen_PARM_2
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
_alartScreen_PARM_2:
	.ds 2
_settingScreen_blankspaceText_65537_50:
	.ds 4
_TH_INIT::
	.ds 2
_TL_INIT::
	.ds 2
_fanLevel::
	.ds 1
_fanState::
	.ds 4
_currentTemperature::
	.ds 4
_highestTemperature::
	.ds 2
_lowestTemperature::
	.ds 2
_onScreenHighestTemperature::
	.ds 2
_onScreenLowestTemperature::
	.ds 2
_onScreenCurrentTemperature::
	.ds 2
_onScreenFanLevel::
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
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
_settingScreen_currentCursor_65537_50:
	.ds 1
_settingScreen_prevCursor_65537_50:
	.ds 1
_settingScreen_splashState_65537_50:
	.ds 1
_settingScreen_sloc0_1_0:
	.ds 1
_mainScreen_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_startupScreen_line_1_65536_39:
	.ds 17
_startupScreen_line_2_65536_39:
	.ds 17
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_firstLine::
	.ds 17
_secondLine::
	.ds 17
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
	reti
	.ds	7
	ljmp	_PWM
	.ds	5
	reti
	.ds	7
	ljmp	_BEEPER
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
;	.\src\main.c:41: int TH_INIT = 0x8E; // 定时器初值
	mov	_TH_INIT,#0x8e
	mov	(_TH_INIT + 1),#0x00
;	.\src\main.c:42: int TL_INIT = 0x8E; // 定时器初值
	mov	_TL_INIT,#0x8e
	mov	(_TL_INIT + 1),#0x00
;	.\src\main.c:43: unsigned char fanLevel = 0; // 风扇档位，0档: 0%转速，1档: 50%转速, 2档: 75%转速, 3档: 100%转速
	mov	_fanLevel,#0x00
;	.\src\main.c:44: unsigned char fanState[4] = {0, 0, 0, 0}; // 用于控制风扇转速（0: 关闭, 1: 打开）
	mov	_fanState,#0x00
	mov	(_fanState + 0x0001),#0x00
	mov	(_fanState + 0x0002),#0x00
	mov	(_fanState + 0x0003),#0x00
;	.\src\main.c:45: float currentTemperature = 0.0; // 当前温度
	clr	a
	mov	_currentTemperature,a
	mov	(_currentTemperature + 1),a
	mov	(_currentTemperature + 2),a
	mov	(_currentTemperature + 3),a
;	.\src\main.c:46: int highestTemperature = 0.0; // 最高温度
	mov	_highestTemperature,a
	mov	(_highestTemperature + 1),a
;	.\src\main.c:47: int lowestTemperature = 0.0; // 最低温度
	mov	_lowestTemperature,a
	mov	(_lowestTemperature + 1),a
;	.\src\main.c:50: xdata unsigned char *onScreenHighestTemperature = &firstLine[2]; // 屏幕上显示的最高温度指针, 占用 3 个字节
	mov	a,#0x02
	add	a,#_firstLine
	mov	_onScreenHighestTemperature,a
	clr	a
	addc	a,#(_firstLine >> 8)
	mov	(_onScreenHighestTemperature + 1),a
;	.\src\main.c:51: xdata unsigned char *onScreenLowestTemperature = &firstLine[11]; // 屏幕上显示的最低温度指针, 占用 3 个字节
	mov	a,#0x0b
	add	a,#_firstLine
	mov	_onScreenLowestTemperature,a
	clr	a
	addc	a,#(_firstLine >> 8)
	mov	(_onScreenLowestTemperature + 1),a
;	.\src\main.c:52: xdata unsigned char *onScreenCurrentTemperature = &secondLine[2]; // 屏幕上显示的当前温度指针, 占用 7 个字节
	mov	a,#0x02
	add	a,#_secondLine
	mov	_onScreenCurrentTemperature,a
	clr	a
	addc	a,#(_secondLine >> 8)
	mov	(_onScreenCurrentTemperature + 1),a
;	.\src\main.c:53: xdata unsigned char *onScreenFanLevel = &secondLine[15]; // 屏幕上显示的风扇档位指针, 占用 1 个字节
	mov	a,#0x0f
	add	a,#_secondLine
	mov	_onScreenFanLevel,a
	clr	a
	addc	a,#(_secondLine >> 8)
	mov	(_onScreenFanLevel + 1),a
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
;Allocation info for local variables in function 'startupScreen'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;j                         Allocated to registers r6 
;delay_ms                  Allocated to registers 
;line_1                    Allocated with name '_startupScreen_line_1_65536_39'
;line_2                    Allocated with name '_startupScreen_line_2_65536_39'
;------------------------------------------------------------
;	src/screen/startupScreen.c:5: void startupScreen() {
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
;	src/screen/startupScreen.c:8: xdata unsigned char line_1[] = "Welcome to AAUCS";
	mov	dptr,#_startupScreen_line_1_65536_39
	mov	a,#0x57
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0001)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0002)
	mov	a,#0x6c
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0003)
	mov	a,#0x63
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0004)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0005)
	mov	a,#0x6d
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0006)
	mov	a,#0x65
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0007)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0008)
	mov	a,#0x74
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0009)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000a)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000b)
	mov	a,#0x41
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000c)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000d)
	mov	a,#0x55
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000e)
	mov	a,#0x43
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000f)
	mov	a,#0x53
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0010)
	clr	a
	movx	@dptr,a
;	src/screen/startupScreen.c:9: xdata unsigned char line_2[] = "     No. 31     ";
	mov	dptr,#_startupScreen_line_2_65536_39
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0001)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0002)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0003)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0004)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0005)
	mov	a,#0x4e
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0006)
	mov	a,#0x6f
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0007)
	mov	a,#0x2e
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0008)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0009)
	mov	a,#0x33
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000a)
	mov	a,#0x31
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000b)
	mov	a,#0x20
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000c)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000d)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000e)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000f)
	movx	@dptr,a
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0010)
	clr	a
	movx	@dptr,a
;	src/screen/startupScreen.c:11: for (i = 0; i < 16; i++) {
	mov	r7,#0x00
00106$:
;	src/screen/startupScreen.c:12: writeCharOnLCD1602(0, i, line_1[i]);
	mov	a,r7
	add	a,#_startupScreen_line_1_65536_39
	mov	dpl,a
	clr	a
	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_writeCharOnLCD1602_PARM_3,a
	mov	_writeCharOnLCD1602_PARM_2,r7
	mov	dpl,#0x00
	push	ar7
	lcall	_writeCharOnLCD1602
	pop	ar7
;	src/screen/startupScreen.c:13: if (i < 7) writeCharOnLCD1602(1, i+5, line_2[i+5]);
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
	add	a,#_startupScreen_line_2_65536_39
	mov	dpl,a
	mov	a,r5
	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_writeCharOnLCD1602_PARM_3,a
	mov	_writeCharOnLCD1602_PARM_2,r6
	mov	dpl,#0x01
	push	ar7
	lcall	_writeCharOnLCD1602
	pop	ar7
00102$:
;	src/screen/startupScreen.c:14: delayOneMillisecond(delay_ms);
	mov	dptr,#0x0032
	push	ar7
	lcall	_delayOneMillisecond
	pop	ar7
;	src/screen/startupScreen.c:11: for (i = 0; i < 16; i++) {
	inc	r7
	cjne	r7,#0x10,00143$
00143$:
	jc	00106$
;	src/screen/startupScreen.c:16: delayOneSecond(1);
	mov	dptr,#0x0001
	lcall	_delayOneSecond
;	src/screen/startupScreen.c:18: for (i = 0; i < 16; i++) {
	mov	r7,#0x00
;	src/screen/startupScreen.c:20: for (j = 0; j < 16; j++) {
00117$:
	mov	r6,#0x00
00108$:
;	src/screen/startupScreen.c:21: line_1[j] = line_1[j+1];
	mov	a,r6
	add	a,#_startupScreen_line_1_65536_39
	mov	r4,a
	clr	a
	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
	mov	r5,a
	mov	ar3,r6
	inc	r3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a,#_startupScreen_line_1_65536_39
	mov	dpl,a
	mov	a,r2
	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
;	src/screen/startupScreen.c:22: line_2[j] = line_2[j+1];
	mov	a,r6
	add	a,#_startupScreen_line_2_65536_39
	mov	r4,a
	clr	a
	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
	mov	r5,a
	mov	a,r3
	add	a,#_startupScreen_line_2_65536_39
	mov	dpl,a
	mov	a,r2
	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
;	src/screen/startupScreen.c:20: for (j = 0; j < 16; j++) {
	inc	r6
	cjne	r6,#0x10,00145$
00145$:
	jc	00108$
;	src/screen/startupScreen.c:24: line_1[15] = ' ';
	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000f)
	mov	a,#0x20
	movx	@dptr,a
;	src/screen/startupScreen.c:25: line_2[15] = ' ';
	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000f)
	movx	@dptr,a
;	src/screen/startupScreen.c:27: putStringOnLCD1602(0, 0, line_1);
	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_1_65536_39
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_1_65536_39 >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	push	ar7
	lcall	_putStringOnLCD1602
;	src/screen/startupScreen.c:28: putStringOnLCD1602(1, 0, line_2);
	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_2_65536_39
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_2_65536_39 >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x01
	lcall	_putStringOnLCD1602
;	src/screen/startupScreen.c:29: delayOneMillisecond(delay_ms/2);
	mov	dptr,#0x0019
	lcall	_delayOneMillisecond
	pop	ar7
;	src/screen/startupScreen.c:18: for (i = 0; i < 16; i++) {
	inc	r7
	cjne	r7,#0x10,00147$
00147$:
	jnc	00148$
	ljmp	00117$
00148$:
;	src/screen/startupScreen.c:31: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'alartScreen'
;------------------------------------------------------------
;ms                        Allocated with name '_alartScreen_PARM_2'
;text                      Allocated to registers r5 r6 r7 
;cur                       Allocated to registers 
;------------------------------------------------------------
;	src/screen/alartScreen.c:4: void alartScreen(unsigned char text[], unsigned int ms) {
;	-----------------------------------------
;	 function alartScreen
;	-----------------------------------------
_alartScreen:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	src/screen/alartScreen.c:7: clearLineInLCD1602(0);
	mov	dpl,#0x00
	push	ar7
	push	ar6
	push	ar5
	lcall	_clearLineInLCD1602
;	src/screen/alartScreen.c:8: clearLineInLCD1602(1);
	mov	dpl,#0x01
	lcall	_clearLineInLCD1602
	pop	ar5
	pop	ar6
	pop	ar7
;	src/screen/alartScreen.c:12: putStringOnLCD1602(0, cur, text);
	mov	_putStringOnLCD1602_PARM_2,#0x03
	mov	_putStringOnLCD1602_PARM_3,r5
	mov	(_putStringOnLCD1602_PARM_3 + 1),r6
	mov	(_putStringOnLCD1602_PARM_3 + 2),r7
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
;	src/screen/alartScreen.c:13: delayOneMillisecond(ms);
	mov	dpl,_alartScreen_PARM_2
	mov	dph,(_alartScreen_PARM_2 + 1)
;	src/screen/alartScreen.c:14: }
	ljmp	_delayOneMillisecond
;------------------------------------------------------------
;Allocation info for local variables in function 'settingScreen'
;------------------------------------------------------------
;blankspaceText            Allocated with name '_settingScreen_blankspaceText_65537_50'
;------------------------------------------------------------
;	src/screen/settingScreen.c:24: void settingScreen() {
;	-----------------------------------------
;	 function settingScreen
;	-----------------------------------------
_settingScreen:
;	src/screen/settingScreen.c:25: while (!SETTING_BUTTON);    // 等待按键释放
00101$:
	jnb	_P37,00101$
;	src/screen/settingScreen.c:26: alartScreen("Setting...", 300);
	mov	_alartScreen_PARM_2,#0x2c
	mov	(_alartScreen_PARM_2 + 1),#0x01
	mov	dptr,#___str_3
	mov	b,#0x80
	lcall	_alartScreen
;	src/screen/settingScreen.c:28: bit currentCursor=0, prevCursor=0;    // 当前/上一个光标位置，0表示控制最高温度，1表示控制最低温度
;	assignBit
	clr	_settingScreen_currentCursor_65537_50
;	assignBit
	clr	_settingScreen_prevCursor_65537_50
;	src/screen/settingScreen.c:29: bit splashState=0;  // 闪烁光标状态，0表示显示温度，1表示显示空格
;	assignBit
	clr	_settingScreen_splashState_65537_50
;	src/screen/settingScreen.c:30: unsigned char blankspaceText[] = "   ";    // 空格
	mov	_settingScreen_blankspaceText_65537_50,#0x20
	mov	(_settingScreen_blankspaceText_65537_50 + 0x0001),#0x20
	mov	(_settingScreen_blankspaceText_65537_50 + 0x0002),#0x20
	mov	(_settingScreen_blankspaceText_65537_50 + 0x0003),#0x00
;	src/screen/settingScreen.c:33: while (APPLY_BUTTON) {
00142$:
	jb	_P34,00240$
	ljmp	00144$
00240$:
;	src/screen/settingScreen.c:36: if (currentCursor != prevCursor) {
	mov	c,_settingScreen_currentCursor_65537_50
	jb	_settingScreen_prevCursor_65537_50,00241$
	cpl	c
00241$:
	jc	00105$
;	src/screen/settingScreen.c:37: putStringOnLCD1602(0, 0, firstLine);
	mov	_putStringOnLCD1602_PARM_3,#_firstLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
;	src/screen/settingScreen.c:38: prevCursor = currentCursor;
;	assignBit
	mov	c,_settingScreen_currentCursor_65537_50
	mov	_settingScreen_prevCursor_65537_50,c
00105$:
;	src/screen/settingScreen.c:42: if (!SETTING_BUTTON) {
	jb	_P37,00110$
;	src/screen/settingScreen.c:43: while (!SETTING_BUTTON);    // 等待按键释放
00106$:
	jnb	_P37,00106$
;	src/screen/settingScreen.c:44: currentCursor = !currentCursor;
	cpl	_settingScreen_currentCursor_65537_50
00110$:
;	src/screen/settingScreen.c:48: if (!currentCursor) {   // 控制最高温度
	jnb	_settingScreen_currentCursor_65537_50,00245$
	ljmp	00140$
00245$:
;	src/screen/settingScreen.c:50: splashState--?putStringOnLCD1602(0, 2, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
;	assignBit
	mov	c,_settingScreen_splashState_65537_50
	mov	_settingScreen_sloc0_1_0,c
	mov	c,_settingScreen_splashState_65537_50
	clr	a
	rlc	a
	dec	a
	add	a,#0xff
	mov	_settingScreen_splashState_65537_50,c
	jnb	_settingScreen_sloc0_1_0,00147$
	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65537_50
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
;	src/screen/settingScreen.c:51: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最高温度（不超过128摄氏度）
	jb	_P36,00117$
;	src/screen/settingScreen.c:52: while (!ADD_BUTTON);    // 等待按键释放
00111$:
	jnb	_P36,00111$
;	src/screen/settingScreen.c:53: highestTemperature ++;
	inc	_highestTemperature
	clr	a
	cjne	a,_highestTemperature,00249$
	inc	(_highestTemperature + 1)
00249$:
;	src/screen/settingScreen.c:54: if (highestTemperature > 128) highestTemperature = 128;
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
;	src/screen/settingScreen.c:56: floatToText(highestTemperature, onScreenHighestTemperature);
	mov	_floatToText_PARM_2,_onScreenHighestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_highestTemperature
	mov	dph,(_highestTemperature + 1)
	lcall	_floatToText
00117$:
;	src/screen/settingScreen.c:58: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最高温度（不低于最低温度）
	jnb	_P35,00251$
	ljmp	00141$
00251$:
;	src/screen/settingScreen.c:59: while (!SUB_BUTTON);    // 等待按键释放
00118$:
	jnb	_P35,00118$
;	src/screen/settingScreen.c:60: highestTemperature --;
	dec	_highestTemperature
	mov	a,#0xff
	cjne	a,_highestTemperature,00253$
	dec	(_highestTemperature + 1)
00253$:
;	src/screen/settingScreen.c:61: if (highestTemperature < lowestTemperature) highestTemperature = lowestTemperature;
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
;	src/screen/settingScreen.c:63: floatToText(highestTemperature, onScreenHighestTemperature);
	mov	_floatToText_PARM_2,_onScreenHighestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_highestTemperature
	mov	dph,(_highestTemperature + 1)
	lcall	_floatToText
	ljmp	00141$
00140$:
;	src/screen/settingScreen.c:67: splashState--?putStringOnLCD1602(0, 11, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
;	assignBit
	mov	c,_settingScreen_splashState_65537_50
	mov	_settingScreen_sloc0_1_0,c
	mov	c,_settingScreen_splashState_65537_50
	clr	a
	rlc	a
	dec	a
	add	a,#0xff
	mov	_settingScreen_splashState_65537_50,c
	jnb	_settingScreen_sloc0_1_0,00149$
	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65537_50
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
;	src/screen/settingScreen.c:68: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最低温度（不高于最高温度）
	jb	_P36,00131$
;	src/screen/settingScreen.c:69: while (!ADD_BUTTON);    // 等待按键释放
00125$:
	jnb	_P36,00125$
;	src/screen/settingScreen.c:70: lowestTemperature ++;
	inc	_lowestTemperature
	clr	a
	cjne	a,_lowestTemperature,00258$
	inc	(_lowestTemperature + 1)
00258$:
;	src/screen/settingScreen.c:71: if (lowestTemperature > highestTemperature) lowestTemperature = highestTemperature;
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
;	src/screen/settingScreen.c:73: floatToText(lowestTemperature, onScreenLowestTemperature);
	mov	_floatToText_PARM_2,_onScreenLowestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_lowestTemperature
	mov	dph,(_lowestTemperature + 1)
	lcall	_floatToText
00131$:
;	src/screen/settingScreen.c:75: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最低温度（不低于-55摄氏度）
	jb	_P35,00141$
;	src/screen/settingScreen.c:76: while (!SUB_BUTTON);    // 等待按键释放
00132$:
	jnb	_P35,00132$
;	src/screen/settingScreen.c:77: lowestTemperature --;
	dec	_lowestTemperature
	mov	a,#0xff
	cjne	a,_lowestTemperature,00262$
	dec	(_lowestTemperature + 1)
00262$:
;	src/screen/settingScreen.c:78: if (lowestTemperature < -55) lowestTemperature = -55;
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
;	src/screen/settingScreen.c:80: floatToText(lowestTemperature, onScreenLowestTemperature);
	mov	_floatToText_PARM_2,_onScreenLowestTemperature
	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
	mov	(_floatToText_PARM_2 + 2),#0x00
	mov	dpl,_lowestTemperature
	mov	dph,(_lowestTemperature + 1)
	lcall	_floatToText
00141$:
;	src/screen/settingScreen.c:83: delayOneMillisecond(300);
	mov	dptr,#0x012c
	lcall	_delayOneMillisecond
	ljmp	00142$
00144$:
;	src/screen/settingScreen.c:87: alartScreen("Writing...", 300);
	mov	_alartScreen_PARM_2,#0x2c
	mov	(_alartScreen_PARM_2 + 1),#0x01
	mov	dptr,#___str_4
	mov	b,#0x80
	lcall	_alartScreen
;	src/screen/settingScreen.c:88: writeAT24C02(0x00, (unsigned char)(highestTemperature));
	mov	_writeAT24C02_PARM_2,_highestTemperature
	mov	dpl,#0x00
	lcall	_writeAT24C02
;	src/screen/settingScreen.c:89: writeAT24C02(0x01, (unsigned char)(lowestTemperature));
	mov	_writeAT24C02_PARM_2,_lowestTemperature
	mov	dpl,#0x01
;	src/screen/settingScreen.c:90: }
	ljmp	_writeAT24C02
;------------------------------------------------------------
;Allocation info for local variables in function 'mainScreen'
;------------------------------------------------------------
;temp                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	src/screen/mainScreen.c:23: void mainScreen() {
;	-----------------------------------------
;	 function mainScreen
;	-----------------------------------------
_mainScreen:
;	src/screen/mainScreen.c:25: prepareReadTemperature(readAT24C02(0x00), onScreenHighestTemperature, &highestTemperature);
	mov	dpl,#0x00
	lcall	_readAT24C02
	mov	_prepareReadTemperature_PARM_2,_onScreenHighestTemperature
	mov	(_prepareReadTemperature_PARM_2 + 1),(_onScreenHighestTemperature + 1)
	mov	(_prepareReadTemperature_PARM_2 + 2),#0x00
	mov	_prepareReadTemperature_PARM_3,#_highestTemperature
	mov	(_prepareReadTemperature_PARM_3 + 1),#0x00
	mov	(_prepareReadTemperature_PARM_3 + 2),#0x40
	lcall	_prepareReadTemperature
;	src/screen/mainScreen.c:26: prepareReadTemperature(readAT24C02(0x01), onScreenLowestTemperature, &lowestTemperature);
	mov	dpl,#0x01
	lcall	_readAT24C02
	mov	_prepareReadTemperature_PARM_2,_onScreenLowestTemperature
	mov	(_prepareReadTemperature_PARM_2 + 1),(_onScreenLowestTemperature + 1)
	mov	(_prepareReadTemperature_PARM_2 + 2),#0x00
	mov	_prepareReadTemperature_PARM_3,#_lowestTemperature
	mov	(_prepareReadTemperature_PARM_3 + 1),#0x00
	mov	(_prepareReadTemperature_PARM_3 + 2),#0x40
	lcall	_prepareReadTemperature
;	src/screen/mainScreen.c:28: getTemperatureOfDS18B20(onScreenCurrentTemperature, &currentTemperature);
	mov	r5,_onScreenCurrentTemperature
	mov	r6,(_onScreenCurrentTemperature + 1)
	mov	r7,#0x00
	mov	_getTemperatureOfDS18B20_PARM_2,#_currentTemperature
;	1-genFromRTrack replaced	mov	(_getTemperatureOfDS18B20_PARM_2 + 1),#0x00
	mov	(_getTemperatureOfDS18B20_PARM_2 + 1),r7
	mov	(_getTemperatureOfDS18B20_PARM_2 + 2),#0x40
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	_getTemperatureOfDS18B20
;	src/screen/mainScreen.c:30: *onScreenFanLevel = (unsigned char)('0' + fanLevel);
	mov	dpl,_onScreenFanLevel
	mov	dph,(_onScreenFanLevel + 1)
	mov	r7,_fanLevel
	mov	a,#0x30
	add	a,r7
	movx	@dptr,a
;	src/screen/mainScreen.c:33: LED = !(currentTemperature < lowestTemperature);
	mov	dpl,_lowestTemperature
	mov	dph,(_lowestTemperature + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_currentTemperature
	mov	dph,(_currentTemperature + 1)
	mov	b,(_currentTemperature + 2)
	mov	a,(_currentTemperature + 3)
	lcall	___fslt
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,dpl
	add	a,#0xff
	cpl	c
	mov	_mainScreen_sloc0_1_0,c
	clr	a
	rlc	a
	add	a,#0xff
	mov	_P20,c
;	src/screen/mainScreen.c:37: int temp = currentTemperature - highestTemperature;
	mov	dpl,_highestTemperature
	mov	dph,(_highestTemperature + 1)
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_currentTemperature
	mov	dph,(_currentTemperature + 1)
	mov	b,(_currentTemperature + 2)
	mov	a,(_currentTemperature + 3)
	lcall	___fssub
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2sint
	mov	r6,dpl
	mov	r7,dph
;	src/screen/mainScreen.c:38: if (temp >= 6) {
	clr	c
	mov	a,r6
	subb	a,#0x06
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00108$
;	src/screen/mainScreen.c:39: fanLevel = 3;
	mov	_fanLevel,#0x03
;	src/screen/mainScreen.c:40: fanState[0] = 1;
	mov	_fanState,#0x01
;	src/screen/mainScreen.c:41: fanState[1] = 1;
	mov	(_fanState + 0x0001),#0x01
;	src/screen/mainScreen.c:42: fanState[2] = 1;
	mov	(_fanState + 0x0002),#0x01
;	src/screen/mainScreen.c:43: fanState[3] = 1;
	mov	(_fanState + 0x0003),#0x01
	sjmp	00109$
00108$:
;	src/screen/mainScreen.c:44: } else if (temp >= 4) {
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00105$
;	src/screen/mainScreen.c:45: fanLevel = 2;
	mov	_fanLevel,#0x02
;	src/screen/mainScreen.c:46: fanState[0] = 1;
	mov	_fanState,#0x01
;	src/screen/mainScreen.c:47: fanState[1] = 1;
	mov	(_fanState + 0x0001),#0x01
;	src/screen/mainScreen.c:48: fanState[2] = 1;
	mov	(_fanState + 0x0002),#0x01
;	src/screen/mainScreen.c:49: fanState[3] = 0;
	mov	(_fanState + 0x0003),#0x00
	sjmp	00109$
00105$:
;	src/screen/mainScreen.c:50: } else if (temp >= 2) {
	clr	c
	mov	a,r6
	subb	a,#0x02
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00102$
;	src/screen/mainScreen.c:51: fanLevel = 1;
	mov	_fanLevel,#0x01
;	src/screen/mainScreen.c:52: fanState[0] = 1;
	mov	_fanState,#0x01
;	src/screen/mainScreen.c:53: fanState[1] = 1;
	mov	(_fanState + 0x0001),#0x01
;	src/screen/mainScreen.c:54: fanState[2] = 0;
	mov	(_fanState + 0x0002),#0x00
;	src/screen/mainScreen.c:55: fanState[3] = 0;
	mov	(_fanState + 0x0003),#0x00
	sjmp	00109$
00102$:
;	src/screen/mainScreen.c:57: fanLevel = 0;
	mov	_fanLevel,#0x00
;	src/screen/mainScreen.c:58: fanState[0] = 0;
	mov	_fanState,#0x00
;	src/screen/mainScreen.c:59: fanState[1] = 0;
	mov	(_fanState + 0x0001),#0x00
;	src/screen/mainScreen.c:60: fanState[2] = 0;
	mov	(_fanState + 0x0002),#0x00
;	src/screen/mainScreen.c:61: fanState[3] = 0;
	mov	(_fanState + 0x0003),#0x00
00109$:
;	src/screen/mainScreen.c:65: putStringOnLCD1602(0, 0, firstLine);
	mov	_putStringOnLCD1602_PARM_3,#_firstLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x00
	lcall	_putStringOnLCD1602
;	src/screen/mainScreen.c:66: putStringOnLCD1602(1, 0, secondLine);
	mov	_putStringOnLCD1602_PARM_3,#_secondLine
	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_secondLine >> 8)
	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
	mov	_putStringOnLCD1602_PARM_2,#0x00
	mov	dpl,#0x01
;	src/screen/mainScreen.c:67: }
	ljmp	_putStringOnLCD1602
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	.\src\main.c:55: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	.\src\main.c:56: initializeEverything();
	lcall	_initializeEverything
;	.\src\main.c:57: startupScreen();
	lcall	_startupScreen
;	.\src\main.c:58: alartScreen("Starting...", 300);
	mov	_alartScreen_PARM_2,#0x2c
	mov	(_alartScreen_PARM_2 + 1),#0x01
	mov	dptr,#___str_5
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:60: while (1) {
00117$:
;	.\src\main.c:63: if (!RST_BUTTON) {
	jb	_P33,00105$
;	.\src\main.c:64: while (!RST_BUTTON);    // 等待按键释放
00101$:
	jnb	_P33,00101$
;	.\src\main.c:65: alartScreen("Resetting...", 300);
	mov	_alartScreen_PARM_2,#0x2c
	mov	(_alartScreen_PARM_2 + 1),#0x01
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:66: writeAT24C02(0x00, (unsigned char)(22));
	mov	_writeAT24C02_PARM_2,#0x16
	mov	dpl,#0x00
	lcall	_writeAT24C02
;	.\src\main.c:67: writeAT24C02(0x01, (unsigned char)(20));
	mov	_writeAT24C02_PARM_2,#0x14
	mov	dpl,#0x01
	lcall	_writeAT24C02
00105$:
;	.\src\main.c:71: if (!DEBUG_BUTTON) {
	jb	_P32,00110$
;	.\src\main.c:72: while (!DEBUG_BUTTON);    // 等待按键释放
00106$:
	jnb	_P32,00106$
;	.\src\main.c:73: alartScreen("Debugging...", 300);
	mov	_alartScreen_PARM_2,#0x2c
	mov	(_alartScreen_PARM_2 + 1),#0x01
	mov	dptr,#___str_7
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:74: initializeBeeper();
	lcall	_initializeBeeper
;	.\src\main.c:75: doBeep();
	lcall	_doBeep
00110$:
;	.\src\main.c:79: if (!SETTING_BUTTON) {
	jb	_P37,00115$
;	.\src\main.c:80: while (!SETTING_BUTTON);    // 等待按键释放
00111$:
	jnb	_P37,00111$
;	.\src\main.c:81: settingScreen();
	lcall	_settingScreen
00115$:
;	.\src\main.c:85: mainScreen();
	lcall	_mainScreen
;	.\src\main.c:90: }
	sjmp	00117$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Setting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "Writing..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.ascii "Starting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_6:
	.ascii "Resetting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_7:
	.ascii "Debugging..."
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
__xinit__firstLine:
	.db #0x48	; 72	'H'
	.db #0x3a	; 58
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xdf	; 223
	.db #0x43	; 67	'C'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x4c	; 76	'L'
	.db #0x3a	; 58
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xdf	; 223
	.db #0x43	; 67	'C'
	.db #0x00	; 0
__xinit__secondLine:
	.db #0x54	; 84	'T'
	.db #0x3a	; 58
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x2e	; 46
	.db #0x78	; 120	'x'
	.db #0xdf	; 223
	.db #0x43	; 67	'C'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x46	; 70	'F'
	.db #0x41	; 65	'A'
	.db #0x4e	; 78	'N'
	.db #0x3a	; 58
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
