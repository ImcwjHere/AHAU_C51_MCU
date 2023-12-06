;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module DELAY
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delayOneMillisecond
	.globl _delayOneSecond
	.globl _delayTenMicroseconds
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
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
;Allocation info for local variables in function 'delayOneMillisecond'
;------------------------------------------------------------
;n                         Allocated to registers 
;i                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	.\src\utils\DELAY\DELAY.c:6: void delayOneMillisecond(unsigned int n) {
;	-----------------------------------------
;	 function delayOneMillisecond
;	-----------------------------------------
_delayOneMillisecond:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6,dpl
	mov	r7,dph
00107$:
;	.\src\utils\DELAY\DELAY.c:8: for(;n > 0;n --) for(i = 0;i < 123;i ++);
	mov	a,r6
	orl	a,r7
	jz	00109$
	mov	r4,#0x7b
	mov	r5,#0x00
00105$:
	dec	r4
	cjne	r4,#0xff,00132$
	dec	r5
00132$:
	mov	a,r4
	orl	a,r5
	jnz	00105$
	dec	r6
	cjne	r6,#0xff,00134$
	dec	r7
00134$:
	sjmp	00107$
00109$:
;	.\src\utils\DELAY\DELAY.c:9: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayOneSecond'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	.\src\utils\DELAY\DELAY.c:12: void delayOneSecond(unsigned int n) {
;	-----------------------------------------
;	 function delayOneSecond
;	-----------------------------------------
_delayOneSecond:
	mov	r6,dpl
	mov	r7,dph
00103$:
;	.\src\utils\DELAY\DELAY.c:13: for(;n > 0;n --) delayOneMillisecond(1000);
	mov	a,r6
	orl	a,r7
	jz	00105$
	mov	dptr,#0x03e8
	push	ar7
	push	ar6
	lcall	_delayOneMillisecond
	pop	ar6
	pop	ar7
	dec	r6
	cjne	r6,#0xff,00119$
	dec	r7
00119$:
	sjmp	00103$
00105$:
;	.\src\utils\DELAY\DELAY.c:14: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayTenMicroseconds'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	.\src\utils\DELAY\DELAY.c:17: void delayTenMicroseconds(unsigned int n) {
;	-----------------------------------------
;	 function delayTenMicroseconds
;	-----------------------------------------
_delayTenMicroseconds:
	mov	r6,dpl
	mov	r7,dph
;	.\src\utils\DELAY\DELAY.c:18: while(n --);
00101$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00111$
	dec	r7
00111$:
	mov	a,r4
	orl	a,r5
	jnz	00101$
;	.\src\utils\DELAY\DELAY.c:19: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
