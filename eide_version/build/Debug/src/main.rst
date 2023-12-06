                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _mainScreen
                                     13 	.globl _settingScreen
                                     14 	.globl _alartScreen
                                     15 	.globl _startupScreen
                                     16 	.globl _doBeep
                                     17 	.globl _initializeBeeper
                                     18 	.globl _initializeEverything
                                     19 	.globl _floatToText
                                     20 	.globl _prepareReadTemperature
                                     21 	.globl _getTemperatureOfDS18B20
                                     22 	.globl _readAT24C02
                                     23 	.globl _writeAT24C02
                                     24 	.globl _putStringOnLCD1602
                                     25 	.globl _writeCharOnLCD1602
                                     26 	.globl _clearLineInLCD1602
                                     27 	.globl _delayOneSecond
                                     28 	.globl _delayOneMillisecond
                                     29 	.globl _CP_RL2
                                     30 	.globl _C_T2
                                     31 	.globl _TR2
                                     32 	.globl _EXEN2
                                     33 	.globl _TCLK
                                     34 	.globl _RCLK
                                     35 	.globl _EXF2
                                     36 	.globl _TF2
                                     37 	.globl _T2
                                     38 	.globl _T2EX
                                     39 	.globl _RI
                                     40 	.globl _TI
                                     41 	.globl _RB8
                                     42 	.globl _TB8
                                     43 	.globl _REN
                                     44 	.globl _SM2
                                     45 	.globl _SM1
                                     46 	.globl _SM0
                                     47 	.globl _RXD
                                     48 	.globl _TXD
                                     49 	.globl _INT0
                                     50 	.globl _INT1
                                     51 	.globl _T0
                                     52 	.globl _T1
                                     53 	.globl _WR
                                     54 	.globl _RD
                                     55 	.globl _PX0
                                     56 	.globl _PT0
                                     57 	.globl _PX1
                                     58 	.globl _PT1
                                     59 	.globl _PS
                                     60 	.globl _PT2
                                     61 	.globl _EX0
                                     62 	.globl _ET0
                                     63 	.globl _EX1
                                     64 	.globl _ET1
                                     65 	.globl _ES
                                     66 	.globl _ET2
                                     67 	.globl _EA
                                     68 	.globl _IT0
                                     69 	.globl _IE0
                                     70 	.globl _IT1
                                     71 	.globl _IE1
                                     72 	.globl _TR0
                                     73 	.globl _TF0
                                     74 	.globl _TR1
                                     75 	.globl _TF1
                                     76 	.globl _P
                                     77 	.globl _OV
                                     78 	.globl _RS0
                                     79 	.globl _RS1
                                     80 	.globl _F0
                                     81 	.globl _AC
                                     82 	.globl _CY
                                     83 	.globl _P37
                                     84 	.globl _P36
                                     85 	.globl _P35
                                     86 	.globl _P34
                                     87 	.globl _P33
                                     88 	.globl _P32
                                     89 	.globl _P31
                                     90 	.globl _P30
                                     91 	.globl _P27
                                     92 	.globl _P26
                                     93 	.globl _P25
                                     94 	.globl _P24
                                     95 	.globl _P23
                                     96 	.globl _P22
                                     97 	.globl _P21
                                     98 	.globl _P20
                                     99 	.globl _P17
                                    100 	.globl _P16
                                    101 	.globl _P15
                                    102 	.globl _P14
                                    103 	.globl _P13
                                    104 	.globl _P12
                                    105 	.globl _P11
                                    106 	.globl _P10
                                    107 	.globl _P07
                                    108 	.globl _P06
                                    109 	.globl _P05
                                    110 	.globl _P04
                                    111 	.globl _P03
                                    112 	.globl _P02
                                    113 	.globl _P01
                                    114 	.globl _P00
                                    115 	.globl _TH2
                                    116 	.globl _TL2
                                    117 	.globl _RCAP2H
                                    118 	.globl _RCAP2L
                                    119 	.globl _T2CON
                                    120 	.globl _SBUF
                                    121 	.globl _SCON
                                    122 	.globl _IP
                                    123 	.globl _IE
                                    124 	.globl _TH1
                                    125 	.globl _TH0
                                    126 	.globl _TL1
                                    127 	.globl _TL0
                                    128 	.globl _TMOD
                                    129 	.globl _TCON
                                    130 	.globl _PCON
                                    131 	.globl _DPH
                                    132 	.globl _DPL
                                    133 	.globl _SP
                                    134 	.globl _B
                                    135 	.globl _ACC
                                    136 	.globl _PSW
                                    137 	.globl _P3
                                    138 	.globl _P2
                                    139 	.globl _P1
                                    140 	.globl _P0
                                    141 	.globl _secondLine
                                    142 	.globl _firstLine
                                    143 	.globl _onScreenFanLevel
                                    144 	.globl _onScreenCurrentTemperature
                                    145 	.globl _onScreenLowestTemperature
                                    146 	.globl _onScreenHighestTemperature
                                    147 	.globl _lowestTemperature
                                    148 	.globl _highestTemperature
                                    149 	.globl _currentTemperature
                                    150 	.globl _fanState
                                    151 	.globl _fanLevel
                                    152 	.globl _TL_INIT
                                    153 	.globl _TH_INIT
                                    154 	.globl _alartScreen_PARM_2
                                    155 ;--------------------------------------------------------
                                    156 ; special function registers
                                    157 ;--------------------------------------------------------
                                    158 	.area RSEG    (ABS,DATA)
      000000                        159 	.org 0x0000
                           000080   160 _P0	=	0x0080
                           000090   161 _P1	=	0x0090
                           0000A0   162 _P2	=	0x00a0
                           0000B0   163 _P3	=	0x00b0
                           0000D0   164 _PSW	=	0x00d0
                           0000E0   165 _ACC	=	0x00e0
                           0000F0   166 _B	=	0x00f0
                           000081   167 _SP	=	0x0081
                           000082   168 _DPL	=	0x0082
                           000083   169 _DPH	=	0x0083
                           000087   170 _PCON	=	0x0087
                           000088   171 _TCON	=	0x0088
                           000089   172 _TMOD	=	0x0089
                           00008A   173 _TL0	=	0x008a
                           00008B   174 _TL1	=	0x008b
                           00008C   175 _TH0	=	0x008c
                           00008D   176 _TH1	=	0x008d
                           0000A8   177 _IE	=	0x00a8
                           0000B8   178 _IP	=	0x00b8
                           000098   179 _SCON	=	0x0098
                           000099   180 _SBUF	=	0x0099
                           0000C8   181 _T2CON	=	0x00c8
                           0000CA   182 _RCAP2L	=	0x00ca
                           0000CB   183 _RCAP2H	=	0x00cb
                           0000CC   184 _TL2	=	0x00cc
                           0000CD   185 _TH2	=	0x00cd
                                    186 ;--------------------------------------------------------
                                    187 ; special function bits
                                    188 ;--------------------------------------------------------
                                    189 	.area RSEG    (ABS,DATA)
      000000                        190 	.org 0x0000
                           000080   191 _P00	=	0x0080
                           000081   192 _P01	=	0x0081
                           000082   193 _P02	=	0x0082
                           000083   194 _P03	=	0x0083
                           000084   195 _P04	=	0x0084
                           000085   196 _P05	=	0x0085
                           000086   197 _P06	=	0x0086
                           000087   198 _P07	=	0x0087
                           000090   199 _P10	=	0x0090
                           000091   200 _P11	=	0x0091
                           000092   201 _P12	=	0x0092
                           000093   202 _P13	=	0x0093
                           000094   203 _P14	=	0x0094
                           000095   204 _P15	=	0x0095
                           000096   205 _P16	=	0x0096
                           000097   206 _P17	=	0x0097
                           0000A0   207 _P20	=	0x00a0
                           0000A1   208 _P21	=	0x00a1
                           0000A2   209 _P22	=	0x00a2
                           0000A3   210 _P23	=	0x00a3
                           0000A4   211 _P24	=	0x00a4
                           0000A5   212 _P25	=	0x00a5
                           0000A6   213 _P26	=	0x00a6
                           0000A7   214 _P27	=	0x00a7
                           0000B0   215 _P30	=	0x00b0
                           0000B1   216 _P31	=	0x00b1
                           0000B2   217 _P32	=	0x00b2
                           0000B3   218 _P33	=	0x00b3
                           0000B4   219 _P34	=	0x00b4
                           0000B5   220 _P35	=	0x00b5
                           0000B6   221 _P36	=	0x00b6
                           0000B7   222 _P37	=	0x00b7
                           0000D7   223 _CY	=	0x00d7
                           0000D6   224 _AC	=	0x00d6
                           0000D5   225 _F0	=	0x00d5
                           0000D4   226 _RS1	=	0x00d4
                           0000D3   227 _RS0	=	0x00d3
                           0000D2   228 _OV	=	0x00d2
                           0000D0   229 _P	=	0x00d0
                           00008F   230 _TF1	=	0x008f
                           00008E   231 _TR1	=	0x008e
                           00008D   232 _TF0	=	0x008d
                           00008C   233 _TR0	=	0x008c
                           00008B   234 _IE1	=	0x008b
                           00008A   235 _IT1	=	0x008a
                           000089   236 _IE0	=	0x0089
                           000088   237 _IT0	=	0x0088
                           0000AF   238 _EA	=	0x00af
                           0000AD   239 _ET2	=	0x00ad
                           0000AC   240 _ES	=	0x00ac
                           0000AB   241 _ET1	=	0x00ab
                           0000AA   242 _EX1	=	0x00aa
                           0000A9   243 _ET0	=	0x00a9
                           0000A8   244 _EX0	=	0x00a8
                           0000BD   245 _PT2	=	0x00bd
                           0000BC   246 _PS	=	0x00bc
                           0000BB   247 _PT1	=	0x00bb
                           0000BA   248 _PX1	=	0x00ba
                           0000B9   249 _PT0	=	0x00b9
                           0000B8   250 _PX0	=	0x00b8
                           0000B7   251 _RD	=	0x00b7
                           0000B6   252 _WR	=	0x00b6
                           0000B5   253 _T1	=	0x00b5
                           0000B4   254 _T0	=	0x00b4
                           0000B3   255 _INT1	=	0x00b3
                           0000B2   256 _INT0	=	0x00b2
                           0000B1   257 _TXD	=	0x00b1
                           0000B0   258 _RXD	=	0x00b0
                           00009F   259 _SM0	=	0x009f
                           00009E   260 _SM1	=	0x009e
                           00009D   261 _SM2	=	0x009d
                           00009C   262 _REN	=	0x009c
                           00009B   263 _TB8	=	0x009b
                           00009A   264 _RB8	=	0x009a
                           000099   265 _TI	=	0x0099
                           000098   266 _RI	=	0x0098
                           000091   267 _T2EX	=	0x0091
                           000090   268 _T2	=	0x0090
                           0000CF   269 _TF2	=	0x00cf
                           0000CE   270 _EXF2	=	0x00ce
                           0000CD   271 _RCLK	=	0x00cd
                           0000CC   272 _TCLK	=	0x00cc
                           0000CB   273 _EXEN2	=	0x00cb
                           0000CA   274 _TR2	=	0x00ca
                           0000C9   275 _C_T2	=	0x00c9
                           0000C8   276 _CP_RL2	=	0x00c8
                                    277 ;--------------------------------------------------------
                                    278 ; overlayable register banks
                                    279 ;--------------------------------------------------------
                                    280 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        281 	.ds 8
                                    282 ;--------------------------------------------------------
                                    283 ; internal ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area DSEG    (DATA)
      000021                        286 _alartScreen_PARM_2:
      000021                        287 	.ds 2
      000023                        288 _settingScreen_blankspaceText_65537_50:
      000023                        289 	.ds 4
      000027                        290 _TH_INIT::
      000027                        291 	.ds 2
      000029                        292 _TL_INIT::
      000029                        293 	.ds 2
      00002B                        294 _fanLevel::
      00002B                        295 	.ds 1
      00002C                        296 _fanState::
      00002C                        297 	.ds 4
      000030                        298 _currentTemperature::
      000030                        299 	.ds 4
      000034                        300 _highestTemperature::
      000034                        301 	.ds 2
      000036                        302 _lowestTemperature::
      000036                        303 	.ds 2
      000038                        304 _onScreenHighestTemperature::
      000038                        305 	.ds 2
      00003A                        306 _onScreenLowestTemperature::
      00003A                        307 	.ds 2
      00003C                        308 _onScreenCurrentTemperature::
      00003C                        309 	.ds 2
      00003E                        310 _onScreenFanLevel::
      00003E                        311 	.ds 2
                                    312 ;--------------------------------------------------------
                                    313 ; overlayable items in internal ram
                                    314 ;--------------------------------------------------------
                                    315 ;--------------------------------------------------------
                                    316 ; Stack segment in internal ram
                                    317 ;--------------------------------------------------------
                                    318 	.area	SSEG
      00006A                        319 __start__stack:
      00006A                        320 	.ds	1
                                    321 
                                    322 ;--------------------------------------------------------
                                    323 ; indirectly addressable internal ram data
                                    324 ;--------------------------------------------------------
                                    325 	.area ISEG    (DATA)
                                    326 ;--------------------------------------------------------
                                    327 ; absolute internal ram data
                                    328 ;--------------------------------------------------------
                                    329 	.area IABS    (ABS,DATA)
                                    330 	.area IABS    (ABS,DATA)
                                    331 ;--------------------------------------------------------
                                    332 ; bit data
                                    333 ;--------------------------------------------------------
                                    334 	.area BSEG    (BIT)
      000000                        335 _settingScreen_currentCursor_65537_50:
      000000                        336 	.ds 1
      000001                        337 _settingScreen_prevCursor_65537_50:
      000001                        338 	.ds 1
      000002                        339 _settingScreen_splashState_65537_50:
      000002                        340 	.ds 1
      000003                        341 _settingScreen_sloc0_1_0:
      000003                        342 	.ds 1
      000004                        343 _mainScreen_sloc0_1_0:
      000004                        344 	.ds 1
                                    345 ;--------------------------------------------------------
                                    346 ; paged external ram data
                                    347 ;--------------------------------------------------------
                                    348 	.area PSEG    (PAG,XDATA)
                                    349 ;--------------------------------------------------------
                                    350 ; external ram data
                                    351 ;--------------------------------------------------------
                                    352 	.area XSEG    (XDATA)
      000001                        353 _startupScreen_line_1_65536_39:
      000001                        354 	.ds 17
      000012                        355 _startupScreen_line_2_65536_39:
      000012                        356 	.ds 17
                                    357 ;--------------------------------------------------------
                                    358 ; absolute external ram data
                                    359 ;--------------------------------------------------------
                                    360 	.area XABS    (ABS,XDATA)
                                    361 ;--------------------------------------------------------
                                    362 ; external initialized ram data
                                    363 ;--------------------------------------------------------
                                    364 	.area XISEG   (XDATA)
      000023                        365 _firstLine::
      000023                        366 	.ds 17
      000034                        367 _secondLine::
      000034                        368 	.ds 17
                                    369 	.area HOME    (CODE)
                                    370 	.area GSINIT0 (CODE)
                                    371 	.area GSINIT1 (CODE)
                                    372 	.area GSINIT2 (CODE)
                                    373 	.area GSINIT3 (CODE)
                                    374 	.area GSINIT4 (CODE)
                                    375 	.area GSINIT5 (CODE)
                                    376 	.area GSINIT  (CODE)
                                    377 	.area GSFINAL (CODE)
                                    378 	.area CSEG    (CODE)
                                    379 ;--------------------------------------------------------
                                    380 ; interrupt vector
                                    381 ;--------------------------------------------------------
                                    382 	.area HOME    (CODE)
      000000                        383 __interrupt_vect:
      000000 02 00 21         [24]  384 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  385 	reti
      000004                        386 	.ds	7
      00000B 02 0D B9         [24]  387 	ljmp	_PWM
      00000E                        388 	.ds	5
      000013 32               [24]  389 	reti
      000014                        390 	.ds	7
      00001B 02 0D 13         [24]  391 	ljmp	_BEEPER
                                    392 ;--------------------------------------------------------
                                    393 ; global & static initialisations
                                    394 ;--------------------------------------------------------
                                    395 	.area HOME    (CODE)
                                    396 	.area GSINIT  (CODE)
                                    397 	.area GSFINAL (CODE)
                                    398 	.area GSINIT  (CODE)
                                    399 	.globl __sdcc_gsinit_startup
                                    400 	.globl __sdcc_program_startup
                                    401 	.globl __start__stack
                                    402 	.globl __mcs51_genXINIT
                                    403 	.globl __mcs51_genXRAMCLEAR
                                    404 	.globl __mcs51_genRAMCLEAR
                                    405 ;	.\src\main.c:41: int TH_INIT = 0x8E; // 定时器初值
      00007A 75 27 8E         [24]  406 	mov	_TH_INIT,#0x8e
      00007D 75 28 00         [24]  407 	mov	(_TH_INIT + 1),#0x00
                                    408 ;	.\src\main.c:42: int TL_INIT = 0x8E; // 定时器初值
      000080 75 29 8E         [24]  409 	mov	_TL_INIT,#0x8e
      000083 75 2A 00         [24]  410 	mov	(_TL_INIT + 1),#0x00
                                    411 ;	.\src\main.c:43: unsigned char fanLevel = 0; // 风扇档位，0档: 0%转速，1档: 50%转速, 2档: 75%转速, 3档: 100%转速
      000086 75 2B 00         [24]  412 	mov	_fanLevel,#0x00
                                    413 ;	.\src\main.c:44: unsigned char fanState[4] = {0, 0, 0, 0}; // 用于控制风扇转速（0: 关闭, 1: 打开）
      000089 75 2C 00         [24]  414 	mov	_fanState,#0x00
      00008C 75 2D 00         [24]  415 	mov	(_fanState + 0x0001),#0x00
      00008F 75 2E 00         [24]  416 	mov	(_fanState + 0x0002),#0x00
      000092 75 2F 00         [24]  417 	mov	(_fanState + 0x0003),#0x00
                                    418 ;	.\src\main.c:45: float currentTemperature = 0.0; // 当前温度
      000095 E4               [12]  419 	clr	a
      000096 F5 30            [12]  420 	mov	_currentTemperature,a
      000098 F5 31            [12]  421 	mov	(_currentTemperature + 1),a
      00009A F5 32            [12]  422 	mov	(_currentTemperature + 2),a
      00009C F5 33            [12]  423 	mov	(_currentTemperature + 3),a
                                    424 ;	.\src\main.c:46: int highestTemperature = 0.0; // 最高温度
      00009E F5 34            [12]  425 	mov	_highestTemperature,a
      0000A0 F5 35            [12]  426 	mov	(_highestTemperature + 1),a
                                    427 ;	.\src\main.c:47: int lowestTemperature = 0.0; // 最低温度
      0000A2 F5 36            [12]  428 	mov	_lowestTemperature,a
      0000A4 F5 37            [12]  429 	mov	(_lowestTemperature + 1),a
                                    430 ;	.\src\main.c:50: xdata unsigned char *onScreenHighestTemperature = &firstLine[2]; // 屏幕上显示的最高温度指针, 占用 3 个字节
      0000A6 74 02            [12]  431 	mov	a,#0x02
      0000A8 24 23            [12]  432 	add	a,#_firstLine
      0000AA F5 38            [12]  433 	mov	_onScreenHighestTemperature,a
      0000AC E4               [12]  434 	clr	a
      0000AD 34 00            [12]  435 	addc	a,#(_firstLine >> 8)
      0000AF F5 39            [12]  436 	mov	(_onScreenHighestTemperature + 1),a
                                    437 ;	.\src\main.c:51: xdata unsigned char *onScreenLowestTemperature = &firstLine[11]; // 屏幕上显示的最低温度指针, 占用 3 个字节
      0000B1 74 0B            [12]  438 	mov	a,#0x0b
      0000B3 24 23            [12]  439 	add	a,#_firstLine
      0000B5 F5 3A            [12]  440 	mov	_onScreenLowestTemperature,a
      0000B7 E4               [12]  441 	clr	a
      0000B8 34 00            [12]  442 	addc	a,#(_firstLine >> 8)
      0000BA F5 3B            [12]  443 	mov	(_onScreenLowestTemperature + 1),a
                                    444 ;	.\src\main.c:52: xdata unsigned char *onScreenCurrentTemperature = &secondLine[2]; // 屏幕上显示的当前温度指针, 占用 7 个字节
      0000BC 74 02            [12]  445 	mov	a,#0x02
      0000BE 24 34            [12]  446 	add	a,#_secondLine
      0000C0 F5 3C            [12]  447 	mov	_onScreenCurrentTemperature,a
      0000C2 E4               [12]  448 	clr	a
      0000C3 34 00            [12]  449 	addc	a,#(_secondLine >> 8)
      0000C5 F5 3D            [12]  450 	mov	(_onScreenCurrentTemperature + 1),a
                                    451 ;	.\src\main.c:53: xdata unsigned char *onScreenFanLevel = &secondLine[15]; // 屏幕上显示的风扇档位指针, 占用 1 个字节
      0000C7 74 0F            [12]  452 	mov	a,#0x0f
      0000C9 24 34            [12]  453 	add	a,#_secondLine
      0000CB F5 3E            [12]  454 	mov	_onScreenFanLevel,a
      0000CD E4               [12]  455 	clr	a
      0000CE 34 00            [12]  456 	addc	a,#(_secondLine >> 8)
      0000D0 F5 3F            [12]  457 	mov	(_onScreenFanLevel + 1),a
                                    458 	.area GSFINAL (CODE)
      0000DB 02 00 1E         [24]  459 	ljmp	__sdcc_program_startup
                                    460 ;--------------------------------------------------------
                                    461 ; Home
                                    462 ;--------------------------------------------------------
                                    463 	.area HOME    (CODE)
                                    464 	.area HOME    (CODE)
      00001E                        465 __sdcc_program_startup:
      00001E 02 05 D4         [24]  466 	ljmp	_main
                                    467 ;	return from main will return to caller
                                    468 ;--------------------------------------------------------
                                    469 ; code
                                    470 ;--------------------------------------------------------
                                    471 	.area CSEG    (CODE)
                                    472 ;------------------------------------------------------------
                                    473 ;Allocation info for local variables in function 'startupScreen'
                                    474 ;------------------------------------------------------------
                                    475 ;i                         Allocated to registers r7 
                                    476 ;j                         Allocated to registers r6 
                                    477 ;delay_ms                  Allocated to registers 
                                    478 ;line_1                    Allocated with name '_startupScreen_line_1_65536_39'
                                    479 ;line_2                    Allocated with name '_startupScreen_line_2_65536_39'
                                    480 ;------------------------------------------------------------
                                    481 ;	src/screen/startupScreen.c:5: void startupScreen() {
                                    482 ;	-----------------------------------------
                                    483 ;	 function startupScreen
                                    484 ;	-----------------------------------------
      0000DE                        485 _startupScreen:
                           000007   486 	ar7 = 0x07
                           000006   487 	ar6 = 0x06
                           000005   488 	ar5 = 0x05
                           000004   489 	ar4 = 0x04
                           000003   490 	ar3 = 0x03
                           000002   491 	ar2 = 0x02
                           000001   492 	ar1 = 0x01
                           000000   493 	ar0 = 0x00
                                    494 ;	src/screen/startupScreen.c:8: xdata unsigned char line_1[] = "Welcome to AAUCS";
      0000DE 90 00 01         [24]  495 	mov	dptr,#_startupScreen_line_1_65536_39
      0000E1 74 57            [12]  496 	mov	a,#0x57
      0000E3 F0               [24]  497 	movx	@dptr,a
      0000E4 90 00 02         [24]  498 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0001)
      0000E7 74 65            [12]  499 	mov	a,#0x65
      0000E9 F0               [24]  500 	movx	@dptr,a
      0000EA 90 00 03         [24]  501 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0002)
      0000ED 74 6C            [12]  502 	mov	a,#0x6c
      0000EF F0               [24]  503 	movx	@dptr,a
      0000F0 90 00 04         [24]  504 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0003)
      0000F3 74 63            [12]  505 	mov	a,#0x63
      0000F5 F0               [24]  506 	movx	@dptr,a
      0000F6 90 00 05         [24]  507 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0004)
      0000F9 74 6F            [12]  508 	mov	a,#0x6f
      0000FB F0               [24]  509 	movx	@dptr,a
      0000FC 90 00 06         [24]  510 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0005)
      0000FF 74 6D            [12]  511 	mov	a,#0x6d
      000101 F0               [24]  512 	movx	@dptr,a
      000102 90 00 07         [24]  513 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0006)
      000105 74 65            [12]  514 	mov	a,#0x65
      000107 F0               [24]  515 	movx	@dptr,a
      000108 90 00 08         [24]  516 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0007)
      00010B 74 20            [12]  517 	mov	a,#0x20
      00010D F0               [24]  518 	movx	@dptr,a
      00010E 90 00 09         [24]  519 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0008)
      000111 74 74            [12]  520 	mov	a,#0x74
      000113 F0               [24]  521 	movx	@dptr,a
      000114 90 00 0A         [24]  522 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0009)
      000117 74 6F            [12]  523 	mov	a,#0x6f
      000119 F0               [24]  524 	movx	@dptr,a
      00011A 90 00 0B         [24]  525 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000a)
      00011D 74 20            [12]  526 	mov	a,#0x20
      00011F F0               [24]  527 	movx	@dptr,a
      000120 90 00 0C         [24]  528 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000b)
      000123 74 41            [12]  529 	mov	a,#0x41
      000125 F0               [24]  530 	movx	@dptr,a
      000126 90 00 0D         [24]  531 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000c)
      000129 F0               [24]  532 	movx	@dptr,a
      00012A 90 00 0E         [24]  533 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000d)
      00012D 74 55            [12]  534 	mov	a,#0x55
      00012F F0               [24]  535 	movx	@dptr,a
      000130 90 00 0F         [24]  536 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000e)
      000133 74 43            [12]  537 	mov	a,#0x43
      000135 F0               [24]  538 	movx	@dptr,a
      000136 90 00 10         [24]  539 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000f)
      000139 74 53            [12]  540 	mov	a,#0x53
      00013B F0               [24]  541 	movx	@dptr,a
      00013C 90 00 11         [24]  542 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x0010)
      00013F E4               [12]  543 	clr	a
      000140 F0               [24]  544 	movx	@dptr,a
                                    545 ;	src/screen/startupScreen.c:9: xdata unsigned char line_2[] = "     No. 31     ";
      000141 90 00 12         [24]  546 	mov	dptr,#_startupScreen_line_2_65536_39
      000144 74 20            [12]  547 	mov	a,#0x20
      000146 F0               [24]  548 	movx	@dptr,a
      000147 90 00 13         [24]  549 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0001)
      00014A F0               [24]  550 	movx	@dptr,a
      00014B 90 00 14         [24]  551 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0002)
      00014E F0               [24]  552 	movx	@dptr,a
      00014F 90 00 15         [24]  553 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0003)
      000152 F0               [24]  554 	movx	@dptr,a
      000153 90 00 16         [24]  555 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0004)
      000156 F0               [24]  556 	movx	@dptr,a
      000157 90 00 17         [24]  557 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0005)
      00015A 74 4E            [12]  558 	mov	a,#0x4e
      00015C F0               [24]  559 	movx	@dptr,a
      00015D 90 00 18         [24]  560 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0006)
      000160 74 6F            [12]  561 	mov	a,#0x6f
      000162 F0               [24]  562 	movx	@dptr,a
      000163 90 00 19         [24]  563 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0007)
      000166 74 2E            [12]  564 	mov	a,#0x2e
      000168 F0               [24]  565 	movx	@dptr,a
      000169 90 00 1A         [24]  566 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0008)
      00016C 74 20            [12]  567 	mov	a,#0x20
      00016E F0               [24]  568 	movx	@dptr,a
      00016F 90 00 1B         [24]  569 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0009)
      000172 74 33            [12]  570 	mov	a,#0x33
      000174 F0               [24]  571 	movx	@dptr,a
      000175 90 00 1C         [24]  572 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000a)
      000178 74 31            [12]  573 	mov	a,#0x31
      00017A F0               [24]  574 	movx	@dptr,a
      00017B 90 00 1D         [24]  575 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000b)
      00017E 74 20            [12]  576 	mov	a,#0x20
      000180 F0               [24]  577 	movx	@dptr,a
      000181 90 00 1E         [24]  578 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000c)
      000184 F0               [24]  579 	movx	@dptr,a
      000185 90 00 1F         [24]  580 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000d)
      000188 F0               [24]  581 	movx	@dptr,a
      000189 90 00 20         [24]  582 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000e)
      00018C F0               [24]  583 	movx	@dptr,a
      00018D 90 00 21         [24]  584 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000f)
      000190 F0               [24]  585 	movx	@dptr,a
      000191 90 00 22         [24]  586 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x0010)
      000194 E4               [12]  587 	clr	a
      000195 F0               [24]  588 	movx	@dptr,a
                                    589 ;	src/screen/startupScreen.c:11: for (i = 0; i < 16; i++) {
      000196 7F 00            [12]  590 	mov	r7,#0x00
      000198                        591 00106$:
                                    592 ;	src/screen/startupScreen.c:12: writeCharOnLCD1602(0, i, line_1[i]);
      000198 EF               [12]  593 	mov	a,r7
      000199 24 01            [12]  594 	add	a,#_startupScreen_line_1_65536_39
      00019B F5 82            [12]  595 	mov	dpl,a
      00019D E4               [12]  596 	clr	a
      00019E 34 00            [12]  597 	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
      0001A0 F5 83            [12]  598 	mov	dph,a
      0001A2 E0               [24]  599 	movx	a,@dptr
      0001A3 F5 09            [12]  600 	mov	_writeCharOnLCD1602_PARM_3,a
      0001A5 8F 08            [24]  601 	mov	_writeCharOnLCD1602_PARM_2,r7
      0001A7 75 82 00         [24]  602 	mov	dpl,#0x00
      0001AA C0 07            [24]  603 	push	ar7
      0001AC 12 06 BC         [24]  604 	lcall	_writeCharOnLCD1602
      0001AF D0 07            [24]  605 	pop	ar7
                                    606 ;	src/screen/startupScreen.c:13: if (i < 7) writeCharOnLCD1602(1, i+5, line_2[i+5]);
      0001B1 BF 07 00         [24]  607 	cjne	r7,#0x07,00141$
      0001B4                        608 00141$:
      0001B4 50 24            [24]  609 	jnc	00102$
      0001B6 8F 06            [24]  610 	mov	ar6,r7
      0001B8 74 05            [12]  611 	mov	a,#0x05
      0001BA 2E               [12]  612 	add	a,r6
      0001BB FE               [12]  613 	mov	r6,a
      0001BC FC               [12]  614 	mov	r4,a
      0001BD 33               [12]  615 	rlc	a
      0001BE 95 E0            [12]  616 	subb	a,acc
      0001C0 FD               [12]  617 	mov	r5,a
      0001C1 EC               [12]  618 	mov	a,r4
      0001C2 24 12            [12]  619 	add	a,#_startupScreen_line_2_65536_39
      0001C4 F5 82            [12]  620 	mov	dpl,a
      0001C6 ED               [12]  621 	mov	a,r5
      0001C7 34 00            [12]  622 	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
      0001C9 F5 83            [12]  623 	mov	dph,a
      0001CB E0               [24]  624 	movx	a,@dptr
      0001CC F5 09            [12]  625 	mov	_writeCharOnLCD1602_PARM_3,a
      0001CE 8E 08            [24]  626 	mov	_writeCharOnLCD1602_PARM_2,r6
      0001D0 75 82 01         [24]  627 	mov	dpl,#0x01
      0001D3 C0 07            [24]  628 	push	ar7
      0001D5 12 06 BC         [24]  629 	lcall	_writeCharOnLCD1602
      0001D8 D0 07            [24]  630 	pop	ar7
      0001DA                        631 00102$:
                                    632 ;	src/screen/startupScreen.c:14: delayOneMillisecond(delay_ms);
      0001DA 90 00 32         [24]  633 	mov	dptr,#0x0032
      0001DD C0 07            [24]  634 	push	ar7
      0001DF 12 07 1F         [24]  635 	lcall	_delayOneMillisecond
      0001E2 D0 07            [24]  636 	pop	ar7
                                    637 ;	src/screen/startupScreen.c:11: for (i = 0; i < 16; i++) {
      0001E4 0F               [12]  638 	inc	r7
      0001E5 BF 10 00         [24]  639 	cjne	r7,#0x10,00143$
      0001E8                        640 00143$:
      0001E8 40 AE            [24]  641 	jc	00106$
                                    642 ;	src/screen/startupScreen.c:16: delayOneSecond(1);
      0001EA 90 00 01         [24]  643 	mov	dptr,#0x0001
      0001ED 12 07 3C         [24]  644 	lcall	_delayOneSecond
                                    645 ;	src/screen/startupScreen.c:18: for (i = 0; i < 16; i++) {
      0001F0 7F 00            [12]  646 	mov	r7,#0x00
                                    647 ;	src/screen/startupScreen.c:20: for (j = 0; j < 16; j++) {
      0001F2                        648 00117$:
      0001F2 7E 00            [12]  649 	mov	r6,#0x00
      0001F4                        650 00108$:
                                    651 ;	src/screen/startupScreen.c:21: line_1[j] = line_1[j+1];
      0001F4 EE               [12]  652 	mov	a,r6
      0001F5 24 01            [12]  653 	add	a,#_startupScreen_line_1_65536_39
      0001F7 FC               [12]  654 	mov	r4,a
      0001F8 E4               [12]  655 	clr	a
      0001F9 34 00            [12]  656 	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
      0001FB FD               [12]  657 	mov	r5,a
      0001FC 8E 03            [24]  658 	mov	ar3,r6
      0001FE 0B               [12]  659 	inc	r3
      0001FF EB               [12]  660 	mov	a,r3
      000200 33               [12]  661 	rlc	a
      000201 95 E0            [12]  662 	subb	a,acc
      000203 FA               [12]  663 	mov	r2,a
      000204 EB               [12]  664 	mov	a,r3
      000205 24 01            [12]  665 	add	a,#_startupScreen_line_1_65536_39
      000207 F5 82            [12]  666 	mov	dpl,a
      000209 EA               [12]  667 	mov	a,r2
      00020A 34 00            [12]  668 	addc	a,#(_startupScreen_line_1_65536_39 >> 8)
      00020C F5 83            [12]  669 	mov	dph,a
      00020E E0               [24]  670 	movx	a,@dptr
      00020F 8C 82            [24]  671 	mov	dpl,r4
      000211 8D 83            [24]  672 	mov	dph,r5
      000213 F0               [24]  673 	movx	@dptr,a
                                    674 ;	src/screen/startupScreen.c:22: line_2[j] = line_2[j+1];
      000214 EE               [12]  675 	mov	a,r6
      000215 24 12            [12]  676 	add	a,#_startupScreen_line_2_65536_39
      000217 FC               [12]  677 	mov	r4,a
      000218 E4               [12]  678 	clr	a
      000219 34 00            [12]  679 	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
      00021B FD               [12]  680 	mov	r5,a
      00021C EB               [12]  681 	mov	a,r3
      00021D 24 12            [12]  682 	add	a,#_startupScreen_line_2_65536_39
      00021F F5 82            [12]  683 	mov	dpl,a
      000221 EA               [12]  684 	mov	a,r2
      000222 34 00            [12]  685 	addc	a,#(_startupScreen_line_2_65536_39 >> 8)
      000224 F5 83            [12]  686 	mov	dph,a
      000226 E0               [24]  687 	movx	a,@dptr
      000227 8C 82            [24]  688 	mov	dpl,r4
      000229 8D 83            [24]  689 	mov	dph,r5
      00022B F0               [24]  690 	movx	@dptr,a
                                    691 ;	src/screen/startupScreen.c:20: for (j = 0; j < 16; j++) {
      00022C 0E               [12]  692 	inc	r6
      00022D BE 10 00         [24]  693 	cjne	r6,#0x10,00145$
      000230                        694 00145$:
      000230 40 C2            [24]  695 	jc	00108$
                                    696 ;	src/screen/startupScreen.c:24: line_1[15] = ' ';
      000232 90 00 10         [24]  697 	mov	dptr,#(_startupScreen_line_1_65536_39 + 0x000f)
      000235 74 20            [12]  698 	mov	a,#0x20
      000237 F0               [24]  699 	movx	@dptr,a
                                    700 ;	src/screen/startupScreen.c:25: line_2[15] = ' ';
      000238 90 00 21         [24]  701 	mov	dptr,#(_startupScreen_line_2_65536_39 + 0x000f)
      00023B F0               [24]  702 	movx	@dptr,a
                                    703 ;	src/screen/startupScreen.c:27: putStringOnLCD1602(0, 0, line_1);
      00023C 75 0B 01         [24]  704 	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_1_65536_39
      00023F 75 0C 00         [24]  705 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_1_65536_39 >> 8)
      000242 75 0D 00         [24]  706 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      000245 75 0A 00         [24]  707 	mov	_putStringOnLCD1602_PARM_2,#0x00
      000248 75 82 00         [24]  708 	mov	dpl,#0x00
      00024B C0 07            [24]  709 	push	ar7
      00024D 12 06 D5         [24]  710 	lcall	_putStringOnLCD1602
                                    711 ;	src/screen/startupScreen.c:28: putStringOnLCD1602(1, 0, line_2);
      000250 75 0B 12         [24]  712 	mov	_putStringOnLCD1602_PARM_3,#_startupScreen_line_2_65536_39
      000253 75 0C 00         [24]  713 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_startupScreen_line_2_65536_39 >> 8)
      000256 75 0D 00         [24]  714 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      000259 75 0A 00         [24]  715 	mov	_putStringOnLCD1602_PARM_2,#0x00
      00025C 75 82 01         [24]  716 	mov	dpl,#0x01
      00025F 12 06 D5         [24]  717 	lcall	_putStringOnLCD1602
                                    718 ;	src/screen/startupScreen.c:29: delayOneMillisecond(delay_ms/2);
      000262 90 00 19         [24]  719 	mov	dptr,#0x0019
      000265 12 07 1F         [24]  720 	lcall	_delayOneMillisecond
      000268 D0 07            [24]  721 	pop	ar7
                                    722 ;	src/screen/startupScreen.c:18: for (i = 0; i < 16; i++) {
      00026A 0F               [12]  723 	inc	r7
      00026B BF 10 00         [24]  724 	cjne	r7,#0x10,00147$
      00026E                        725 00147$:
      00026E 50 03            [24]  726 	jnc	00148$
      000270 02 01 F2         [24]  727 	ljmp	00117$
      000273                        728 00148$:
                                    729 ;	src/screen/startupScreen.c:31: }
      000273 22               [24]  730 	ret
                                    731 ;------------------------------------------------------------
                                    732 ;Allocation info for local variables in function 'alartScreen'
                                    733 ;------------------------------------------------------------
                                    734 ;ms                        Allocated with name '_alartScreen_PARM_2'
                                    735 ;text                      Allocated to registers r5 r6 r7 
                                    736 ;cur                       Allocated to registers 
                                    737 ;------------------------------------------------------------
                                    738 ;	src/screen/alartScreen.c:4: void alartScreen(unsigned char text[], unsigned int ms) {
                                    739 ;	-----------------------------------------
                                    740 ;	 function alartScreen
                                    741 ;	-----------------------------------------
      000274                        742 _alartScreen:
      000274 AD 82            [24]  743 	mov	r5,dpl
      000276 AE 83            [24]  744 	mov	r6,dph
      000278 AF F0            [24]  745 	mov	r7,b
                                    746 ;	src/screen/alartScreen.c:7: clearLineInLCD1602(0);
      00027A 75 82 00         [24]  747 	mov	dpl,#0x00
      00027D C0 07            [24]  748 	push	ar7
      00027F C0 06            [24]  749 	push	ar6
      000281 C0 05            [24]  750 	push	ar5
      000283 12 06 98         [24]  751 	lcall	_clearLineInLCD1602
                                    752 ;	src/screen/alartScreen.c:8: clearLineInLCD1602(1);
      000286 75 82 01         [24]  753 	mov	dpl,#0x01
      000289 12 06 98         [24]  754 	lcall	_clearLineInLCD1602
      00028C D0 05            [24]  755 	pop	ar5
      00028E D0 06            [24]  756 	pop	ar6
      000290 D0 07            [24]  757 	pop	ar7
                                    758 ;	src/screen/alartScreen.c:12: putStringOnLCD1602(0, cur, text);
      000292 75 0A 03         [24]  759 	mov	_putStringOnLCD1602_PARM_2,#0x03
      000295 8D 0B            [24]  760 	mov	_putStringOnLCD1602_PARM_3,r5
      000297 8E 0C            [24]  761 	mov	(_putStringOnLCD1602_PARM_3 + 1),r6
      000299 8F 0D            [24]  762 	mov	(_putStringOnLCD1602_PARM_3 + 2),r7
      00029B 75 82 00         [24]  763 	mov	dpl,#0x00
      00029E 12 06 D5         [24]  764 	lcall	_putStringOnLCD1602
                                    765 ;	src/screen/alartScreen.c:13: delayOneMillisecond(ms);
      0002A1 85 21 82         [24]  766 	mov	dpl,_alartScreen_PARM_2
      0002A4 85 22 83         [24]  767 	mov	dph,(_alartScreen_PARM_2 + 1)
                                    768 ;	src/screen/alartScreen.c:14: }
      0002A7 02 07 1F         [24]  769 	ljmp	_delayOneMillisecond
                                    770 ;------------------------------------------------------------
                                    771 ;Allocation info for local variables in function 'settingScreen'
                                    772 ;------------------------------------------------------------
                                    773 ;blankspaceText            Allocated with name '_settingScreen_blankspaceText_65537_50'
                                    774 ;------------------------------------------------------------
                                    775 ;	src/screen/settingScreen.c:24: void settingScreen() {
                                    776 ;	-----------------------------------------
                                    777 ;	 function settingScreen
                                    778 ;	-----------------------------------------
      0002AA                        779 _settingScreen:
                                    780 ;	src/screen/settingScreen.c:25: while (!SETTING_BUTTON);    // 等待按键释放
      0002AA                        781 00101$:
      0002AA 30 B7 FD         [24]  782 	jnb	_P37,00101$
                                    783 ;	src/screen/settingScreen.c:26: alartScreen("Setting...", 300);
      0002AD 75 21 2C         [24]  784 	mov	_alartScreen_PARM_2,#0x2c
      0002B0 75 22 01         [24]  785 	mov	(_alartScreen_PARM_2 + 1),#0x01
      0002B3 90 17 36         [24]  786 	mov	dptr,#___str_3
      0002B6 75 F0 80         [24]  787 	mov	b,#0x80
      0002B9 12 02 74         [24]  788 	lcall	_alartScreen
                                    789 ;	src/screen/settingScreen.c:28: bit currentCursor=0, prevCursor=0;    // 当前/上一个光标位置，0表示控制最高温度，1表示控制最低温度
                                    790 ;	assignBit
      0002BC C2 00            [12]  791 	clr	_settingScreen_currentCursor_65537_50
                                    792 ;	assignBit
      0002BE C2 01            [12]  793 	clr	_settingScreen_prevCursor_65537_50
                                    794 ;	src/screen/settingScreen.c:29: bit splashState=0;  // 闪烁光标状态，0表示显示温度，1表示显示空格
                                    795 ;	assignBit
      0002C0 C2 02            [12]  796 	clr	_settingScreen_splashState_65537_50
                                    797 ;	src/screen/settingScreen.c:30: unsigned char blankspaceText[] = "   ";    // 空格
      0002C2 75 23 20         [24]  798 	mov	_settingScreen_blankspaceText_65537_50,#0x20
      0002C5 75 24 20         [24]  799 	mov	(_settingScreen_blankspaceText_65537_50 + 0x0001),#0x20
      0002C8 75 25 20         [24]  800 	mov	(_settingScreen_blankspaceText_65537_50 + 0x0002),#0x20
      0002CB 75 26 00         [24]  801 	mov	(_settingScreen_blankspaceText_65537_50 + 0x0003),#0x00
                                    802 ;	src/screen/settingScreen.c:33: while (APPLY_BUTTON) {
      0002CE                        803 00142$:
      0002CE 20 B4 03         [24]  804 	jb	_P34,00240$
      0002D1 02 04 59         [24]  805 	ljmp	00144$
      0002D4                        806 00240$:
                                    807 ;	src/screen/settingScreen.c:36: if (currentCursor != prevCursor) {
      0002D4 A2 00            [12]  808 	mov	c,_settingScreen_currentCursor_65537_50
      0002D6 20 01 01         [24]  809 	jb	_settingScreen_prevCursor_65537_50,00241$
      0002D9 B3               [12]  810 	cpl	c
      0002DA                        811 00241$:
      0002DA 40 16            [24]  812 	jc	00105$
                                    813 ;	src/screen/settingScreen.c:37: putStringOnLCD1602(0, 0, firstLine);
      0002DC 75 0B 23         [24]  814 	mov	_putStringOnLCD1602_PARM_3,#_firstLine
      0002DF 75 0C 00         [24]  815 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
      0002E2 75 0D 00         [24]  816 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      0002E5 75 0A 00         [24]  817 	mov	_putStringOnLCD1602_PARM_2,#0x00
      0002E8 75 82 00         [24]  818 	mov	dpl,#0x00
      0002EB 12 06 D5         [24]  819 	lcall	_putStringOnLCD1602
                                    820 ;	src/screen/settingScreen.c:38: prevCursor = currentCursor;
                                    821 ;	assignBit
      0002EE A2 00            [12]  822 	mov	c,_settingScreen_currentCursor_65537_50
      0002F0 92 01            [24]  823 	mov	_settingScreen_prevCursor_65537_50,c
      0002F2                        824 00105$:
                                    825 ;	src/screen/settingScreen.c:42: if (!SETTING_BUTTON) {
      0002F2 20 B7 05         [24]  826 	jb	_P37,00110$
                                    827 ;	src/screen/settingScreen.c:43: while (!SETTING_BUTTON);    // 等待按键释放
      0002F5                        828 00106$:
      0002F5 30 B7 FD         [24]  829 	jnb	_P37,00106$
                                    830 ;	src/screen/settingScreen.c:44: currentCursor = !currentCursor;
      0002F8 B2 00            [12]  831 	cpl	_settingScreen_currentCursor_65537_50
      0002FA                        832 00110$:
                                    833 ;	src/screen/settingScreen.c:48: if (!currentCursor) {   // 控制最高温度
      0002FA 30 00 03         [24]  834 	jnb	_settingScreen_currentCursor_65537_50,00245$
      0002FD 02 03 AD         [24]  835 	ljmp	00140$
      000300                        836 00245$:
                                    837 ;	src/screen/settingScreen.c:50: splashState--?putStringOnLCD1602(0, 2, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
                                    838 ;	assignBit
      000300 A2 02            [12]  839 	mov	c,_settingScreen_splashState_65537_50
      000302 92 03            [24]  840 	mov	_settingScreen_sloc0_1_0,c
      000304 A2 02            [12]  841 	mov	c,_settingScreen_splashState_65537_50
      000306 E4               [12]  842 	clr	a
      000307 33               [12]  843 	rlc	a
      000308 14               [12]  844 	dec	a
      000309 24 FF            [12]  845 	add	a,#0xff
      00030B 92 02            [24]  846 	mov	_settingScreen_splashState_65537_50,c
      00030D 30 03 14         [24]  847 	jnb	_settingScreen_sloc0_1_0,00147$
      000310 75 0B 23         [24]  848 	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65537_50
      000313 75 0C 00         [24]  849 	mov	(_putStringOnLCD1602_PARM_3 + 1),#0x00
      000316 75 0D 40         [24]  850 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x40
      000319 75 0A 02         [24]  851 	mov	_putStringOnLCD1602_PARM_2,#0x02
      00031C 75 82 00         [24]  852 	mov	dpl,#0x00
      00031F 12 06 D5         [24]  853 	lcall	_putStringOnLCD1602
      000322 80 12            [24]  854 	sjmp	00148$
      000324                        855 00147$:
      000324 75 0B 23         [24]  856 	mov	_putStringOnLCD1602_PARM_3,#_firstLine
      000327 75 0C 00         [24]  857 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
      00032A 75 0D 00         [24]  858 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      00032D 75 0A 00         [24]  859 	mov	_putStringOnLCD1602_PARM_2,#0x00
      000330 75 82 00         [24]  860 	mov	dpl,#0x00
      000333 12 06 D5         [24]  861 	lcall	_putStringOnLCD1602
      000336                        862 00148$:
                                    863 ;	src/screen/settingScreen.c:51: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最高温度（不超过128摄氏度）
      000336 20 B6 34         [24]  864 	jb	_P36,00117$
                                    865 ;	src/screen/settingScreen.c:52: while (!ADD_BUTTON);    // 等待按键释放
      000339                        866 00111$:
      000339 30 B6 FD         [24]  867 	jnb	_P36,00111$
                                    868 ;	src/screen/settingScreen.c:53: highestTemperature ++;
      00033C 05 34            [12]  869 	inc	_highestTemperature
      00033E E4               [12]  870 	clr	a
      00033F B5 34 02         [24]  871 	cjne	a,_highestTemperature,00249$
      000342 05 35            [12]  872 	inc	(_highestTemperature + 1)
      000344                        873 00249$:
                                    874 ;	src/screen/settingScreen.c:54: if (highestTemperature > 128) highestTemperature = 128;
      000344 C3               [12]  875 	clr	c
      000345 74 80            [12]  876 	mov	a,#0x80
      000347 95 34            [12]  877 	subb	a,_highestTemperature
      000349 74 80            [12]  878 	mov	a,#(0x00 ^ 0x80)
      00034B 85 35 F0         [24]  879 	mov	b,(_highestTemperature + 1)
      00034E 63 F0 80         [24]  880 	xrl	b,#0x80
      000351 95 F0            [12]  881 	subb	a,b
      000353 50 06            [24]  882 	jnc	00115$
      000355 75 34 80         [24]  883 	mov	_highestTemperature,#0x80
      000358 75 35 00         [24]  884 	mov	(_highestTemperature + 1),#0x00
      00035B                        885 00115$:
                                    886 ;	src/screen/settingScreen.c:56: floatToText(highestTemperature, onScreenHighestTemperature);
      00035B 85 38 65         [24]  887 	mov	_floatToText_PARM_2,_onScreenHighestTemperature
      00035E 85 39 66         [24]  888 	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
      000361 75 67 00         [24]  889 	mov	(_floatToText_PARM_2 + 2),#0x00
      000364 85 34 82         [24]  890 	mov	dpl,_highestTemperature
      000367 85 35 83         [24]  891 	mov	dph,(_highestTemperature + 1)
      00036A 12 10 EC         [24]  892 	lcall	_floatToText
      00036D                        893 00117$:
                                    894 ;	src/screen/settingScreen.c:58: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最高温度（不低于最低温度）
      00036D 30 B5 03         [24]  895 	jnb	_P35,00251$
      000370 02 04 50         [24]  896 	ljmp	00141$
      000373                        897 00251$:
                                    898 ;	src/screen/settingScreen.c:59: while (!SUB_BUTTON);    // 等待按键释放
      000373                        899 00118$:
      000373 30 B5 FD         [24]  900 	jnb	_P35,00118$
                                    901 ;	src/screen/settingScreen.c:60: highestTemperature --;
      000376 15 34            [12]  902 	dec	_highestTemperature
      000378 74 FF            [12]  903 	mov	a,#0xff
      00037A B5 34 02         [24]  904 	cjne	a,_highestTemperature,00253$
      00037D 15 35            [12]  905 	dec	(_highestTemperature + 1)
      00037F                        906 00253$:
                                    907 ;	src/screen/settingScreen.c:61: if (highestTemperature < lowestTemperature) highestTemperature = lowestTemperature;
      00037F C3               [12]  908 	clr	c
      000380 E5 34            [12]  909 	mov	a,_highestTemperature
      000382 95 36            [12]  910 	subb	a,_lowestTemperature
      000384 E5 35            [12]  911 	mov	a,(_highestTemperature + 1)
      000386 64 80            [12]  912 	xrl	a,#0x80
      000388 85 37 F0         [24]  913 	mov	b,(_lowestTemperature + 1)
      00038B 63 F0 80         [24]  914 	xrl	b,#0x80
      00038E 95 F0            [12]  915 	subb	a,b
      000390 50 06            [24]  916 	jnc	00122$
      000392 85 36 34         [24]  917 	mov	_highestTemperature,_lowestTemperature
      000395 85 37 35         [24]  918 	mov	(_highestTemperature + 1),(_lowestTemperature + 1)
      000398                        919 00122$:
                                    920 ;	src/screen/settingScreen.c:63: floatToText(highestTemperature, onScreenHighestTemperature);
      000398 85 38 65         [24]  921 	mov	_floatToText_PARM_2,_onScreenHighestTemperature
      00039B 85 39 66         [24]  922 	mov	(_floatToText_PARM_2 + 1),(_onScreenHighestTemperature + 1)
      00039E 75 67 00         [24]  923 	mov	(_floatToText_PARM_2 + 2),#0x00
      0003A1 85 34 82         [24]  924 	mov	dpl,_highestTemperature
      0003A4 85 35 83         [24]  925 	mov	dph,(_highestTemperature + 1)
      0003A7 12 10 EC         [24]  926 	lcall	_floatToText
      0003AA 02 04 50         [24]  927 	ljmp	00141$
      0003AD                        928 00140$:
                                    929 ;	src/screen/settingScreen.c:67: splashState--?putStringOnLCD1602(0, 11, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
                                    930 ;	assignBit
      0003AD A2 02            [12]  931 	mov	c,_settingScreen_splashState_65537_50
      0003AF 92 03            [24]  932 	mov	_settingScreen_sloc0_1_0,c
      0003B1 A2 02            [12]  933 	mov	c,_settingScreen_splashState_65537_50
      0003B3 E4               [12]  934 	clr	a
      0003B4 33               [12]  935 	rlc	a
      0003B5 14               [12]  936 	dec	a
      0003B6 24 FF            [12]  937 	add	a,#0xff
      0003B8 92 02            [24]  938 	mov	_settingScreen_splashState_65537_50,c
      0003BA 30 03 14         [24]  939 	jnb	_settingScreen_sloc0_1_0,00149$
      0003BD 75 0B 23         [24]  940 	mov	_putStringOnLCD1602_PARM_3,#_settingScreen_blankspaceText_65537_50
      0003C0 75 0C 00         [24]  941 	mov	(_putStringOnLCD1602_PARM_3 + 1),#0x00
      0003C3 75 0D 40         [24]  942 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x40
      0003C6 75 0A 0B         [24]  943 	mov	_putStringOnLCD1602_PARM_2,#0x0b
      0003C9 75 82 00         [24]  944 	mov	dpl,#0x00
      0003CC 12 06 D5         [24]  945 	lcall	_putStringOnLCD1602
      0003CF 80 12            [24]  946 	sjmp	00150$
      0003D1                        947 00149$:
      0003D1 75 0B 23         [24]  948 	mov	_putStringOnLCD1602_PARM_3,#_firstLine
      0003D4 75 0C 00         [24]  949 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
      0003D7 75 0D 00         [24]  950 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      0003DA 75 0A 00         [24]  951 	mov	_putStringOnLCD1602_PARM_2,#0x00
      0003DD 75 82 00         [24]  952 	mov	dpl,#0x00
      0003E0 12 06 D5         [24]  953 	lcall	_putStringOnLCD1602
      0003E3                        954 00150$:
                                    955 ;	src/screen/settingScreen.c:68: if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最低温度（不高于最高温度）
      0003E3 20 B6 36         [24]  956 	jb	_P36,00131$
                                    957 ;	src/screen/settingScreen.c:69: while (!ADD_BUTTON);    // 等待按键释放
      0003E6                        958 00125$:
      0003E6 30 B6 FD         [24]  959 	jnb	_P36,00125$
                                    960 ;	src/screen/settingScreen.c:70: lowestTemperature ++;
      0003E9 05 36            [12]  961 	inc	_lowestTemperature
      0003EB E4               [12]  962 	clr	a
      0003EC B5 36 02         [24]  963 	cjne	a,_lowestTemperature,00258$
      0003EF 05 37            [12]  964 	inc	(_lowestTemperature + 1)
      0003F1                        965 00258$:
                                    966 ;	src/screen/settingScreen.c:71: if (lowestTemperature > highestTemperature) lowestTemperature = highestTemperature;
      0003F1 C3               [12]  967 	clr	c
      0003F2 E5 34            [12]  968 	mov	a,_highestTemperature
      0003F4 95 36            [12]  969 	subb	a,_lowestTemperature
      0003F6 E5 35            [12]  970 	mov	a,(_highestTemperature + 1)
      0003F8 64 80            [12]  971 	xrl	a,#0x80
      0003FA 85 37 F0         [24]  972 	mov	b,(_lowestTemperature + 1)
      0003FD 63 F0 80         [24]  973 	xrl	b,#0x80
      000400 95 F0            [12]  974 	subb	a,b
      000402 50 06            [24]  975 	jnc	00129$
      000404 85 34 36         [24]  976 	mov	_lowestTemperature,_highestTemperature
      000407 85 35 37         [24]  977 	mov	(_lowestTemperature + 1),(_highestTemperature + 1)
      00040A                        978 00129$:
                                    979 ;	src/screen/settingScreen.c:73: floatToText(lowestTemperature, onScreenLowestTemperature);
      00040A 85 3A 65         [24]  980 	mov	_floatToText_PARM_2,_onScreenLowestTemperature
      00040D 85 3B 66         [24]  981 	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
      000410 75 67 00         [24]  982 	mov	(_floatToText_PARM_2 + 2),#0x00
      000413 85 36 82         [24]  983 	mov	dpl,_lowestTemperature
      000416 85 37 83         [24]  984 	mov	dph,(_lowestTemperature + 1)
      000419 12 10 EC         [24]  985 	lcall	_floatToText
      00041C                        986 00131$:
                                    987 ;	src/screen/settingScreen.c:75: if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最低温度（不低于-55摄氏度）
      00041C 20 B5 31         [24]  988 	jb	_P35,00141$
                                    989 ;	src/screen/settingScreen.c:76: while (!SUB_BUTTON);    // 等待按键释放
      00041F                        990 00132$:
      00041F 30 B5 FD         [24]  991 	jnb	_P35,00132$
                                    992 ;	src/screen/settingScreen.c:77: lowestTemperature --;
      000422 15 36            [12]  993 	dec	_lowestTemperature
      000424 74 FF            [12]  994 	mov	a,#0xff
      000426 B5 36 02         [24]  995 	cjne	a,_lowestTemperature,00262$
      000429 15 37            [12]  996 	dec	(_lowestTemperature + 1)
      00042B                        997 00262$:
                                    998 ;	src/screen/settingScreen.c:78: if (lowestTemperature < -55) lowestTemperature = -55;
      00042B C3               [12]  999 	clr	c
      00042C E5 36            [12] 1000 	mov	a,_lowestTemperature
      00042E 94 C9            [12] 1001 	subb	a,#0xc9
      000430 E5 37            [12] 1002 	mov	a,(_lowestTemperature + 1)
      000432 64 80            [12] 1003 	xrl	a,#0x80
      000434 94 7F            [12] 1004 	subb	a,#0x7f
      000436 50 06            [24] 1005 	jnc	00136$
      000438 75 36 C9         [24] 1006 	mov	_lowestTemperature,#0xc9
      00043B 75 37 FF         [24] 1007 	mov	(_lowestTemperature + 1),#0xff
      00043E                       1008 00136$:
                                   1009 ;	src/screen/settingScreen.c:80: floatToText(lowestTemperature, onScreenLowestTemperature);
      00043E 85 3A 65         [24] 1010 	mov	_floatToText_PARM_2,_onScreenLowestTemperature
      000441 85 3B 66         [24] 1011 	mov	(_floatToText_PARM_2 + 1),(_onScreenLowestTemperature + 1)
      000444 75 67 00         [24] 1012 	mov	(_floatToText_PARM_2 + 2),#0x00
      000447 85 36 82         [24] 1013 	mov	dpl,_lowestTemperature
      00044A 85 37 83         [24] 1014 	mov	dph,(_lowestTemperature + 1)
      00044D 12 10 EC         [24] 1015 	lcall	_floatToText
      000450                       1016 00141$:
                                   1017 ;	src/screen/settingScreen.c:83: delayOneMillisecond(300);
      000450 90 01 2C         [24] 1018 	mov	dptr,#0x012c
      000453 12 07 1F         [24] 1019 	lcall	_delayOneMillisecond
      000456 02 02 CE         [24] 1020 	ljmp	00142$
      000459                       1021 00144$:
                                   1022 ;	src/screen/settingScreen.c:87: alartScreen("Writing...", 300);
      000459 75 21 2C         [24] 1023 	mov	_alartScreen_PARM_2,#0x2c
      00045C 75 22 01         [24] 1024 	mov	(_alartScreen_PARM_2 + 1),#0x01
      00045F 90 17 41         [24] 1025 	mov	dptr,#___str_4
      000462 75 F0 80         [24] 1026 	mov	b,#0x80
      000465 12 02 74         [24] 1027 	lcall	_alartScreen
                                   1028 ;	src/screen/settingScreen.c:88: writeAT24C02(0x00, (unsigned char)(highestTemperature));
      000468 85 34 0E         [24] 1029 	mov	_writeAT24C02_PARM_2,_highestTemperature
      00046B 75 82 00         [24] 1030 	mov	dpl,#0x00
      00046E 12 0C A7         [24] 1031 	lcall	_writeAT24C02
                                   1032 ;	src/screen/settingScreen.c:89: writeAT24C02(0x01, (unsigned char)(lowestTemperature));
      000471 85 36 0E         [24] 1033 	mov	_writeAT24C02_PARM_2,_lowestTemperature
      000474 75 82 01         [24] 1034 	mov	dpl,#0x01
                                   1035 ;	src/screen/settingScreen.c:90: }
      000477 02 0C A7         [24] 1036 	ljmp	_writeAT24C02
                                   1037 ;------------------------------------------------------------
                                   1038 ;Allocation info for local variables in function 'mainScreen'
                                   1039 ;------------------------------------------------------------
                                   1040 ;temp                      Allocated to registers r6 r7 
                                   1041 ;------------------------------------------------------------
                                   1042 ;	src/screen/mainScreen.c:23: void mainScreen() {
                                   1043 ;	-----------------------------------------
                                   1044 ;	 function mainScreen
                                   1045 ;	-----------------------------------------
      00047A                       1046 _mainScreen:
                                   1047 ;	src/screen/mainScreen.c:25: prepareReadTemperature(readAT24C02(0x00), onScreenHighestTemperature, &highestTemperature);
      00047A 75 82 00         [24] 1048 	mov	dpl,#0x00
      00047D 12 0C CA         [24] 1049 	lcall	_readAT24C02
      000480 85 38 59         [24] 1050 	mov	_prepareReadTemperature_PARM_2,_onScreenHighestTemperature
      000483 85 39 5A         [24] 1051 	mov	(_prepareReadTemperature_PARM_2 + 1),(_onScreenHighestTemperature + 1)
      000486 75 5B 00         [24] 1052 	mov	(_prepareReadTemperature_PARM_2 + 2),#0x00
      000489 75 5C 34         [24] 1053 	mov	_prepareReadTemperature_PARM_3,#_highestTemperature
      00048C 75 5D 00         [24] 1054 	mov	(_prepareReadTemperature_PARM_3 + 1),#0x00
      00048F 75 5E 40         [24] 1055 	mov	(_prepareReadTemperature_PARM_3 + 2),#0x40
      000492 12 0E 56         [24] 1056 	lcall	_prepareReadTemperature
                                   1057 ;	src/screen/mainScreen.c:26: prepareReadTemperature(readAT24C02(0x01), onScreenLowestTemperature, &lowestTemperature);
      000495 75 82 01         [24] 1058 	mov	dpl,#0x01
      000498 12 0C CA         [24] 1059 	lcall	_readAT24C02
      00049B 85 3A 59         [24] 1060 	mov	_prepareReadTemperature_PARM_2,_onScreenLowestTemperature
      00049E 85 3B 5A         [24] 1061 	mov	(_prepareReadTemperature_PARM_2 + 1),(_onScreenLowestTemperature + 1)
      0004A1 75 5B 00         [24] 1062 	mov	(_prepareReadTemperature_PARM_2 + 2),#0x00
      0004A4 75 5C 36         [24] 1063 	mov	_prepareReadTemperature_PARM_3,#_lowestTemperature
      0004A7 75 5D 00         [24] 1064 	mov	(_prepareReadTemperature_PARM_3 + 1),#0x00
      0004AA 75 5E 40         [24] 1065 	mov	(_prepareReadTemperature_PARM_3 + 2),#0x40
      0004AD 12 0E 56         [24] 1066 	lcall	_prepareReadTemperature
                                   1067 ;	src/screen/mainScreen.c:28: getTemperatureOfDS18B20(onScreenCurrentTemperature, &currentTemperature);
      0004B0 AD 3C            [24] 1068 	mov	r5,_onScreenCurrentTemperature
      0004B2 AE 3D            [24] 1069 	mov	r6,(_onScreenCurrentTemperature + 1)
      0004B4 7F 00            [12] 1070 	mov	r7,#0x00
      0004B6 75 40 30         [24] 1071 	mov	_getTemperatureOfDS18B20_PARM_2,#_currentTemperature
                                   1072 ;	1-genFromRTrack replaced	mov	(_getTemperatureOfDS18B20_PARM_2 + 1),#0x00
      0004B9 8F 41            [24] 1073 	mov	(_getTemperatureOfDS18B20_PARM_2 + 1),r7
      0004BB 75 42 40         [24] 1074 	mov	(_getTemperatureOfDS18B20_PARM_2 + 2),#0x40
      0004BE 8D 82            [24] 1075 	mov	dpl,r5
      0004C0 8E 83            [24] 1076 	mov	dph,r6
      0004C2 8F F0            [24] 1077 	mov	b,r7
      0004C4 12 08 5E         [24] 1078 	lcall	_getTemperatureOfDS18B20
                                   1079 ;	src/screen/mainScreen.c:30: *onScreenFanLevel = (unsigned char)('0' + fanLevel);
      0004C7 85 3E 82         [24] 1080 	mov	dpl,_onScreenFanLevel
      0004CA 85 3F 83         [24] 1081 	mov	dph,(_onScreenFanLevel + 1)
      0004CD AF 2B            [24] 1082 	mov	r7,_fanLevel
      0004CF 74 30            [12] 1083 	mov	a,#0x30
      0004D1 2F               [12] 1084 	add	a,r7
      0004D2 F0               [24] 1085 	movx	@dptr,a
                                   1086 ;	src/screen/mainScreen.c:33: LED = !(currentTemperature < lowestTemperature);
      0004D3 85 36 82         [24] 1087 	mov	dpl,_lowestTemperature
      0004D6 85 37 83         [24] 1088 	mov	dph,(_lowestTemperature + 1)
      0004D9 12 14 1D         [24] 1089 	lcall	___sint2fs
      0004DC AC 82            [24] 1090 	mov	r4,dpl
      0004DE AD 83            [24] 1091 	mov	r5,dph
      0004E0 AE F0            [24] 1092 	mov	r6,b
      0004E2 FF               [12] 1093 	mov	r7,a
      0004E3 C0 04            [24] 1094 	push	ar4
      0004E5 C0 05            [24] 1095 	push	ar5
      0004E7 C0 06            [24] 1096 	push	ar6
      0004E9 C0 07            [24] 1097 	push	ar7
      0004EB 85 30 82         [24] 1098 	mov	dpl,_currentTemperature
      0004EE 85 31 83         [24] 1099 	mov	dph,(_currentTemperature + 1)
      0004F1 85 32 F0         [24] 1100 	mov	b,(_currentTemperature + 2)
      0004F4 E5 33            [12] 1101 	mov	a,(_currentTemperature + 3)
      0004F6 12 0E 09         [24] 1102 	lcall	___fslt
      0004F9 E5 81            [12] 1103 	mov	a,sp
      0004FB 24 FC            [12] 1104 	add	a,#0xfc
      0004FD F5 81            [12] 1105 	mov	sp,a
      0004FF E5 82            [12] 1106 	mov	a,dpl
      000501 24 FF            [12] 1107 	add	a,#0xff
      000503 B3               [12] 1108 	cpl	c
      000504 92 04            [24] 1109 	mov	_mainScreen_sloc0_1_0,c
      000506 E4               [12] 1110 	clr	a
      000507 33               [12] 1111 	rlc	a
      000508 24 FF            [12] 1112 	add	a,#0xff
      00050A 92 A0            [24] 1113 	mov	_P20,c
                                   1114 ;	src/screen/mainScreen.c:37: int temp = currentTemperature - highestTemperature;
      00050C 85 34 82         [24] 1115 	mov	dpl,_highestTemperature
      00050F 85 35 83         [24] 1116 	mov	dph,(_highestTemperature + 1)
      000512 12 14 1D         [24] 1117 	lcall	___sint2fs
      000515 AC 82            [24] 1118 	mov	r4,dpl
      000517 AD 83            [24] 1119 	mov	r5,dph
      000519 AE F0            [24] 1120 	mov	r6,b
      00051B FF               [12] 1121 	mov	r7,a
      00051C C0 04            [24] 1122 	push	ar4
      00051E C0 05            [24] 1123 	push	ar5
      000520 C0 06            [24] 1124 	push	ar6
      000522 C0 07            [24] 1125 	push	ar7
      000524 85 30 82         [24] 1126 	mov	dpl,_currentTemperature
      000527 85 31 83         [24] 1127 	mov	dph,(_currentTemperature + 1)
      00052A 85 32 F0         [24] 1128 	mov	b,(_currentTemperature + 2)
      00052D E5 33            [12] 1129 	mov	a,(_currentTemperature + 3)
      00052F 12 06 39         [24] 1130 	lcall	___fssub
      000532 AC 82            [24] 1131 	mov	r4,dpl
      000534 AD 83            [24] 1132 	mov	r5,dph
      000536 AE F0            [24] 1133 	mov	r6,b
      000538 FF               [12] 1134 	mov	r7,a
      000539 E5 81            [12] 1135 	mov	a,sp
      00053B 24 FC            [12] 1136 	add	a,#0xfc
      00053D F5 81            [12] 1137 	mov	sp,a
      00053F 8C 82            [24] 1138 	mov	dpl,r4
      000541 8D 83            [24] 1139 	mov	dph,r5
      000543 8E F0            [24] 1140 	mov	b,r6
      000545 EF               [12] 1141 	mov	a,r7
      000546 12 14 2A         [24] 1142 	lcall	___fs2sint
      000549 AE 82            [24] 1143 	mov	r6,dpl
      00054B AF 83            [24] 1144 	mov	r7,dph
                                   1145 ;	src/screen/mainScreen.c:38: if (temp >= 6) {
      00054D C3               [12] 1146 	clr	c
      00054E EE               [12] 1147 	mov	a,r6
      00054F 94 06            [12] 1148 	subb	a,#0x06
      000551 EF               [12] 1149 	mov	a,r7
      000552 64 80            [12] 1150 	xrl	a,#0x80
      000554 94 80            [12] 1151 	subb	a,#0x80
      000556 40 11            [24] 1152 	jc	00108$
                                   1153 ;	src/screen/mainScreen.c:39: fanLevel = 3;
      000558 75 2B 03         [24] 1154 	mov	_fanLevel,#0x03
                                   1155 ;	src/screen/mainScreen.c:40: fanState[0] = 1;
      00055B 75 2C 01         [24] 1156 	mov	_fanState,#0x01
                                   1157 ;	src/screen/mainScreen.c:41: fanState[1] = 1;
      00055E 75 2D 01         [24] 1158 	mov	(_fanState + 0x0001),#0x01
                                   1159 ;	src/screen/mainScreen.c:42: fanState[2] = 1;
      000561 75 2E 01         [24] 1160 	mov	(_fanState + 0x0002),#0x01
                                   1161 ;	src/screen/mainScreen.c:43: fanState[3] = 1;
      000564 75 2F 01         [24] 1162 	mov	(_fanState + 0x0003),#0x01
      000567 80 47            [24] 1163 	sjmp	00109$
      000569                       1164 00108$:
                                   1165 ;	src/screen/mainScreen.c:44: } else if (temp >= 4) {
      000569 C3               [12] 1166 	clr	c
      00056A EE               [12] 1167 	mov	a,r6
      00056B 94 04            [12] 1168 	subb	a,#0x04
      00056D EF               [12] 1169 	mov	a,r7
      00056E 64 80            [12] 1170 	xrl	a,#0x80
      000570 94 80            [12] 1171 	subb	a,#0x80
      000572 40 11            [24] 1172 	jc	00105$
                                   1173 ;	src/screen/mainScreen.c:45: fanLevel = 2;
      000574 75 2B 02         [24] 1174 	mov	_fanLevel,#0x02
                                   1175 ;	src/screen/mainScreen.c:46: fanState[0] = 1;
      000577 75 2C 01         [24] 1176 	mov	_fanState,#0x01
                                   1177 ;	src/screen/mainScreen.c:47: fanState[1] = 1;
      00057A 75 2D 01         [24] 1178 	mov	(_fanState + 0x0001),#0x01
                                   1179 ;	src/screen/mainScreen.c:48: fanState[2] = 1;
      00057D 75 2E 01         [24] 1180 	mov	(_fanState + 0x0002),#0x01
                                   1181 ;	src/screen/mainScreen.c:49: fanState[3] = 0;
      000580 75 2F 00         [24] 1182 	mov	(_fanState + 0x0003),#0x00
      000583 80 2B            [24] 1183 	sjmp	00109$
      000585                       1184 00105$:
                                   1185 ;	src/screen/mainScreen.c:50: } else if (temp >= 2) {
      000585 C3               [12] 1186 	clr	c
      000586 EE               [12] 1187 	mov	a,r6
      000587 94 02            [12] 1188 	subb	a,#0x02
      000589 EF               [12] 1189 	mov	a,r7
      00058A 64 80            [12] 1190 	xrl	a,#0x80
      00058C 94 80            [12] 1191 	subb	a,#0x80
      00058E 40 11            [24] 1192 	jc	00102$
                                   1193 ;	src/screen/mainScreen.c:51: fanLevel = 1;
      000590 75 2B 01         [24] 1194 	mov	_fanLevel,#0x01
                                   1195 ;	src/screen/mainScreen.c:52: fanState[0] = 1;
      000593 75 2C 01         [24] 1196 	mov	_fanState,#0x01
                                   1197 ;	src/screen/mainScreen.c:53: fanState[1] = 1;
      000596 75 2D 01         [24] 1198 	mov	(_fanState + 0x0001),#0x01
                                   1199 ;	src/screen/mainScreen.c:54: fanState[2] = 0;
      000599 75 2E 00         [24] 1200 	mov	(_fanState + 0x0002),#0x00
                                   1201 ;	src/screen/mainScreen.c:55: fanState[3] = 0;
      00059C 75 2F 00         [24] 1202 	mov	(_fanState + 0x0003),#0x00
      00059F 80 0F            [24] 1203 	sjmp	00109$
      0005A1                       1204 00102$:
                                   1205 ;	src/screen/mainScreen.c:57: fanLevel = 0;
      0005A1 75 2B 00         [24] 1206 	mov	_fanLevel,#0x00
                                   1207 ;	src/screen/mainScreen.c:58: fanState[0] = 0;
      0005A4 75 2C 00         [24] 1208 	mov	_fanState,#0x00
                                   1209 ;	src/screen/mainScreen.c:59: fanState[1] = 0;
      0005A7 75 2D 00         [24] 1210 	mov	(_fanState + 0x0001),#0x00
                                   1211 ;	src/screen/mainScreen.c:60: fanState[2] = 0;
      0005AA 75 2E 00         [24] 1212 	mov	(_fanState + 0x0002),#0x00
                                   1213 ;	src/screen/mainScreen.c:61: fanState[3] = 0;
      0005AD 75 2F 00         [24] 1214 	mov	(_fanState + 0x0003),#0x00
      0005B0                       1215 00109$:
                                   1216 ;	src/screen/mainScreen.c:65: putStringOnLCD1602(0, 0, firstLine);
      0005B0 75 0B 23         [24] 1217 	mov	_putStringOnLCD1602_PARM_3,#_firstLine
      0005B3 75 0C 00         [24] 1218 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_firstLine >> 8)
      0005B6 75 0D 00         [24] 1219 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      0005B9 75 0A 00         [24] 1220 	mov	_putStringOnLCD1602_PARM_2,#0x00
      0005BC 75 82 00         [24] 1221 	mov	dpl,#0x00
      0005BF 12 06 D5         [24] 1222 	lcall	_putStringOnLCD1602
                                   1223 ;	src/screen/mainScreen.c:66: putStringOnLCD1602(1, 0, secondLine);
      0005C2 75 0B 34         [24] 1224 	mov	_putStringOnLCD1602_PARM_3,#_secondLine
      0005C5 75 0C 00         [24] 1225 	mov	(_putStringOnLCD1602_PARM_3 + 1),#(_secondLine >> 8)
      0005C8 75 0D 00         [24] 1226 	mov	(_putStringOnLCD1602_PARM_3 + 2),#0x00
      0005CB 75 0A 00         [24] 1227 	mov	_putStringOnLCD1602_PARM_2,#0x00
      0005CE 75 82 01         [24] 1228 	mov	dpl,#0x01
                                   1229 ;	src/screen/mainScreen.c:67: }
      0005D1 02 06 D5         [24] 1230 	ljmp	_putStringOnLCD1602
                                   1231 ;------------------------------------------------------------
                                   1232 ;Allocation info for local variables in function 'main'
                                   1233 ;------------------------------------------------------------
                                   1234 ;	.\src\main.c:55: void main() {
                                   1235 ;	-----------------------------------------
                                   1236 ;	 function main
                                   1237 ;	-----------------------------------------
      0005D4                       1238 _main:
                                   1239 ;	.\src\main.c:56: initializeEverything();
      0005D4 12 12 92         [24] 1240 	lcall	_initializeEverything
                                   1241 ;	.\src\main.c:57: startupScreen();
      0005D7 12 00 DE         [24] 1242 	lcall	_startupScreen
                                   1243 ;	.\src\main.c:58: alartScreen("Starting...", 300);
      0005DA 75 21 2C         [24] 1244 	mov	_alartScreen_PARM_2,#0x2c
      0005DD 75 22 01         [24] 1245 	mov	(_alartScreen_PARM_2 + 1),#0x01
      0005E0 90 17 4C         [24] 1246 	mov	dptr,#___str_5
      0005E3 75 F0 80         [24] 1247 	mov	b,#0x80
      0005E6 12 02 74         [24] 1248 	lcall	_alartScreen
                                   1249 ;	.\src\main.c:60: while (1) {
      0005E9                       1250 00117$:
                                   1251 ;	.\src\main.c:63: if (!RST_BUTTON) {
      0005E9 20 B3 24         [24] 1252 	jb	_P33,00105$
                                   1253 ;	.\src\main.c:64: while (!RST_BUTTON);    // 等待按键释放
      0005EC                       1254 00101$:
      0005EC 30 B3 FD         [24] 1255 	jnb	_P33,00101$
                                   1256 ;	.\src\main.c:65: alartScreen("Resetting...", 300);
      0005EF 75 21 2C         [24] 1257 	mov	_alartScreen_PARM_2,#0x2c
      0005F2 75 22 01         [24] 1258 	mov	(_alartScreen_PARM_2 + 1),#0x01
      0005F5 90 17 58         [24] 1259 	mov	dptr,#___str_6
      0005F8 75 F0 80         [24] 1260 	mov	b,#0x80
      0005FB 12 02 74         [24] 1261 	lcall	_alartScreen
                                   1262 ;	.\src\main.c:66: writeAT24C02(0x00, (unsigned char)(22));
      0005FE 75 0E 16         [24] 1263 	mov	_writeAT24C02_PARM_2,#0x16
      000601 75 82 00         [24] 1264 	mov	dpl,#0x00
      000604 12 0C A7         [24] 1265 	lcall	_writeAT24C02
                                   1266 ;	.\src\main.c:67: writeAT24C02(0x01, (unsigned char)(20));
      000607 75 0E 14         [24] 1267 	mov	_writeAT24C02_PARM_2,#0x14
      00060A 75 82 01         [24] 1268 	mov	dpl,#0x01
      00060D 12 0C A7         [24] 1269 	lcall	_writeAT24C02
      000610                       1270 00105$:
                                   1271 ;	.\src\main.c:71: if (!DEBUG_BUTTON) {
      000610 20 B2 18         [24] 1272 	jb	_P32,00110$
                                   1273 ;	.\src\main.c:72: while (!DEBUG_BUTTON);    // 等待按键释放
      000613                       1274 00106$:
      000613 30 B2 FD         [24] 1275 	jnb	_P32,00106$
                                   1276 ;	.\src\main.c:73: alartScreen("Debugging...", 300);
      000616 75 21 2C         [24] 1277 	mov	_alartScreen_PARM_2,#0x2c
      000619 75 22 01         [24] 1278 	mov	(_alartScreen_PARM_2 + 1),#0x01
      00061C 90 17 65         [24] 1279 	mov	dptr,#___str_7
      00061F 75 F0 80         [24] 1280 	mov	b,#0x80
      000622 12 02 74         [24] 1281 	lcall	_alartScreen
                                   1282 ;	.\src\main.c:74: initializeBeeper();
      000625 12 0C FC         [24] 1283 	lcall	_initializeBeeper
                                   1284 ;	.\src\main.c:75: doBeep();
      000628 12 0D 61         [24] 1285 	lcall	_doBeep
      00062B                       1286 00110$:
                                   1287 ;	.\src\main.c:79: if (!SETTING_BUTTON) {
      00062B 20 B7 06         [24] 1288 	jb	_P37,00115$
                                   1289 ;	.\src\main.c:80: while (!SETTING_BUTTON);    // 等待按键释放
      00062E                       1290 00111$:
      00062E 30 B7 FD         [24] 1291 	jnb	_P37,00111$
                                   1292 ;	.\src\main.c:81: settingScreen();
      000631 12 02 AA         [24] 1293 	lcall	_settingScreen
      000634                       1294 00115$:
                                   1295 ;	.\src\main.c:85: mainScreen();
      000634 12 04 7A         [24] 1296 	lcall	_mainScreen
                                   1297 ;	.\src\main.c:90: }
      000637 80 B0            [24] 1298 	sjmp	00117$
                                   1299 	.area CSEG    (CODE)
                                   1300 	.area CONST   (CODE)
                                   1301 	.area CONST   (CODE)
      001736                       1302 ___str_3:
      001736 53 65 74 74 69 6E 67  1303 	.ascii "Setting..."
             2E 2E 2E
      001740 00                    1304 	.db 0x00
                                   1305 	.area CSEG    (CODE)
                                   1306 	.area CONST   (CODE)
      001741                       1307 ___str_4:
      001741 57 72 69 74 69 6E 67  1308 	.ascii "Writing..."
             2E 2E 2E
      00174B 00                    1309 	.db 0x00
                                   1310 	.area CSEG    (CODE)
                                   1311 	.area CONST   (CODE)
      00174C                       1312 ___str_5:
      00174C 53 74 61 72 74 69 6E  1313 	.ascii "Starting..."
             67 2E 2E 2E
      001757 00                    1314 	.db 0x00
                                   1315 	.area CSEG    (CODE)
                                   1316 	.area CONST   (CODE)
      001758                       1317 ___str_6:
      001758 52 65 73 65 74 74 69  1318 	.ascii "Resetting..."
             6E 67 2E 2E 2E
      001764 00                    1319 	.db 0x00
                                   1320 	.area CSEG    (CODE)
                                   1321 	.area CONST   (CODE)
      001765                       1322 ___str_7:
      001765 44 65 62 75 67 67 69  1323 	.ascii "Debugging..."
             6E 67 2E 2E 2E
      001771 00                    1324 	.db 0x00
                                   1325 	.area CSEG    (CODE)
                                   1326 	.area XINIT   (CODE)
      001772                       1327 __xinit__firstLine:
      001772 48                    1328 	.db #0x48	; 72	'H'
      001773 3A                    1329 	.db #0x3a	; 58
      001774 78                    1330 	.db #0x78	; 120	'x'
      001775 78                    1331 	.db #0x78	; 120	'x'
      001776 78                    1332 	.db #0x78	; 120	'x'
      001777 DF                    1333 	.db #0xdf	; 223
      001778 43                    1334 	.db #0x43	; 67	'C'
      001779 20                    1335 	.db #0x20	; 32
      00177A 20                    1336 	.db #0x20	; 32
      00177B 4C                    1337 	.db #0x4c	; 76	'L'
      00177C 3A                    1338 	.db #0x3a	; 58
      00177D 78                    1339 	.db #0x78	; 120	'x'
      00177E 78                    1340 	.db #0x78	; 120	'x'
      00177F 78                    1341 	.db #0x78	; 120	'x'
      001780 DF                    1342 	.db #0xdf	; 223
      001781 43                    1343 	.db #0x43	; 67	'C'
      001782 00                    1344 	.db #0x00	; 0
      001783                       1345 __xinit__secondLine:
      001783 54                    1346 	.db #0x54	; 84	'T'
      001784 3A                    1347 	.db #0x3a	; 58
      001785 78                    1348 	.db #0x78	; 120	'x'
      001786 78                    1349 	.db #0x78	; 120	'x'
      001787 78                    1350 	.db #0x78	; 120	'x'
      001788 2E                    1351 	.db #0x2e	; 46
      001789 78                    1352 	.db #0x78	; 120	'x'
      00178A DF                    1353 	.db #0xdf	; 223
      00178B 43                    1354 	.db #0x43	; 67	'C'
      00178C 20                    1355 	.db #0x20	; 32
      00178D 20                    1356 	.db #0x20	; 32
      00178E 46                    1357 	.db #0x46	; 70	'F'
      00178F 41                    1358 	.db #0x41	; 65	'A'
      001790 4E                    1359 	.db #0x4e	; 78	'N'
      001791 3A                    1360 	.db #0x3a	; 58
      001792 78                    1361 	.db #0x78	; 120	'x'
      001793 00                    1362 	.db #0x00	; 0
                                   1363 	.area CABS    (ABS,CODE)
