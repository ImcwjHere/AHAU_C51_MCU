;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module IIC
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _startIIC
	.globl _stopIIC
	.globl _sendByteToIIC
	.globl _readByteFromIIC
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
;Allocation info for local variables in function 'startIIC'
;------------------------------------------------------------
;	.\src\utils\IIC.c:4: void startIIC(void) {
;	-----------------------------------------
;	 function startIIC
;	-----------------------------------------
_startIIC:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\src\utils\IIC.c:5: SDA = 1;
;	assignBit
	setb	_P17
;	.\src\utils\IIC.c:7: SCL = 1;
;	assignBit
	setb	_P16
;	.\src\utils\IIC.c:9: SDA = 0;
;	assignBit
	clr	_P17
;	.\src\utils\IIC.c:11: SCL = 0;			
;	assignBit
	clr	_P16
;	.\src\utils\IIC.c:13: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stopIIC'
;------------------------------------------------------------
;	.\src\utils\IIC.c:16: void stopIIC(void) {
;	-----------------------------------------
;	 function stopIIC
;	-----------------------------------------
_stopIIC:
;	.\src\utils\IIC.c:17: SDA = 0;
;	assignBit
	clr	_P17
;	.\src\utils\IIC.c:19: SCL = 1;
;	assignBit
	setb	_P16
;	.\src\utils\IIC.c:21: SDA = 1;
;	assignBit
	setb	_P17
;	.\src\utils\IIC.c:23: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendByteToIIC'
;------------------------------------------------------------
;dat                       Allocated to registers r7 
;a                         Allocated to registers r6 
;b                         Allocated to registers r7 
;------------------------------------------------------------
;	.\src\utils\IIC.c:28: unsigned char sendByteToIIC(unsigned char dat) {
;	-----------------------------------------
;	 function sendByteToIIC
;	-----------------------------------------
_sendByteToIIC:
	mov	r7,dpl
;	.\src\utils\IIC.c:31: for(a = 0;a < 8;a ++) {	//Ҫ����8λ�������λ��ʼ
	mov	r6,#0x00
00107$:
;	.\src\utils\IIC.c:32: SDA = dat >> 7;	//��ʼ�ź�֮��SCL=0�����Կ���ֱ�Ӹı�SDA�ź�
	mov	a,r7
	rl	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P17,c
;	.\src\utils\IIC.c:33: dat = dat << 1;
	mov	ar5,r7
	mov	a,r5
	add	a,r5
	mov	r7,a
;	.\src\utils\IIC.c:35: SCL = 1;
;	assignBit
	setb	_P16
;	.\src\utils\IIC.c:37: SCL = 0;
;	assignBit
	clr	_P16
;	.\src\utils\IIC.c:31: for(a = 0;a < 8;a ++) {	//Ҫ����8λ�������λ��ʼ
	inc	r6
	cjne	r6,#0x08,00132$
00132$:
	jc	00107$
;	.\src\utils\IIC.c:41: SDA = 1;
;	assignBit
	setb	_P17
;	.\src\utils\IIC.c:43: SCL = 1;
;	assignBit
	setb	_P16
;	.\src\utils\IIC.c:45: while(SDA) {	//�ȴ�Ӧ��Ҳ���ǵȴ����豸��SDA����
	mov	r7,#0x00
00104$:
	jnb	_P17,00106$
;	.\src\utils\IIC.c:46: b ++;
	inc	r7
;	.\src\utils\IIC.c:47: if(b > 200) {	//�������2000usû��Ӧ����ʧ�ܣ�����Ϊ��Ӧ�𣬱�ʾ���ս���
	mov	a,r7
	add	a,#0xff - 0xc8
	jnc	00104$
;	.\src\utils\IIC.c:48: SCL = 0;
;	assignBit
	clr	_P16
;	.\src\utils\IIC.c:50: return 0;
	mov	dpl,#0x00
	ret
00106$:
;	.\src\utils\IIC.c:54: SCL = 0;
;	assignBit
	clr	_P16
;	.\src\utils\IIC.c:56: return 1;		
	mov	dpl,#0x01
;	.\src\utils\IIC.c:57: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readByteFromIIC'
;------------------------------------------------------------
;a                         Allocated to registers r6 
;dat                       Allocated to registers r5 
;------------------------------------------------------------
;	.\src\utils\IIC.c:61: unsigned char readByteFromIIC(void) {
;	-----------------------------------------
;	 function readByteFromIIC
;	-----------------------------------------
_readByteFromIIC:
;	.\src\utils\IIC.c:62: unsigned char a, dat=0;
	mov	r7,#0x00
;	.\src\utils\IIC.c:64: SDA = 1;	//��ʼ�ͷ���һ���ֽ�֮��SCL����0
;	assignBit
	setb	_P17
;	.\src\utils\IIC.c:67: for(a = 0;a < 8;a ++) {	//����8���ֽ�
	mov	r6,#0x00
00102$:
;	.\src\utils\IIC.c:68: SCL = 1;
;	assignBit
	setb	_P16
;	.\src\utils\IIC.c:70: dat <<= 1;
	mov	ar5,r7
	mov	a,r5
	add	a,r5
	mov	r5,a
;	.\src\utils\IIC.c:71: dat |= SDA;
	mov	c,_P17
	clr	a
	rlc	a
	orl	a,r5
	mov	r7,a
;	.\src\utils\IIC.c:73: SCL = 0;
;	assignBit
	clr	_P16
;	.\src\utils\IIC.c:67: for(a = 0;a < 8;a ++) {	//����8���ֽ�
	inc	r6
	cjne	r6,#0x08,00117$
00117$:
	jc	00102$
;	.\src\utils\IIC.c:77: return dat;		
	mov	dpl,r7
;	.\src\utils\IIC.c:78: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
