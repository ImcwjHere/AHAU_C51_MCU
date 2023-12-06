#ifndef __AT24C02_H
#define __AT24C02_H

#include "IIC.h"
#include "DELAY.h"

// EEPROM�ĵ�ַ
// ��I2C����ͨ���У��豸�ĵ�ַ����Ψһ��ʶÿ���豸��AT24C02оƬ�ĵ�ַΪ0xA0��������оƬ������ָ���ġ�
#define AT24C02_ADD 0xA0

void writeAT24C02(unsigned char addr, unsigned char dat);   //��AT24C02��һ����ַд��һ������
unsigned char readAT24C02(unsigned char addr);  //��ȡAT24C02��һ����ַ��һ������

#endif
