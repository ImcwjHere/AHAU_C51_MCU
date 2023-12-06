#ifndef __settingScreen_H_
#define __settingScreen_H_

#include "../utils/LCD1602.h"
#include "../utils/DELAY.h"
#include "../utils/AT24C02.h"
#include "../utils/FUNCTIONS.h"
#include "../CONFIGS.h"

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