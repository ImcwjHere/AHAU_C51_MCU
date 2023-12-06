#ifndef __BEEP_H_
#define __BEEP_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

//播放速度，值为四分音符的时长(ms)
#define SPEED	500

void initializeBeeper();
void doBeep();

#endif