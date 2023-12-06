;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module DS18B20
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delayTenMicroseconds
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
	.globl _getTemperatureOfDS18B20_PARM_2
	.globl _initializeDS18B20
	.globl _writeByteToDS18B20
	.globl _readByteFromDS18B20
	.globl _changeTemperatureCommandOfDS18B20
	.globl _readTemperatureCommandOfDS18B20
	.globl _readTemperatureOfDS18B20
	.globl _getTemperatureOfDS18B20
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
_getTemperatureOfDS18B20_PARM_2:
	.ds 3
_getTemperatureOfDS18B20_buf_65536_28:
	.ds 3
_getTemperatureOfDS18B20_sloc0_1_0:
	.ds 3
_getTemperatureOfDS18B20_sloc1_1_0:
	.ds 3
_getTemperatureOfDS18B20_sloc2_1_0:
	.ds 2
_getTemperatureOfDS18B20_sloc3_1_0:
	.ds 4
_getTemperatureOfDS18B20_sloc4_1_0:
	.ds 3
_getTemperatureOfDS18B20_sloc5_1_0:
	.ds 4
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
;Allocation info for local variables in function 'initializeDS18B20'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:5: unsigned char initializeDS18B20(void) {
;	-----------------------------------------
;	 function initializeDS18B20
;	-----------------------------------------
_initializeDS18B20:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\src\utils\DS18B20.c:8: DSPORT = 0;	//将总线拉低480us~960us
;	assignBit
	clr	_P15
;	.\src\utils\DS18B20.c:9: delayTenMicroseconds(64);	//延时642us
	mov	dptr,#0x0040
	lcall	_delayTenMicroseconds
;	.\src\utils\DS18B20.c:11: DSPORT = 1;	//然后拉高总线，如果DS18B20做出反应会将在15us~60us后总线拉低
;	assignBit
	setb	_P15
;	.\src\utils\DS18B20.c:13: while(DSPORT) {	//等待DS18B20拉低总线
	mov	r6,#0x00
	mov	r7,#0x00
00103$:
	jnb	_P15,00105$
;	.\src\utils\DS18B20.c:14: i ++;
	inc	r6
	cjne	r6,#0x00,00121$
	inc	r7
00121$:
;	.\src\utils\DS18B20.c:15: delayOneMillisecond(1);
	mov	dptr,#0x0001
	push	ar7
	push	ar6
	lcall	_delayOneMillisecond
	pop	ar6
	pop	ar7
;	.\src\utils\DS18B20.c:16: if(i > 5) return 0;	//等待>5MS, 则初始化失败
	clr	c
	mov	a,#0x05
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00103$
	mov	dpl,#0x00
	ret
00105$:
;	.\src\utils\DS18B20.c:19: return 1;	//初始化成功
	mov	dpl,#0x01
;	.\src\utils\DS18B20.c:20: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeByteToDS18B20'
;------------------------------------------------------------
;dat                       Allocated to registers r7 
;i                         Allocated to registers r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:23: void writeByteToDS18B20(unsigned char dat) {
;	-----------------------------------------
;	 function writeByteToDS18B20
;	-----------------------------------------
_writeByteToDS18B20:
	mov	r7,dpl
;	.\src\utils\DS18B20.c:26: for(j = 0;j < 8;j ++) {
	mov	r5,#0x00
	mov	r6,#0x00
00105$:
;	.\src\utils\DS18B20.c:27: DSPORT = 0;	//每写入一位数据之前先把总线拉低1us
;	assignBit
	clr	_P15
;	.\src\utils\DS18B20.c:29: DSPORT = dat & 0x01;	//然后写入一个数据，从最低位开始
	mov	a,r7
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P15,c
;	.\src\utils\DS18B20.c:32: while(i --);	//延时68us，持续时间最少60us
	mov	r3,#0x06
	mov	r4,#0x00
00101$:
	mov	ar1,r3
	mov	ar2,r4
	dec	r3
	cjne	r3,#0xff,00123$
	dec	r4
00123$:
	mov	a,r1
	orl	a,r2
	jnz	00101$
;	.\src\utils\DS18B20.c:34: DSPORT = 1;	//然后释放总线，至少1us给总线恢复时间才能接着写入第二个数值
;	assignBit
	setb	_P15
;	.\src\utils\DS18B20.c:35: dat >>= 1;
	mov	a,r7
	clr	c
	rrc	a
	mov	r7,a
;	.\src\utils\DS18B20.c:26: for(j = 0;j < 8;j ++) {
	inc	r5
	cjne	r5,#0x00,00125$
	inc	r6
00125$:
	clr	c
	mov	a,r5
	subb	a,#0x08
	mov	a,r6
	subb	a,#0x00
	jc	00105$
;	.\src\utils\DS18B20.c:37: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readByteFromDS18B20'
;------------------------------------------------------------
;byte                      Allocated to registers r7 
;bi                        Allocated to registers r4 
;i                         Allocated to registers r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:40: unsigned char readByteFromDS18B20(void) {
;	-----------------------------------------
;	 function readByteFromDS18B20
;	-----------------------------------------
_readByteFromDS18B20:
;	.\src\utils\DS18B20.c:41: unsigned char byte=0, bi=0;
	mov	r7,#0x00
;	.\src\utils\DS18B20.c:44: for(j = 8;j > 0;j --) {
	mov	r5,#0x08
	mov	r6,#0x00
00105$:
;	.\src\utils\DS18B20.c:45: DSPORT = 0;	//先将总线拉低1us
;	assignBit
	clr	_P15
;	.\src\utils\DS18B20.c:47: DSPORT = 1;	//然后释放总线
;	assignBit
	setb	_P15
;	.\src\utils\DS18B20.c:50: bi = DSPORT;	//读取数据，从最低位开始读取
	mov	c,_P15
	clr	a
	rlc	a
	mov	r4,a
;	.\src\utils\DS18B20.c:51: byte = (byte >> 1) | (bi << 7);	// 将byte左移一位，然后与上右移7位后的bi，注意移动之后移掉那位补0
	mov	a,r7
	clr	c
	rrc	a
	mov	r3,a
	mov	a,r4
	rr	a
	anl	a,#0x80
	orl	a,r3
	mov	r7,a
;	.\src\utils\DS18B20.c:53: while(i --);
	mov	r3,#0x04
	mov	r4,#0x00
00101$:
	mov	ar1,r3
	mov	ar2,r4
	dec	r3
	cjne	r3,#0xff,00129$
	dec	r4
00129$:
	mov	a,r1
	orl	a,r2
	jnz	00101$
;	.\src\utils\DS18B20.c:44: for(j = 8;j > 0;j --) {
	dec	r5
	cjne	r5,#0xff,00131$
	dec	r6
00131$:
	mov	a,r5
	orl	a,r6
	jnz	00105$
;	.\src\utils\DS18B20.c:56: return byte;
	mov	dpl,r7
;	.\src\utils\DS18B20.c:57: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'changeTemperatureCommandOfDS18B20'
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:60: void changeTemperatureCommandOfDS18B20(void) {
;	-----------------------------------------
;	 function changeTemperatureCommandOfDS18B20
;	-----------------------------------------
_changeTemperatureCommandOfDS18B20:
;	.\src\utils\DS18B20.c:61: initializeDS18B20();
	lcall	_initializeDS18B20
;	.\src\utils\DS18B20.c:62: delayOneMillisecond(1);
	mov	dptr,#0x0001
	lcall	_delayOneMillisecond
;	.\src\utils\DS18B20.c:63: writeByteToDS18B20(0xcc);	//跳过ROM操作命令		 
	mov	dpl,#0xcc
	lcall	_writeByteToDS18B20
;	.\src\utils\DS18B20.c:64: writeByteToDS18B20(0x44);	//温度转换命令
	mov	dpl,#0x44
;	.\src\utils\DS18B20.c:65: }
	ljmp	_writeByteToDS18B20
;------------------------------------------------------------
;Allocation info for local variables in function 'readTemperatureCommandOfDS18B20'
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:68: void readTemperatureCommandOfDS18B20(void)
;	-----------------------------------------
;	 function readTemperatureCommandOfDS18B20
;	-----------------------------------------
_readTemperatureCommandOfDS18B20:
;	.\src\utils\DS18B20.c:70: initializeDS18B20();
	lcall	_initializeDS18B20
;	.\src\utils\DS18B20.c:71: delayOneMillisecond(1);
	mov	dptr,#0x0001
	lcall	_delayOneMillisecond
;	.\src\utils\DS18B20.c:72: writeByteToDS18B20(0xCC);	//跳过ROM操作命令
	mov	dpl,#0xcc
	lcall	_writeByteToDS18B20
;	.\src\utils\DS18B20.c:73: writeByteToDS18B20(0xBE);	//发送读取温度命令
	mov	dpl,#0xbe
;	.\src\utils\DS18B20.c:74: }
	ljmp	_writeByteToDS18B20
;------------------------------------------------------------
;Allocation info for local variables in function 'readTemperatureOfDS18B20'
;------------------------------------------------------------
;temp                      Allocated to registers r6 r5 
;tmh                       Allocated to registers r6 
;tml                       Allocated to registers r7 
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:78: int readTemperatureOfDS18B20(void) {
;	-----------------------------------------
;	 function readTemperatureOfDS18B20
;	-----------------------------------------
_readTemperatureOfDS18B20:
;	.\src\utils\DS18B20.c:82: changeTemperatureCommandOfDS18B20();	//先写入转换命令
	lcall	_changeTemperatureCommandOfDS18B20
;	.\src\utils\DS18B20.c:83: readTemperatureCommandOfDS18B20();	//然后等待转换完后发送读取温度命令
	lcall	_readTemperatureCommandOfDS18B20
;	.\src\utils\DS18B20.c:84: tml = readByteFromDS18B20();	//读取温度值共16位，先读低字节
	lcall	_readByteFromDS18B20
	mov	r7,dpl
;	.\src\utils\DS18B20.c:85: tmh = readByteFromDS18B20();	//再读高字节
	push	ar7
	lcall	_readByteFromDS18B20
	mov	r6,dpl
	pop	ar7
;	.\src\utils\DS18B20.c:86: temp = tmh;
;	.\src\utils\DS18B20.c:87: temp <<= 8;
	mov	ar5,r6
;	.\src\utils\DS18B20.c:88: temp |= tml;
	clr	a
	mov	r6,a
	mov	r4,a
	mov	a,r7
	orl	a,r6
	mov	dpl,a
	mov	a,r4
	orl	a,r5
	mov	dph,a
;	.\src\utils\DS18B20.c:90: return temp;
;	.\src\utils\DS18B20.c:91: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getTemperatureOfDS18B20'
;------------------------------------------------------------
;temperature               Allocated with name '_getTemperatureOfDS18B20_PARM_2'
;buf                       Allocated with name '_getTemperatureOfDS18B20_buf_65536_28'
;temp                      Allocated to registers 
;tp                        Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_getTemperatureOfDS18B20_sloc0_1_0'
;sloc1                     Allocated with name '_getTemperatureOfDS18B20_sloc1_1_0'
;sloc2                     Allocated with name '_getTemperatureOfDS18B20_sloc2_1_0'
;sloc3                     Allocated with name '_getTemperatureOfDS18B20_sloc3_1_0'
;sloc4                     Allocated with name '_getTemperatureOfDS18B20_sloc4_1_0'
;sloc5                     Allocated with name '_getTemperatureOfDS18B20_sloc5_1_0'
;------------------------------------------------------------
;	.\src\utils\DS18B20.c:93: void getTemperatureOfDS18B20(unsigned char * buf, float * temperature) {
;	-----------------------------------------
;	 function getTemperatureOfDS18B20
;	-----------------------------------------
_getTemperatureOfDS18B20:
	mov	_getTemperatureOfDS18B20_buf_65536_28,dpl
	mov	(_getTemperatureOfDS18B20_buf_65536_28 + 1),dph
	mov	(_getTemperatureOfDS18B20_buf_65536_28 + 2),b
;	.\src\utils\DS18B20.c:96: temp = readTemperatureOfDS18B20();
	lcall	_readTemperatureOfDS18B20
	mov	r3,dpl
;	.\src\utils\DS18B20.c:97: if (temp < 0) {    // 当温度值为负数
	mov	a,dph
	mov	r4,a
	jnb	acc.7,00102$
;	.\src\utils\DS18B20.c:98: buf[0] = '-';    //   -
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	a,#0x2d
	lcall	__gptrput
;	.\src\utils\DS18B20.c:100: temp = temp - 1;
	mov	a,r3
	add	a,#0xff
	mov	r1,a
	mov	a,r4
	addc	a,#0xff
	mov	r2,a
;	.\src\utils\DS18B20.c:101: temp = ~temp;
	mov	a,r1
	cpl	a
	mov	dpl,a
	mov	a,r2
	cpl	a
	mov	dph,a
;	.\src\utils\DS18B20.c:102: tp = temp;
	lcall	___sint2fs
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r7,a
;	.\src\utils\DS18B20.c:103: temp = tp * 0.0625 * 100 + 0.5;
	push	ar0
	push	ar1
	push	ar2
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0xc8
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x3f
	push	acc
	mov	dpl,r2
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2sint
	mov	r6,dpl
	mov	r7,dph
	ljmp	00103$
00102$:
;	.\src\utils\DS18B20.c:108: tp = temp;  //因为数据处理有小数点所以将温度赋给一个浮点型变量
	mov	dpl,r3
	mov	dph,r4
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	.\src\utils\DS18B20.c:110: temp = tp * 0.0625 * 100 + 0.5;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xc8
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x3f
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
;	.\src\utils\DS18B20.c:114: buf[0] = (temp / 10000) + '0';
	mov	r6,dpl
	mov	r7,dph
	mov	__divsint_PARM_2,#0x10
	mov	(__divsint_PARM_2 + 1),#0x27
	push	ar7
	push	ar6
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r4
	mov	r4,a
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrput
00103$:
;	.\src\utils\DS18B20.c:116: buf[1] = (temp % 10000 / 1000) + '0';
	mov	a,#0x01
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	_getTemperatureOfDS18B20_sloc4_1_0,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	(_getTemperatureOfDS18B20_sloc4_1_0 + 1),a
	mov	(_getTemperatureOfDS18B20_sloc4_1_0 + 2),(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	__modsint_PARM_2,#0x10
	mov	(__modsint_PARM_2 + 1),#0x27
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	lcall	__modsint
	mov	__divsint_PARM_2,#0xe8
	mov	(__divsint_PARM_2 + 1),#0x03
	lcall	__divsint
	mov	r1,dpl
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r1
	mov	dpl,_getTemperatureOfDS18B20_sloc4_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc4_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc4_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\DS18B20.c:117: buf[2] = (temp % 1000 / 100) + '0';
	mov	a,#0x02
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	_getTemperatureOfDS18B20_sloc0_1_0,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	(_getTemperatureOfDS18B20_sloc0_1_0 + 1),a
	mov	(_getTemperatureOfDS18B20_sloc0_1_0 + 2),(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	__modsint_PARM_2,#0xe8
	mov	(__modsint_PARM_2 + 1),#0x03
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	lcall	__modsint
	mov	__divsint_PARM_2,#0x64
	mov	(__divsint_PARM_2 + 1),#0x00
	lcall	__divsint
	mov	r1,dpl
	pop	ar6
	pop	ar7
	mov	a,#0x30
	add	a,r1
	mov	dpl,_getTemperatureOfDS18B20_sloc0_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc0_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc0_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\DS18B20.c:118: buf[3] = '.';
	mov	a,#0x03
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	r0,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	r1,a
	mov	r2,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,#0x2e
	lcall	__gptrput
;	.\src\utils\DS18B20.c:119: buf[4] = (temp % 100 / 10) + '0';
	mov	a,#0x04
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	_getTemperatureOfDS18B20_sloc1_1_0,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	(_getTemperatureOfDS18B20_sloc1_1_0 + 1),a
	mov	(_getTemperatureOfDS18B20_sloc1_1_0 + 2),(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	__modsint_PARM_2,#0x64
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	__modsint
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	lcall	__divsint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	dpl,_getTemperatureOfDS18B20_sloc1_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc1_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc1_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\DS18B20.c:120: buf[5] = 0xDF;
	mov	a,#0x05
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	r2,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	r6,a
	mov	r7,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	mov	a,#0xdf
	lcall	__gptrput
;	.\src\utils\DS18B20.c:121: buf[6] = 'C';
	mov	a,#0x06
	add	a,_getTemperatureOfDS18B20_buf_65536_28
	mov	r2,a
	clr	a
	addc	a,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	r6,a
	mov	r7,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	mov	a,#0x43
	lcall	__gptrput
;	.\src\utils\DS18B20.c:124: if (buf[0] == '-') {
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x2d,00141$
	sjmp	00142$
00141$:
	ljmp	00105$
00142$:
;	.\src\utils\DS18B20.c:125: tp = (float)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1));
	mov	dpl,_getTemperatureOfDS18B20_sloc4_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc4_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc4_1_0 + 2)
	lcall	__gptrget
	mov	r6,#0x00
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r6
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000a
	lcall	__mulint
	mov	r6,dpl
	mov	r7,dph
	mov	dpl,_getTemperatureOfDS18B20_sloc0_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc0_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r2,#0x00
	add	a,#0xd0
	mov	r1,a
	mov	a,r2
	addc	a,#0xff
	mov	r2,a
	mov	a,r1
	add	a,r6
	mov	_getTemperatureOfDS18B20_sloc2_1_0,a
	mov	a,r2
	addc	a,r7
	mov	(_getTemperatureOfDS18B20_sloc2_1_0 + 1),a
	mov	dpl,_getTemperatureOfDS18B20_sloc1_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc1_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r2,#0x00
	add	a,#0xd0
	mov	dpl,a
	mov	a,r2
	addc	a,#0xff
	mov	dph,a
	lcall	___sint2fs
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar2
	push	ar7
	mov	dptr,#0xcccd
	mov	b,#0xcc
	mov	a,#0x3d
	lcall	___fsmul
	mov	_getTemperatureOfDS18B20_sloc3_1_0,dpl
	mov	(_getTemperatureOfDS18B20_sloc3_1_0 + 1),dph
	mov	(_getTemperatureOfDS18B20_sloc3_1_0 + 2),b
	mov	(_getTemperatureOfDS18B20_sloc3_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_getTemperatureOfDS18B20_sloc2_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc2_1_0 + 1)
	lcall	___sint2fs
	mov	r0,dpl
	mov	r2,dph
	mov	r6,b
	mov	r7,a
	push	_getTemperatureOfDS18B20_sloc3_1_0
	push	(_getTemperatureOfDS18B20_sloc3_1_0 + 1)
	push	(_getTemperatureOfDS18B20_sloc3_1_0 + 2)
	push	(_getTemperatureOfDS18B20_sloc3_1_0 + 3)
	mov	dpl,r0
	mov	dph,r2
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r1,dpl
	mov	r2,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r7
	cpl	acc.7
	mov	r7,a
	ljmp	00106$
00105$:
;	.\src\utils\DS18B20.c:127: tp = (float)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1);
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r5,#0x00
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r5
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x0064
	lcall	__mulint
	mov	r4,dpl
	mov	r5,dph
	mov	dpl,_getTemperatureOfDS18B20_sloc4_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc4_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc4_1_0 + 2)
	lcall	__gptrget
	mov	r3,#0x00
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r3
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000a
	push	ar5
	push	ar4
	lcall	__mulint
	mov	r0,dpl
	mov	r3,dph
	pop	ar4
	pop	ar5
	mov	a,r0
	add	a,r4
	mov	r4,a
	mov	a,r3
	addc	a,r5
	mov	r5,a
	mov	dpl,_getTemperatureOfDS18B20_sloc0_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc0_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r3,#0x00
	add	a,#0xd0
	mov	r0,a
	mov	a,r3
	addc	a,#0xff
	mov	r3,a
	mov	a,r0
	add	a,r4
	mov	_getTemperatureOfDS18B20_sloc3_1_0,a
	mov	a,r3
	addc	a,r5
	mov	(_getTemperatureOfDS18B20_sloc3_1_0 + 1),a
	mov	dpl,_getTemperatureOfDS18B20_sloc1_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc1_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r3,#0x00
	add	a,#0xd0
	mov	dpl,a
	mov	a,r3
	addc	a,#0xff
	mov	dph,a
	lcall	___sint2fs
	mov	r0,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar0
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xcccd
	mov	b,#0xcc
	mov	a,#0x3d
	lcall	___fsmul
	mov	_getTemperatureOfDS18B20_sloc5_1_0,dpl
	mov	(_getTemperatureOfDS18B20_sloc5_1_0 + 1),dph
	mov	(_getTemperatureOfDS18B20_sloc5_1_0 + 2),b
	mov	(_getTemperatureOfDS18B20_sloc5_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_getTemperatureOfDS18B20_sloc3_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc3_1_0 + 1)
	lcall	___sint2fs
	mov	r0,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	_getTemperatureOfDS18B20_sloc5_1_0
	push	(_getTemperatureOfDS18B20_sloc5_1_0 + 1)
	push	(_getTemperatureOfDS18B20_sloc5_1_0 + 2)
	push	(_getTemperatureOfDS18B20_sloc5_1_0 + 3)
	mov	dpl,r0
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r1,dpl
	mov	r2,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00106$:
;	.\src\utils\DS18B20.c:129: *temperature = tp;
	mov	r3,_getTemperatureOfDS18B20_PARM_2
	mov	r4,(_getTemperatureOfDS18B20_PARM_2 + 1)
	mov	r5,(_getTemperatureOfDS18B20_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r1
	lcall	__gptrput
	inc	dptr
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	.\src\utils\DS18B20.c:132: if (buf[0] == '0') buf[0] = ' ';
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x30,00108$
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	a,#0x20
	lcall	__gptrput
00108$:
;	.\src\utils\DS18B20.c:134: if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
	mov	dpl,_getTemperatureOfDS18B20_sloc4_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc4_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc4_1_0 + 2)
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x30,00113$
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x20,00147$
	sjmp	00109$
00147$:
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x2d,00113$
00109$:
;	.\src\utils\DS18B20.c:135: buf[1] = buf[0];
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	lcall	__gptrget
	mov	r7,a
	mov	dpl,_getTemperatureOfDS18B20_sloc4_1_0
	mov	dph,(_getTemperatureOfDS18B20_sloc4_1_0 + 1)
	mov	b,(_getTemperatureOfDS18B20_sloc4_1_0 + 2)
	lcall	__gptrput
;	.\src\utils\DS18B20.c:136: buf[0] = ' ';
	mov	dpl,_getTemperatureOfDS18B20_buf_65536_28
	mov	dph,(_getTemperatureOfDS18B20_buf_65536_28 + 1)
	mov	b,(_getTemperatureOfDS18B20_buf_65536_28 + 2)
	mov	a,#0x20
;	.\src\utils\DS18B20.c:139: }
	ljmp	__gptrput
00113$:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
