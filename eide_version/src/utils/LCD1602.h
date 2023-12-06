#ifndef __LCD1602_H_
#define __LCD1602_H_

#include <reg52.h>
#include "delay.h"

#define Lcd1602_Delay1ms delayOneMillisecond

#define LineLength  16  //16x2


void __writeComOnLCD1602(unsigned char com);    //LCD1602写入8位命令子函数	
void __writeDataOnLCD1602(unsigned char dat);   //LCD1602写入8位数据子函数
void initializeLCD1602(void);   //LCD1602初始化子程序
void clearLineInLCD1602(unsigned char row); //清除一行
void writeCharOnLCD1602(unsigned char row, unsigned char column, unsigned char dat);    //写字符
void putStringOnLCD1602(unsigned char row, unsigned char column, unsigned char *puts);  //写字符串
	
#endif
