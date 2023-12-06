#ifndef __DS18B20_H_
#define __DS18B20_H_

#include <reg52.h>
#include "DELAY.h"
#include "../CONFIGS.h"

// 引脚
#ifdef EIDE_MODE
    #define DSPORT P15
#endif
#ifdef KEIL_MODE
    sbit DSPORT = P1^5;
#endif

unsigned char initializeDS18B20(void);  //DS18B20初始化
void writeByteToDS18B20(unsigned char com); //写一个字节
unsigned char readByteFromDS18B20(void);    //读取一个字节
void changeTemperatureCommandOfDS18B20(void);    //让DS18B20开始转换温度
void readTemperatureCommandOfDS18B20(void);  //发送读取温度命令
int readTemperatureOfDS18B20(void);  //读取温度
void getTemperatureOfDS18B20(unsigned char * buf, float * temperature);  //读取温度并转换为字符串
		
#endif
