#ifndef __BEEP_H_
#define __BEEP_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

// ����
#ifdef EIDE_MODE
    #define BEEP P14
#endif
#ifdef KEIL_MODE
    sbit BEEP = P1^4;
#endif

//�����ٶȣ�ֵΪ�ķ�������ʱ��(ms)
#define SPEED	500

void initializeBeeper();
void doBeep();

#endif