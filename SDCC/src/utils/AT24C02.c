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

	// 在IIC通信中，每个从设备都有一个唯一的地址。当主设备想要与一个特定的从设备通信时，它需要先发送这个从设备的地址。
	// 这就是为什么我们需要发送写器件地址。
	// 在这个`readAT24C02`函数中，我们想要从AT24C02存储器读取数据。AT24C02存储器的地址是`AT24C02_ADD`。
	// 我们首先发送这个地址，然后发送我们想要读取的数据的地址。这样，AT24C02存储器就知道我们想要读取哪个地址的数据。
	// 然后，我们发送一个起始信号和读器件地址（`AT24C02_ADD + 1`）。这告诉AT24C02存储器我们现在想要读取数据。
	// 最后，我们调用`readByteFromIIC`函数读取数据，然后发送一个停止信号结束通信。
	// 注意：在IIC通信中，最低位是读/写位。如果这一位是0，那么主设备想要写数据；如果这一位是1，那么主设备想要读数据。
	// 这就是为什么我们在发送读器件地址时需要将`AT24C02_ADD`加1。

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
