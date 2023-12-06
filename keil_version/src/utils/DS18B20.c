#include "DS18B20.h"
#include "DELAY.h"

sbit DSPORT = P1^5;

// 初始化DS18B20
// 返回值：1成功，0失败
unsigned char initializeDS18B20(void) {
	int i=0;
	
	DSPORT = 0;	//将总线拉低480us~960us
	delayTenMicroseconds(64);	//延时642us
	
	DSPORT = 1;	//然后拉高总线，如果DS18B20做出反应会将在15us~60us后总线拉低
	
	while(DSPORT) {	//等待DS18B20拉低总线
		i ++;
		delayOneMillisecond(1);
		if(i > 5) return 0;	//等待>5MS, 则初始化失败
	}
	
	return 1;	//初始化成功
}

// 向DS18B20写入一个字节
void writeByteToDS18B20(unsigned char dat) {
	unsigned int i, j;

	for(j = 0;j < 8;j ++) {
		DSPORT = 0;	//每写入一位数据之前先把总线拉低1us
		i ++;
		DSPORT = dat & 0x01;	//然后写入一个数据，从最低位开始
		
		i = 6;
		while(i --);	//延时68us，持续时间最少60us
		
		DSPORT = 1;	//然后释放总线，至少1us给总线恢复时间才能接着写入第二个数值
		dat >>= 1;
	}
}

// 读取一个字节的数据
unsigned char readByteFromDS18B20(void) {
	unsigned char byte=0, bi=0;
	unsigned int i, j;	
	
	for(j = 8;j > 0;j --) {
		DSPORT = 0;	//先将总线拉低1us
		i ++;
		DSPORT = 1;	//然后释放总线
		i ++;
		i ++;	//延时6us等待数据稳定
		bi = DSPORT;	//读取数据，从最低位开始读取
		byte = (byte >> 1) | (bi << 7);	// 将byte左移一位，然后与上右移7位后的bi，注意移动之后移掉那位补0
		i = 4;	//读取完之后等待48us再接着读取下一个数
		while(i --);
	}			
	
	return byte;
}

//让DS18B20开始转换温度
void changeTemperatureCommandOfDS18B20(void) {
	initializeDS18B20();
	delayOneMillisecond(1);
	writeByteToDS18B20(0xcc);	//跳过ROM操作命令		 
	writeByteToDS18B20(0x44);	//温度转换命令
}

//发送读取温度命令
void readTemperatureCommandOfDS18B20(void)
{	
	initializeDS18B20();
	delayOneMillisecond(1);
	writeByteToDS18B20(0xCC);	//跳过ROM操作命令
	writeByteToDS18B20(0xBE);	//发送读取温度命令
}

// 读取温度
// 返回值为温度的原始数值(int)，需要装换
int readTemperatureOfDS18B20(void) {
	int temp = 0;
	unsigned char tmh, tml;
	
	changeTemperatureCommandOfDS18B20();	//先写入转换命令
	readTemperatureCommandOfDS18B20();	//然后等待转换完后发送读取温度命令
	tml = readByteFromDS18B20();	//读取温度值共16位，先读低字节
	tmh = readByteFromDS18B20();	//再读高字节
	temp = tmh;
	temp <<= 8;
	temp |= tml;
	
	return temp;
}

void getTemperatureOfDS18B20(unsigned char * buf, float * temperature) {
	int temp=0;
    float tp=0;
    temp = readTemperatureOfDS18B20();
    if (temp < 0) {    // 当温度值为负数
		buf[0] = '-';    //   -
		// 读取的温度是实际温度的补码，所以减1，再取反求出原码
		temp = temp - 1;
		temp = ~temp;
		tp = temp;
		temp = tp * 0.0625 * 100 + 0.5;
        // 留两个小数点就*100，+0.5是四舍五入，因为C语言浮点数转换为整型的时候把小数点
		// 后面的数自动去掉，不管是否大于0.5，而+0.5之后大于0.5的就是进1了，小于0.5的就
		// 算加上0.5，还是在小数点后面。
	} else {			
		tp = temp;  //因为数据处理有小数点所以将温度赋给一个浮点型变量
		// 如果温度是正的，那么正数的原码就是补码它本身
		temp = tp * 0.0625 * 100 + 0.5;
		// 留两个小数点就*100，+0.5是四舍五入，因为C语言浮点数转换为整型的时候把小数点
		// 后面的数自动去掉，不管是否大于0.5，而+0.5之后大于0.5的就是进1了，小于0.5的就
		// 算加上0.5，还是在小数点后面。
		buf[0] = (temp / 10000) + '0';
	}
	buf[1] = (temp % 10000 / 1000) + '0';
	buf[2] = (temp % 1000 / 100) + '0';
	buf[3] = '.';
	buf[4] = (temp % 100 / 10) + '0';
	buf[5] = 0xDF;
	buf[6] = 'C';

	// 文字转数字
	if (buf[0] == '-') {
		tp = (float)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1));
	} else {
		tp = (float)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1);
	}
	*temperature = tp;
	
	// 如果第一位数字是0，则将第一位数字替换为空格
	if (buf[0] == '0') buf[0] = ' ';
	// 如果第二位数字是0，且第一位数字是空格或负号，则将第二位数字替换为第一位数字
	if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
		buf[1] = buf[0];
		buf[0] = ' ';
	}

}

