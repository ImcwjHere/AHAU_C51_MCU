#ifndef __DS18B20_H_
#define __DS18B20_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

// ����
#ifdef EIDE_MODE
    #define DSPORT P15
#endif
#ifdef KEIL_MODE
    sbit DSPORT = P1^5;
#endif

unsigned char initializeDS18B20(void);  //DS18B20��ʼ��
void writeByteToDS18B20(unsigned char com); //дһ���ֽ�
unsigned char readByteFromDS18B20(void);    //��ȡһ���ֽ�
void changeTemperatureCommandOfDS18B20(void);    //��DS18B20��ʼת���¶�
void readTemperatureCommandOfDS18B20(void);  //���Ͷ�ȡ�¶�����
int readTemperatureOfDS18B20(void);  //��ȡ�¶�
void getTemperatureOfDS18B20(unsigned char * buf, float * temperature);  //��ȡ�¶Ȳ�ת��Ϊ�ַ���
		
#endif
