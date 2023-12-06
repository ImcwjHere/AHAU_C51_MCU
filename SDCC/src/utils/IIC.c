#include "IIC.h"

// SCL SDA
//  1   1  空闲状态
//  1   0  起始信号
//  0   1  终止信号
//  0   0  数据传输

// 起始信号，SCL时钟信号在高电平期间SDA信号产生一个下降沿
void startIIC(void) {
	// 首先，将SDA设置为高电平。这是IIC通信的空闲状态。
	SDA = 1;
	I2c_Delay;
	// 然后，将SCL设置为高电平。这样，我们就有了一个在SCL为高电平期间可以改变SDA的时间窗口。
	SCL = 1;
	I2c_Delay;	//建立时间是SDA保持时间>4.7us
	// 在SCL为高电平期间，将SDA从高电平拉低。这产生了一个下降沿，表示起始信号。
	SDA = 0;
	I2c_Delay;	//保持时间是>4us
	// 最后，将SCL拉低,准备发送或接收数据。
	SCL = 0;
	I2c_Delay;
}

// 终止信号，SCL时钟信号在高电平期间SDA信号产生一个上升沿，IIC的停止函数
void stopIIC(void) {
	// 首先，将SDA设置为低电平。这是在发送或接收数据后的状态。
	SDA = 0;
	I2c_Delay;
	// 然后，将SCL设置为高电平。这样，我们就有了一个在SCL为高电平期间可以改变SDA的时间窗口。
	SCL = 1;
	I2c_Delay;	//建立时间大于4.7us
	// 在SCL为高电平期间，将SDA从低电平拉高。这产生了一个上升沿，表示停止信号。
	SDA = 1;
	I2c_Delay;		
}

// 通过I2C发送一个字节。在SCL时钟信号高电平期间，保持发送信号SDA保持稳定
// 发送完一个字节SCL=0, SDA=1
// 返回值为0或1。发送成功返回1，发送失败返回0

unsigned char sendByteToIIC(unsigned char dat) {
	unsigned char a=0, b=0;	//最大255，一个机器周期为1us，最大延时255us

	for(a = 0;a < 8;a ++) {	//要发送8位，从最高位开始
		SDA = dat >> 7;	// 起始信号之后SCL=0，所以可以直接改变SDA信号
		dat = dat << 1; // 从最高位开始，依次发送数据
		I2c_Delay;
		SCL = 1;
		I2c_Delay;	//建立时间>4.7us
		SCL = 0;
		I2c_Delay;	//时间大于4us
	}
	
	// IIC恢复为空闲状态
	SDA = 1;
	I2c_Delay;
	SCL = 1;
	
	while(SDA) {	//等待应答，也就是等待从设备把SDA拉低
		b ++;
		if(b > 200) {	//如果超过2000us没有应答发送失败，或者为非应答，表示接收结束
			SCL = 0;	// SDA=1, SCL=0, 终止信号
			I2c_Delay;
			return 0;
		}
	}
	
	SCL = 0;	// SDA=0, SCL=0, IIC恢复为数据传输状态
	I2c_Delay;
 	return 1;		
}

// 读取一个字节，从最高位开始，读完一个字节之后SCL=0，SDA=1
// 返回值为读取到的字节
unsigned char readByteFromIIC(void) {
	unsigned char a, dat=0;
	
	SDA = 1;	// 首先，将SDA设置为高电平。这是在发送读取请求后的状态。
	I2c_Delay;
	
	for(a = 0;a < 8;a ++) {	//接收8个字节
		SCL = 1;	// 将SCL设置为1，这样主设备就可以在SCL的上升沿读取SDA的状态。
		I2c_Delay;
		dat <<= 1;
		dat |= SDA;
		I2c_Delay;
		SCL = 0;	// 最后，将SCL设置为0，这样我们就可以在下一个时钟周期读取SDA的状态。
		I2c_Delay;
	}
	
	return dat;		
}
