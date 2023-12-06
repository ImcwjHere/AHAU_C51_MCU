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
	.globl _initializeEverything
	.globl _doBeep
	.globl _initializeBeeper
	.globl _writeAT24C02
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
;	.\src\main.c:54: int TH_INIT = 0x8E; // 定时器高位初值
	mov	_TH_INIT,#0x8e
	mov	(_TH_INIT + 1),#0x00
;	.\src\main.c:55: int TL_INIT = 0x8E; // 定时器低位初值
	mov	_TL_INIT,#0x8e
	mov	(_TL_INIT + 1),#0x00
;	.\src\main.c:57: unsigned char fanLevel = 0; // 风扇档位
	mov	_fanLevel,#0x00
;	.\src\main.c:59: unsigned char fanState[4] = {0, 0, 0, 0}; // 风扇状态数组
	mov	_fanState,#0x00
	mov	(_fanState + 0x0001),#0x00
	mov	(_fanState + 0x0002),#0x00
	mov	(_fanState + 0x0003),#0x00
;	.\src\main.c:61: float currentTemperature = 0.0; // 当前温度
	clr	a
	mov	_currentTemperature,a
	mov	(_currentTemperature + 1),a
	mov	(_currentTemperature + 2),a
	mov	(_currentTemperature + 3),a
;	.\src\main.c:63: int highestTemperature = 0;
	mov	_highestTemperature,a
	mov	(_highestTemperature + 1),a
;	.\src\main.c:65: int lowestTemperature = 0;
	mov	_lowestTemperature,a
	mov	(_lowestTemperature + 1),a
;	.\src\main.c:71: xdata unsigned char *onScreenHighestTemperature = &firstLine[2];
	mov	a,#0x02
	add	a,#_firstLine
	mov	_onScreenHighestTemperature,a
	clr	a
	addc	a,#(_firstLine >> 8)
	mov	(_onScreenHighestTemperature + 1),a
;	.\src\main.c:73: xdata unsigned char *onScreenLowestTemperature = &firstLine[11];
	mov	a,#0x0b
	add	a,#_firstLine
	mov	_onScreenLowestTemperature,a
	clr	a
	addc	a,#(_firstLine >> 8)
	mov	(_onScreenLowestTemperature + 1),a
;	.\src\main.c:75: xdata unsigned char *onScreenCurrentTemperature = &secondLine[2];
	mov	a,#0x02
	add	a,#_secondLine
	mov	_onScreenCurrentTemperature,a
	clr	a
	addc	a,#(_secondLine >> 8)
	mov	(_onScreenCurrentTemperature + 1),a
;	.\src\main.c:77: xdata unsigned char *onScreenFanLevel = &secondLine[15];
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
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	.\src\main.c:80: void main() {
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
;	.\src\main.c:82: initializeEverything();
	lcall	_initializeEverything
;	.\src\main.c:83: startupScreen();
	lcall	_startupScreen
;	.\src\main.c:84: alartScreen("Starting...");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:86: while (1) {
00117$:
;	.\src\main.c:89: if (!RST_BUTTON) {
	jb	_P33,00105$
;	.\src\main.c:90: while (!RST_BUTTON);    // 等待按键释放
00101$:
	jnb	_P33,00101$
;	.\src\main.c:91: alartScreen("Resetting...");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:92: writeAT24C02(0x00, (unsigned char)(22));
	mov	_writeAT24C02_PARM_2,#0x16
	mov	dpl,#0x00
	lcall	_writeAT24C02
;	.\src\main.c:93: writeAT24C02(0x01, (unsigned char)(20));
	mov	_writeAT24C02_PARM_2,#0x14
	mov	dpl,#0x01
	lcall	_writeAT24C02
00105$:
;	.\src\main.c:97: if (!DEBUG_BUTTON) {
	jb	_P32,00110$
;	.\src\main.c:98: while (!DEBUG_BUTTON);    // 等待按键释放
00106$:
	jnb	_P32,00106$
;	.\src\main.c:99: alartScreen("Debugging...");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_alartScreen
;	.\src\main.c:100: initializeBeeper();
	lcall	_initializeBeeper
;	.\src\main.c:101: doBeep();
	lcall	_doBeep
00110$:
;	.\src\main.c:105: if (!SETTING_BUTTON) {
	jb	_P37,00115$
;	.\src\main.c:106: while (!SETTING_BUTTON);    // 等待按键释放
00111$:
	jnb	_P37,00111$
;	.\src\main.c:107: settingScreen();
	lcall	_settingScreen
00115$:
;	.\src\main.c:111: mainScreen();
	lcall	_mainScreen
;	.\src\main.c:116: }
	sjmp	00117$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Starting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Resetting..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
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
