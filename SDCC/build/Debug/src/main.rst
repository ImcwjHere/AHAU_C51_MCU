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
                                     16 	.globl _initializeEverything
                                     17 	.globl _doBeep
                                     18 	.globl _initializeBeeper
                                     19 	.globl _writeAT24C02
                                     20 	.globl _CP_RL2
                                     21 	.globl _C_T2
                                     22 	.globl _TR2
                                     23 	.globl _EXEN2
                                     24 	.globl _TCLK
                                     25 	.globl _RCLK
                                     26 	.globl _EXF2
                                     27 	.globl _TF2
                                     28 	.globl _T2
                                     29 	.globl _T2EX
                                     30 	.globl _RI
                                     31 	.globl _TI
                                     32 	.globl _RB8
                                     33 	.globl _TB8
                                     34 	.globl _REN
                                     35 	.globl _SM2
                                     36 	.globl _SM1
                                     37 	.globl _SM0
                                     38 	.globl _RXD
                                     39 	.globl _TXD
                                     40 	.globl _INT0
                                     41 	.globl _INT1
                                     42 	.globl _T0
                                     43 	.globl _T1
                                     44 	.globl _WR
                                     45 	.globl _RD
                                     46 	.globl _PX0
                                     47 	.globl _PT0
                                     48 	.globl _PX1
                                     49 	.globl _PT1
                                     50 	.globl _PS
                                     51 	.globl _PT2
                                     52 	.globl _EX0
                                     53 	.globl _ET0
                                     54 	.globl _EX1
                                     55 	.globl _ET1
                                     56 	.globl _ES
                                     57 	.globl _ET2
                                     58 	.globl _EA
                                     59 	.globl _IT0
                                     60 	.globl _IE0
                                     61 	.globl _IT1
                                     62 	.globl _IE1
                                     63 	.globl _TR0
                                     64 	.globl _TF0
                                     65 	.globl _TR1
                                     66 	.globl _TF1
                                     67 	.globl _P
                                     68 	.globl _OV
                                     69 	.globl _RS0
                                     70 	.globl _RS1
                                     71 	.globl _F0
                                     72 	.globl _AC
                                     73 	.globl _CY
                                     74 	.globl _P37
                                     75 	.globl _P36
                                     76 	.globl _P35
                                     77 	.globl _P34
                                     78 	.globl _P33
                                     79 	.globl _P32
                                     80 	.globl _P31
                                     81 	.globl _P30
                                     82 	.globl _P27
                                     83 	.globl _P26
                                     84 	.globl _P25
                                     85 	.globl _P24
                                     86 	.globl _P23
                                     87 	.globl _P22
                                     88 	.globl _P21
                                     89 	.globl _P20
                                     90 	.globl _P17
                                     91 	.globl _P16
                                     92 	.globl _P15
                                     93 	.globl _P14
                                     94 	.globl _P13
                                     95 	.globl _P12
                                     96 	.globl _P11
                                     97 	.globl _P10
                                     98 	.globl _P07
                                     99 	.globl _P06
                                    100 	.globl _P05
                                    101 	.globl _P04
                                    102 	.globl _P03
                                    103 	.globl _P02
                                    104 	.globl _P01
                                    105 	.globl _P00
                                    106 	.globl _TH2
                                    107 	.globl _TL2
                                    108 	.globl _RCAP2H
                                    109 	.globl _RCAP2L
                                    110 	.globl _T2CON
                                    111 	.globl _SBUF
                                    112 	.globl _SCON
                                    113 	.globl _IP
                                    114 	.globl _IE
                                    115 	.globl _TH1
                                    116 	.globl _TH0
                                    117 	.globl _TL1
                                    118 	.globl _TL0
                                    119 	.globl _TMOD
                                    120 	.globl _TCON
                                    121 	.globl _PCON
                                    122 	.globl _DPH
                                    123 	.globl _DPL
                                    124 	.globl _SP
                                    125 	.globl _B
                                    126 	.globl _ACC
                                    127 	.globl _PSW
                                    128 	.globl _P3
                                    129 	.globl _P2
                                    130 	.globl _P1
                                    131 	.globl _P0
                                    132 	.globl _secondLine
                                    133 	.globl _firstLine
                                    134 	.globl _onScreenFanLevel
                                    135 	.globl _onScreenCurrentTemperature
                                    136 	.globl _onScreenLowestTemperature
                                    137 	.globl _onScreenHighestTemperature
                                    138 	.globl _lowestTemperature
                                    139 	.globl _highestTemperature
                                    140 	.globl _currentTemperature
                                    141 	.globl _fanState
                                    142 	.globl _fanLevel
                                    143 	.globl _TL_INIT
                                    144 	.globl _TH_INIT
                                    145 ;--------------------------------------------------------
                                    146 ; special function registers
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0	=	0x0080
                           000090   151 _P1	=	0x0090
                           0000A0   152 _P2	=	0x00a0
                           0000B0   153 _P3	=	0x00b0
                           0000D0   154 _PSW	=	0x00d0
                           0000E0   155 _ACC	=	0x00e0
                           0000F0   156 _B	=	0x00f0
                           000081   157 _SP	=	0x0081
                           000082   158 _DPL	=	0x0082
                           000083   159 _DPH	=	0x0083
                           000087   160 _PCON	=	0x0087
                           000088   161 _TCON	=	0x0088
                           000089   162 _TMOD	=	0x0089
                           00008A   163 _TL0	=	0x008a
                           00008B   164 _TL1	=	0x008b
                           00008C   165 _TH0	=	0x008c
                           00008D   166 _TH1	=	0x008d
                           0000A8   167 _IE	=	0x00a8
                           0000B8   168 _IP	=	0x00b8
                           000098   169 _SCON	=	0x0098
                           000099   170 _SBUF	=	0x0099
                           0000C8   171 _T2CON	=	0x00c8
                           0000CA   172 _RCAP2L	=	0x00ca
                           0000CB   173 _RCAP2H	=	0x00cb
                           0000CC   174 _TL2	=	0x00cc
                           0000CD   175 _TH2	=	0x00cd
                                    176 ;--------------------------------------------------------
                                    177 ; special function bits
                                    178 ;--------------------------------------------------------
                                    179 	.area RSEG    (ABS,DATA)
      000000                        180 	.org 0x0000
                           000080   181 _P00	=	0x0080
                           000081   182 _P01	=	0x0081
                           000082   183 _P02	=	0x0082
                           000083   184 _P03	=	0x0083
                           000084   185 _P04	=	0x0084
                           000085   186 _P05	=	0x0085
                           000086   187 _P06	=	0x0086
                           000087   188 _P07	=	0x0087
                           000090   189 _P10	=	0x0090
                           000091   190 _P11	=	0x0091
                           000092   191 _P12	=	0x0092
                           000093   192 _P13	=	0x0093
                           000094   193 _P14	=	0x0094
                           000095   194 _P15	=	0x0095
                           000096   195 _P16	=	0x0096
                           000097   196 _P17	=	0x0097
                           0000A0   197 _P20	=	0x00a0
                           0000A1   198 _P21	=	0x00a1
                           0000A2   199 _P22	=	0x00a2
                           0000A3   200 _P23	=	0x00a3
                           0000A4   201 _P24	=	0x00a4
                           0000A5   202 _P25	=	0x00a5
                           0000A6   203 _P26	=	0x00a6
                           0000A7   204 _P27	=	0x00a7
                           0000B0   205 _P30	=	0x00b0
                           0000B1   206 _P31	=	0x00b1
                           0000B2   207 _P32	=	0x00b2
                           0000B3   208 _P33	=	0x00b3
                           0000B4   209 _P34	=	0x00b4
                           0000B5   210 _P35	=	0x00b5
                           0000B6   211 _P36	=	0x00b6
                           0000B7   212 _P37	=	0x00b7
                           0000D7   213 _CY	=	0x00d7
                           0000D6   214 _AC	=	0x00d6
                           0000D5   215 _F0	=	0x00d5
                           0000D4   216 _RS1	=	0x00d4
                           0000D3   217 _RS0	=	0x00d3
                           0000D2   218 _OV	=	0x00d2
                           0000D0   219 _P	=	0x00d0
                           00008F   220 _TF1	=	0x008f
                           00008E   221 _TR1	=	0x008e
                           00008D   222 _TF0	=	0x008d
                           00008C   223 _TR0	=	0x008c
                           00008B   224 _IE1	=	0x008b
                           00008A   225 _IT1	=	0x008a
                           000089   226 _IE0	=	0x0089
                           000088   227 _IT0	=	0x0088
                           0000AF   228 _EA	=	0x00af
                           0000AD   229 _ET2	=	0x00ad
                           0000AC   230 _ES	=	0x00ac
                           0000AB   231 _ET1	=	0x00ab
                           0000AA   232 _EX1	=	0x00aa
                           0000A9   233 _ET0	=	0x00a9
                           0000A8   234 _EX0	=	0x00a8
                           0000BD   235 _PT2	=	0x00bd
                           0000BC   236 _PS	=	0x00bc
                           0000BB   237 _PT1	=	0x00bb
                           0000BA   238 _PX1	=	0x00ba
                           0000B9   239 _PT0	=	0x00b9
                           0000B8   240 _PX0	=	0x00b8
                           0000B7   241 _RD	=	0x00b7
                           0000B6   242 _WR	=	0x00b6
                           0000B5   243 _T1	=	0x00b5
                           0000B4   244 _T0	=	0x00b4
                           0000B3   245 _INT1	=	0x00b3
                           0000B2   246 _INT0	=	0x00b2
                           0000B1   247 _TXD	=	0x00b1
                           0000B0   248 _RXD	=	0x00b0
                           00009F   249 _SM0	=	0x009f
                           00009E   250 _SM1	=	0x009e
                           00009D   251 _SM2	=	0x009d
                           00009C   252 _REN	=	0x009c
                           00009B   253 _TB8	=	0x009b
                           00009A   254 _RB8	=	0x009a
                           000099   255 _TI	=	0x0099
                           000098   256 _RI	=	0x0098
                           000091   257 _T2EX	=	0x0091
                           000090   258 _T2	=	0x0090
                           0000CF   259 _TF2	=	0x00cf
                           0000CE   260 _EXF2	=	0x00ce
                           0000CD   261 _RCLK	=	0x00cd
                           0000CC   262 _TCLK	=	0x00cc
                           0000CB   263 _EXEN2	=	0x00cb
                           0000CA   264 _TR2	=	0x00ca
                           0000C9   265 _C_T2	=	0x00c9
                           0000C8   266 _CP_RL2	=	0x00c8
                                    267 ;--------------------------------------------------------
                                    268 ; overlayable register banks
                                    269 ;--------------------------------------------------------
                                    270 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        271 	.ds 8
                                    272 ;--------------------------------------------------------
                                    273 ; internal ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area DSEG    (DATA)
      000021                        276 _TH_INIT::
      000021                        277 	.ds 2
      000023                        278 _TL_INIT::
      000023                        279 	.ds 2
      000025                        280 _fanLevel::
      000025                        281 	.ds 1
      000026                        282 _fanState::
      000026                        283 	.ds 4
      00002A                        284 _currentTemperature::
      00002A                        285 	.ds 4
      00002E                        286 _highestTemperature::
      00002E                        287 	.ds 2
      000030                        288 _lowestTemperature::
      000030                        289 	.ds 2
      000032                        290 _onScreenHighestTemperature::
      000032                        291 	.ds 2
      000034                        292 _onScreenLowestTemperature::
      000034                        293 	.ds 2
      000036                        294 _onScreenCurrentTemperature::
      000036                        295 	.ds 2
      000038                        296 _onScreenFanLevel::
      000038                        297 	.ds 2
                                    298 ;--------------------------------------------------------
                                    299 ; overlayable items in internal ram
                                    300 ;--------------------------------------------------------
                                    301 ;--------------------------------------------------------
                                    302 ; Stack segment in internal ram
                                    303 ;--------------------------------------------------------
                                    304 	.area	SSEG
      000064                        305 __start__stack:
      000064                        306 	.ds	1
                                    307 
                                    308 ;--------------------------------------------------------
                                    309 ; indirectly addressable internal ram data
                                    310 ;--------------------------------------------------------
                                    311 	.area ISEG    (DATA)
                                    312 ;--------------------------------------------------------
                                    313 ; absolute internal ram data
                                    314 ;--------------------------------------------------------
                                    315 	.area IABS    (ABS,DATA)
                                    316 	.area IABS    (ABS,DATA)
                                    317 ;--------------------------------------------------------
                                    318 ; bit data
                                    319 ;--------------------------------------------------------
                                    320 	.area BSEG    (BIT)
                                    321 ;--------------------------------------------------------
                                    322 ; paged external ram data
                                    323 ;--------------------------------------------------------
                                    324 	.area PSEG    (PAG,XDATA)
                                    325 ;--------------------------------------------------------
                                    326 ; external ram data
                                    327 ;--------------------------------------------------------
                                    328 	.area XSEG    (XDATA)
                                    329 ;--------------------------------------------------------
                                    330 ; absolute external ram data
                                    331 ;--------------------------------------------------------
                                    332 	.area XABS    (ABS,XDATA)
                                    333 ;--------------------------------------------------------
                                    334 ; external initialized ram data
                                    335 ;--------------------------------------------------------
                                    336 	.area XISEG   (XDATA)
      000023                        337 _firstLine::
      000023                        338 	.ds 17
      000034                        339 _secondLine::
      000034                        340 	.ds 17
                                    341 	.area HOME    (CODE)
                                    342 	.area GSINIT0 (CODE)
                                    343 	.area GSINIT1 (CODE)
                                    344 	.area GSINIT2 (CODE)
                                    345 	.area GSINIT3 (CODE)
                                    346 	.area GSINIT4 (CODE)
                                    347 	.area GSINIT5 (CODE)
                                    348 	.area GSINIT  (CODE)
                                    349 	.area GSFINAL (CODE)
                                    350 	.area CSEG    (CODE)
                                    351 ;--------------------------------------------------------
                                    352 ; interrupt vector
                                    353 ;--------------------------------------------------------
                                    354 	.area HOME    (CODE)
      000000                        355 __interrupt_vect:
      000000 02 00 06         [24]  356 	ljmp	__sdcc_gsinit_startup
                                    357 ;--------------------------------------------------------
                                    358 ; global & static initialisations
                                    359 ;--------------------------------------------------------
                                    360 	.area HOME    (CODE)
                                    361 	.area GSINIT  (CODE)
                                    362 	.area GSFINAL (CODE)
                                    363 	.area GSINIT  (CODE)
                                    364 	.globl __sdcc_gsinit_startup
                                    365 	.globl __sdcc_program_startup
                                    366 	.globl __start__stack
                                    367 	.globl __mcs51_genXINIT
                                    368 	.globl __mcs51_genXRAMCLEAR
                                    369 	.globl __mcs51_genRAMCLEAR
                                    370 ;	.\src\main.c:54: int TH_INIT = 0x8E; // 定时器高位初值
      00005F 75 21 8E         [24]  371 	mov	_TH_INIT,#0x8e
      000062 75 22 00         [24]  372 	mov	(_TH_INIT + 1),#0x00
                                    373 ;	.\src\main.c:55: int TL_INIT = 0x8E; // 定时器低位初值
      000065 75 23 8E         [24]  374 	mov	_TL_INIT,#0x8e
      000068 75 24 00         [24]  375 	mov	(_TL_INIT + 1),#0x00
                                    376 ;	.\src\main.c:57: unsigned char fanLevel = 0; // 风扇档位
      00006B 75 25 00         [24]  377 	mov	_fanLevel,#0x00
                                    378 ;	.\src\main.c:59: unsigned char fanState[4] = {0, 0, 0, 0}; // 风扇状态数组
      00006E 75 26 00         [24]  379 	mov	_fanState,#0x00
      000071 75 27 00         [24]  380 	mov	(_fanState + 0x0001),#0x00
      000074 75 28 00         [24]  381 	mov	(_fanState + 0x0002),#0x00
      000077 75 29 00         [24]  382 	mov	(_fanState + 0x0003),#0x00
                                    383 ;	.\src\main.c:61: float currentTemperature = 0.0; // 当前温度
      00007A E4               [12]  384 	clr	a
      00007B F5 2A            [12]  385 	mov	_currentTemperature,a
      00007D F5 2B            [12]  386 	mov	(_currentTemperature + 1),a
      00007F F5 2C            [12]  387 	mov	(_currentTemperature + 2),a
      000081 F5 2D            [12]  388 	mov	(_currentTemperature + 3),a
                                    389 ;	.\src\main.c:63: int highestTemperature = 0;
      000083 F5 2E            [12]  390 	mov	_highestTemperature,a
      000085 F5 2F            [12]  391 	mov	(_highestTemperature + 1),a
                                    392 ;	.\src\main.c:65: int lowestTemperature = 0;
      000087 F5 30            [12]  393 	mov	_lowestTemperature,a
      000089 F5 31            [12]  394 	mov	(_lowestTemperature + 1),a
                                    395 ;	.\src\main.c:71: xdata unsigned char *onScreenHighestTemperature = &firstLine[2];
      00008B 74 02            [12]  396 	mov	a,#0x02
      00008D 24 23            [12]  397 	add	a,#_firstLine
      00008F F5 32            [12]  398 	mov	_onScreenHighestTemperature,a
      000091 E4               [12]  399 	clr	a
      000092 34 00            [12]  400 	addc	a,#(_firstLine >> 8)
      000094 F5 33            [12]  401 	mov	(_onScreenHighestTemperature + 1),a
                                    402 ;	.\src\main.c:73: xdata unsigned char *onScreenLowestTemperature = &firstLine[11];
      000096 74 0B            [12]  403 	mov	a,#0x0b
      000098 24 23            [12]  404 	add	a,#_firstLine
      00009A F5 34            [12]  405 	mov	_onScreenLowestTemperature,a
      00009C E4               [12]  406 	clr	a
      00009D 34 00            [12]  407 	addc	a,#(_firstLine >> 8)
      00009F F5 35            [12]  408 	mov	(_onScreenLowestTemperature + 1),a
                                    409 ;	.\src\main.c:75: xdata unsigned char *onScreenCurrentTemperature = &secondLine[2];
      0000A1 74 02            [12]  410 	mov	a,#0x02
      0000A3 24 34            [12]  411 	add	a,#_secondLine
      0000A5 F5 36            [12]  412 	mov	_onScreenCurrentTemperature,a
      0000A7 E4               [12]  413 	clr	a
      0000A8 34 00            [12]  414 	addc	a,#(_secondLine >> 8)
      0000AA F5 37            [12]  415 	mov	(_onScreenCurrentTemperature + 1),a
                                    416 ;	.\src\main.c:77: xdata unsigned char *onScreenFanLevel = &secondLine[15];
      0000AC 74 0F            [12]  417 	mov	a,#0x0f
      0000AE 24 34            [12]  418 	add	a,#_secondLine
      0000B0 F5 38            [12]  419 	mov	_onScreenFanLevel,a
      0000B2 E4               [12]  420 	clr	a
      0000B3 34 00            [12]  421 	addc	a,#(_secondLine >> 8)
      0000B5 F5 39            [12]  422 	mov	(_onScreenFanLevel + 1),a
                                    423 	.area GSFINAL (CODE)
      0000C0 02 00 03         [24]  424 	ljmp	__sdcc_program_startup
                                    425 ;--------------------------------------------------------
                                    426 ; Home
                                    427 ;--------------------------------------------------------
                                    428 	.area HOME    (CODE)
                                    429 	.area HOME    (CODE)
      000003                        430 __sdcc_program_startup:
      000003 02 00 C3         [24]  431 	ljmp	_main
                                    432 ;	return from main will return to caller
                                    433 ;--------------------------------------------------------
                                    434 ; code
                                    435 ;--------------------------------------------------------
                                    436 	.area CSEG    (CODE)
                                    437 ;------------------------------------------------------------
                                    438 ;Allocation info for local variables in function 'main'
                                    439 ;------------------------------------------------------------
                                    440 ;	.\src\main.c:80: void main() {
                                    441 ;	-----------------------------------------
                                    442 ;	 function main
                                    443 ;	-----------------------------------------
      0000C3                        444 _main:
                           000007   445 	ar7 = 0x07
                           000006   446 	ar6 = 0x06
                           000005   447 	ar5 = 0x05
                           000004   448 	ar4 = 0x04
                           000003   449 	ar3 = 0x03
                           000002   450 	ar2 = 0x02
                           000001   451 	ar1 = 0x01
                           000000   452 	ar0 = 0x00
                                    453 ;	.\src\main.c:82: initializeEverything();
      0000C3 12 10 78         [24]  454 	lcall	_initializeEverything
                                    455 ;	.\src\main.c:83: startupScreen();
      0000C6 12 01 6B         [24]  456 	lcall	_startupScreen
                                    457 ;	.\src\main.c:84: alartScreen("Starting...");
      0000C9 90 16 E4         [24]  458 	mov	dptr,#___str_0
      0000CC 75 F0 80         [24]  459 	mov	b,#0x80
      0000CF 12 03 01         [24]  460 	lcall	_alartScreen
                                    461 ;	.\src\main.c:86: while (1) {
      0000D2                        462 00117$:
                                    463 ;	.\src\main.c:89: if (!RST_BUTTON) {
      0000D2 20 B3 1E         [24]  464 	jb	_P33,00105$
                                    465 ;	.\src\main.c:90: while (!RST_BUTTON);    // 等待按键释放
      0000D5                        466 00101$:
      0000D5 30 B3 FD         [24]  467 	jnb	_P33,00101$
                                    468 ;	.\src\main.c:91: alartScreen("Resetting...");
      0000D8 90 16 F0         [24]  469 	mov	dptr,#___str_1
      0000DB 75 F0 80         [24]  470 	mov	b,#0x80
      0000DE 12 03 01         [24]  471 	lcall	_alartScreen
                                    472 ;	.\src\main.c:92: writeAT24C02(0x00, (unsigned char)(22));
      0000E1 75 08 16         [24]  473 	mov	_writeAT24C02_PARM_2,#0x16
      0000E4 75 82 00         [24]  474 	mov	dpl,#0x00
      0000E7 12 01 16         [24]  475 	lcall	_writeAT24C02
                                    476 ;	.\src\main.c:93: writeAT24C02(0x01, (unsigned char)(20));
      0000EA 75 08 14         [24]  477 	mov	_writeAT24C02_PARM_2,#0x14
      0000ED 75 82 01         [24]  478 	mov	dpl,#0x01
      0000F0 12 01 16         [24]  479 	lcall	_writeAT24C02
      0000F3                        480 00105$:
                                    481 ;	.\src\main.c:97: if (!DEBUG_BUTTON) {
      0000F3 20 B2 12         [24]  482 	jb	_P32,00110$
                                    483 ;	.\src\main.c:98: while (!DEBUG_BUTTON);    // 等待按键释放
      0000F6                        484 00106$:
      0000F6 30 B2 FD         [24]  485 	jnb	_P32,00106$
                                    486 ;	.\src\main.c:99: alartScreen("Debugging...");
      0000F9 90 16 FD         [24]  487 	mov	dptr,#___str_2
      0000FC 75 F0 80         [24]  488 	mov	b,#0x80
      0000FF 12 03 01         [24]  489 	lcall	_alartScreen
                                    490 ;	.\src\main.c:100: initializeBeeper();
      000102 12 05 CD         [24]  491 	lcall	_initializeBeeper
                                    492 ;	.\src\main.c:101: doBeep();
      000105 12 06 32         [24]  493 	lcall	_doBeep
      000108                        494 00110$:
                                    495 ;	.\src\main.c:105: if (!SETTING_BUTTON) {
      000108 20 B7 06         [24]  496 	jb	_P37,00115$
                                    497 ;	.\src\main.c:106: while (!SETTING_BUTTON);    // 等待按键释放
      00010B                        498 00111$:
      00010B 30 B7 FD         [24]  499 	jnb	_P37,00111$
                                    500 ;	.\src\main.c:107: settingScreen();
      00010E 12 11 23         [24]  501 	lcall	_settingScreen
      000111                        502 00115$:
                                    503 ;	.\src\main.c:111: mainScreen();
      000111 12 04 73         [24]  504 	lcall	_mainScreen
                                    505 ;	.\src\main.c:116: }
      000114 80 BC            [24]  506 	sjmp	00117$
                                    507 	.area CSEG    (CODE)
                                    508 	.area CONST   (CODE)
                                    509 	.area CONST   (CODE)
      0016E4                        510 ___str_0:
      0016E4 53 74 61 72 74 69 6E   511 	.ascii "Starting..."
             67 2E 2E 2E
      0016EF 00                     512 	.db 0x00
                                    513 	.area CSEG    (CODE)
                                    514 	.area CONST   (CODE)
      0016F0                        515 ___str_1:
      0016F0 52 65 73 65 74 74 69   516 	.ascii "Resetting..."
             6E 67 2E 2E 2E
      0016FC 00                     517 	.db 0x00
                                    518 	.area CSEG    (CODE)
                                    519 	.area CONST   (CODE)
      0016FD                        520 ___str_2:
      0016FD 44 65 62 75 67 67 69   521 	.ascii "Debugging..."
             6E 67 2E 2E 2E
      001709 00                     522 	.db 0x00
                                    523 	.area CSEG    (CODE)
                                    524 	.area XINIT   (CODE)
      001720                        525 __xinit__firstLine:
      001720 48                     526 	.db #0x48	; 72	'H'
      001721 3A                     527 	.db #0x3a	; 58
      001722 78                     528 	.db #0x78	; 120	'x'
      001723 78                     529 	.db #0x78	; 120	'x'
      001724 78                     530 	.db #0x78	; 120	'x'
      001725 DF                     531 	.db #0xdf	; 223
      001726 43                     532 	.db #0x43	; 67	'C'
      001727 20                     533 	.db #0x20	; 32
      001728 20                     534 	.db #0x20	; 32
      001729 4C                     535 	.db #0x4c	; 76	'L'
      00172A 3A                     536 	.db #0x3a	; 58
      00172B 78                     537 	.db #0x78	; 120	'x'
      00172C 78                     538 	.db #0x78	; 120	'x'
      00172D 78                     539 	.db #0x78	; 120	'x'
      00172E DF                     540 	.db #0xdf	; 223
      00172F 43                     541 	.db #0x43	; 67	'C'
      001730 00                     542 	.db #0x00	; 0
      001731                        543 __xinit__secondLine:
      001731 54                     544 	.db #0x54	; 84	'T'
      001732 3A                     545 	.db #0x3a	; 58
      001733 78                     546 	.db #0x78	; 120	'x'
      001734 78                     547 	.db #0x78	; 120	'x'
      001735 78                     548 	.db #0x78	; 120	'x'
      001736 2E                     549 	.db #0x2e	; 46
      001737 78                     550 	.db #0x78	; 120	'x'
      001738 DF                     551 	.db #0xdf	; 223
      001739 43                     552 	.db #0x43	; 67	'C'
      00173A 20                     553 	.db #0x20	; 32
      00173B 20                     554 	.db #0x20	; 32
      00173C 46                     555 	.db #0x46	; 70	'F'
      00173D 41                     556 	.db #0x41	; 65	'A'
      00173E 4E                     557 	.db #0x4e	; 78	'N'
      00173F 3A                     558 	.db #0x3a	; 58
      001740 78                     559 	.db #0x78	; 120	'x'
      001741 00                     560 	.db #0x00	; 0
                                    561 	.area CABS    (ABS,CODE)
