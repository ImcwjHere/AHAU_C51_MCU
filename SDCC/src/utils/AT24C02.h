#ifndef __AT24C02_H
#define __AT24C02_H

#include "IIC.h"
#include "DELAY.h"

// EEPROM的地址
// 在I2C总线通信中，设备的地址用于唯一标识每个设备。AT24C02芯片的地址为0xA0，这是由芯片制造商指定的。
#define AT24C02_ADD 0xA0

void writeAT24C02(unsigned char addr, unsigned char dat);   //往AT24C02的一个地址写入一个数据
unsigned char readAT24C02(unsigned char addr);  //读取AT24C02的一个地址的一个数据

#endif
