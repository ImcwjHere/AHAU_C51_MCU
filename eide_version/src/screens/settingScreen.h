#ifndef __settingScreen_H_
#define __settingScreen_H_

#include "../utils/LCD1602.h"
#include "../utils/DELAY.h"
#include "../utils/AT24C02.h"
#include "../utils/FUNCTIONS.h"
#include "../CONFIGS.h"

// 引脚
#ifdef EIDE_MODE
    #define SETTING_BUTTON P37
    #define ADD_BUTTON P36
    #define SUB_BUTTON P35
    #define APPLY_BUTTON P34
    #define RST_BUTTON P33
    #define DEBUG_BUTTON P32
#endif
#ifdef KEIL_MODE
    sbit SETTING_BUTTON = P3^7;
    sbit ADD_BUTTON = P3^6;
    sbit SUB_BUTTON = P3^5;
    sbit APPLY_BUTTON = P3^4;
    sbit RST_BUTTON = P3^3;
    sbit DEBUG_BUTTON = P3^2;
#endif

// 全局变量
extern int highestTemperature;
extern int lowestTemperature;
extern xdata unsigned char *onScreenHighestTemperature;
extern xdata unsigned char *onScreenLowestTemperature;
extern xdata unsigned char firstLine[];
extern xdata unsigned char secondLine[];
extern void alartScreen(unsigned char text[]);

void settingScreen();

#endif