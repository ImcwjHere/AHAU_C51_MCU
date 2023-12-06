#ifndef FAN_PWM_H
#define FAN_PWM_H

#include "reg52.h"
#include "../CONFIGS.h"

// 全局变量
extern unsigned char fanState[4];
extern int TH_INIT;
extern int TL_INIT;

void initializeFan();

#endif