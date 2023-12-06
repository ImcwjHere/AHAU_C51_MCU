#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_

#include "reg52.h"
#include "../CONFIGS.h"

// ȫ�ֱ���
extern void initializeFan();
extern void initializeLCD1602();
extern unsigned char initializeDS18B20(void);

void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable);
void floatToText(int num, unsigned char *buf);
void initializeEverything();

#endif