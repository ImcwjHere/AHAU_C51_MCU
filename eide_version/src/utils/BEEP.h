#ifndef __BEEP_H_
#define __BEEP_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

//�����ٶȣ�ֵΪ�ķ�������ʱ��(ms)
#define SPEED	500

void initializeBeeper();
void doBeep();

#endif