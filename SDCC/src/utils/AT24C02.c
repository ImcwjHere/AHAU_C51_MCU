#include "AT24C02.h"

// 往AT24C02的一个地址写入一个数据
// AT24C02 共 2K bit, 32页 x 8 Byte/页, 共256Byte
// addr 地址, 范围为0x00-0xFF
// 不能写的太快，记得加一个delay，经测试1s咔咔稳，可以尝试调参超频一波
void writeAT24C02(unsigned char addr, unsigned char dat) {
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD));	//发送写器件地址
	sendByteToIIC(addr);	//发送要写入内存地址
	sendByteToIIC(dat);	//发送数据
	stopIIC();
	delayOneMillisecond(300);
}

// 读取AT24C02的一个地址的一个数据
// addr 地址, 范围为0x00-0xFF
// 返回值为读出的数据
unsigned char readAT24C02(unsigned char addr) {
	unsigned char num;
	
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD));	//发送写器件地址
	sendByteToIIC(addr);	//发送要读取的地址
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD + 1));	//发送读器件地址
	num=readByteFromIIC();	//读取数据
	stopIIC();
	delayOneMillisecond(300);
	
	return num;	
}
