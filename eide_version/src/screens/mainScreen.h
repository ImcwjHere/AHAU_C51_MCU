#ifndef __mainScreen_H_
#define __mainScreen_H_

#include "../utils/DS18B20.h"
#include "../utils/AT24C02.h"
#include "../utils/LCD1602.h"
#include "../utils/FUNCTIONS.h"
#include "../CONFIGS.h"

// 引脚
#ifdef EIDE_MODE
    #define BEEP P14
    #define LED P20
#endif
#ifdef KEIL_MODE
    sbit BEEP = P1^4;
    sbit LED = P2^0;
#endif

// 全局变量
extern unsigned char fanLevel;
extern unsigned char fanState[4];
extern float currentTemperature;
extern int highestTemperature;
extern int lowestTemperature;
extern xdata unsigned char *onScreenHighestTemperature;
extern xdata unsigned char *onScreenLowestTemperature;
extern xdata unsigned char *onScreenCurrentTemperature;
extern xdata unsigned char *onScreenFanLevel;
extern xdata unsigned char firstLine[];
extern xdata unsigned char secondLine[];

void mainScreen();

#endif