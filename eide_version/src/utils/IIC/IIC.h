#ifndef __IIC_H
#define __IIC_H

#include <reg52.h>
#include "delay.h"

// I2C时序延时宏定义，STC89C52速度慢所以直接宏定义一个空的延时
#define I2c_Delay

// I2C的接口配置
#define SCL P16
#define SDA P17

// I2C的时序函数
void startIIC(void);	//起始信号
void stopIIC(void);	//停止信号
unsigned char sendByteToIIC(unsigned char dat);	//发送一个字节
unsigned char readByteFromIIC(void);	//读一个字节

#endif
