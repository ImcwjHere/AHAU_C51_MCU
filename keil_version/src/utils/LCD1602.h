#ifndef __LCD1602_H_
#define __LCD1602_H_

#include <reg52.h>
#include "delay.h"

#define Lcd1602_Delay1ms delayOneMillisecond

#define LineLength  16  //16x2


void __writeComOnLCD1602(unsigned char com);    //LCD1602д��8λ�����Ӻ���	
void __writeDataOnLCD1602(unsigned char dat);   //LCD1602д��8λ�����Ӻ���
void initializeLCD1602(void);   //LCD1602��ʼ���ӳ���
void clearLineInLCD1602(unsigned char row); //���һ��
void writeCharOnLCD1602(unsigned char row, unsigned char column, unsigned char dat);    //д�ַ�
void putStringOnLCD1602(unsigned char row, unsigned char column, unsigned char *puts);  //д�ַ���
	
#endif
