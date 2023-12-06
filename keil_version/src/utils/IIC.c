#include "IIC.h"
#include "delay.h"

// I2C的接口配置
sbit SCL = P1^6;
sbit SDA = P1^7;

// 起始信号，SCL时钟信号在高电平期间SDA信号产生一个下降沿
void startIIC(void) {
	SDA = 1;
	I2c_Delay;
	SCL = 1;
	I2c_Delay;	//建立时间是SDA保持时间>4.7us
	SDA = 0;
	I2c_Delay;	//保持时间是>4us
	SCL = 0;			
	I2c_Delay;		
}

// 终止信号，SCL时钟信号在高电平期间SDA信号产生一个上升沿，IIC的停止函数
void stopIIC(void) {
	SDA = 0;
	I2c_Delay;
	SCL = 1;
	I2c_Delay;	//建立时间大于4.7us
	SDA = 1;
	I2c_Delay;		
}

// 通过I2C发送一个字节。在SCL时钟信号高电平期间，保持发送信号SDA保持稳定
// 发送完一个字节SCL=0, SDA=1
// 返回值为0或1。发送成功返回1，发送失败返回0
unsigned char sendByteToIIC(unsigned char dat) {
	unsigned char a=0, b=0;	//最大255，一个机器周期为1us，最大延时255us

	for(a = 0;a < 8;a ++) {	//要发送8位，从最高位开始
		SDA = dat >> 7;	//起始信号之后SCL=0，所以可以直接改变SDA信号
		dat = dat << 1;
		I2c_Delay;
		SCL = 1;
		I2c_Delay;	//建立时间>4.7us
		SCL = 0;
		I2c_Delay;	//时间大于4us		
	}
	
	SDA = 1;
	I2c_Delay;
	SCL = 1;
	
	while(SDA) {	//等待应答，也就是等待从设备把SDA拉低
		b ++;
		if(b > 200) {	//如果超过2000us没有应答发送失败，或者为非应答，表示接收结束
			SCL = 0;
			I2c_Delay;
			return 0;
		}
	}
	
	SCL = 0;
	I2c_Delay;
 	return 1;		
}

// 读取一个字节，从最高位开始，读完一个字节之后SCL=0，SDA=1
// 返回值为读取到的字节
unsigned char readByteFromIIC(void) {
	unsigned char a, dat=0;
	
	SDA = 1;	//起始和发送一个字节之后SCL都是0
	I2c_Delay;
	
	for(a = 0;a < 8;a ++) {	//接收8个字节
		SCL = 1;
		I2c_Delay;
		dat <<= 1;
		dat |= SDA;
		I2c_Delay;
		SCL = 0;
		I2c_Delay;
	}
	
	return dat;		
}
