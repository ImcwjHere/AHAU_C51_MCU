#ifndef __BEEP_H_
#define __BEEP_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

#ifdef SDCC_MODE
    void BEEPER () interrupt 3;
#endif

//�����ٶȣ�ֵΪ�ķ�������ʱ��(ms)
#define SPEED	500

void initializeBeeper();
void doBeep();

#endif