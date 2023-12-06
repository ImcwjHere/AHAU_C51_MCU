#ifndef __AT24C02_H
#define __AT24C02_H

#include "IIC.h"
#include "DELAY.h"

// EEPROM的地址
#define AT24C02_ADD 0xA0

void writeAT24C02(unsigned char addr, unsigned char dat);   //往AT24C02的一个地址写入一个数据
unsigned char readAT24C02(unsigned char addr);  //读取AT24C02的一个地址的一个数据

#endif
