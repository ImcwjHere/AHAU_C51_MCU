#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_

#include "reg52.h"
#include "../CONFIGS.h"

// 引脚
#ifdef EIDE_MODE
    #define BEEP P14
    #define LED P20
    #define FAN P27
#endif
#ifdef KEIL_MODE
    sbit BEEP = P1^4;
    sbit LED = P2^0;
    sbit FAN = P2^7;
#endif

// 全局变量
extern void initializeFan();
extern void initializeLCD1602();
extern unsigned char initializeDS18B20(void);

void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable);
void floatToText(int num, unsigned char *buf);
void initializeEverything();

#endif