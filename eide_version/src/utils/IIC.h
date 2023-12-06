#ifndef __IIC_H
#define __IIC_H

#include <reg52.h>
#include "./DELAY.h"
#include "../CONFIGS.h"

// I2C�Ľӿ�����
#ifdef EIDE_MODE
    #define SDA P17
    #define SCL P16
#endif
#ifdef KEIL_MODE
    sbit SDA = P1^7;
    sbit SCL = P1^6;
#endif

// I2Cʱ����ʱ�궨�壬STC89C52�ٶ�������ֱ�Ӻ궨��һ���յ���ʱ
#define I2c_Delay

// I2C��ʱ����
void startIIC(void);	//��ʼ�ź�
void stopIIC(void);	//ֹͣ�ź�
unsigned char sendByteToIIC(unsigned char dat);	//����һ���ֽ�
unsigned char readByteFromIIC(void);	//��һ���ֽ�

#endif
