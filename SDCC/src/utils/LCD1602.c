#include "LCD1602.h"

// 向LCD写入一个字节
void __writeComOnLCD1602(unsigned char com)	{	//写入命令
	LCD1602_E = 0;	//使能
	LCD1602_RS = 0;	//选择发送命令
	LCD1602_RW = 0;	//选择写入
	
	LCD1602_DATAPINS = com;	//放入命令
	delayOneMillisecond(1);	//等待数据稳定

	LCD1602_E = 1;	//写入时序
	delayOneMillisecond(5);	//保持时间
	LCD1602_E = 0;
}

// 向LCD写入一个字节的数据
void __writeDataOnLCD1602(unsigned char dat) {	//写入数据
	LCD1602_E = 0;	//使能清零
	LCD1602_RS = 1;	//选择输入数据
	LCD1602_RW = 0;	//选择写入

	LCD1602_DATAPINS = dat;	//写入数据
	delayOneMillisecond(1);

	LCD1602_E = 1;	//写入时序
	delayOneMillisecond(5);	//保持时间
	LCD1602_E = 0;
}

// 初始化LCD1602
void initializeLCD1602(void) {	//LCD初始化子程序
 	__writeComOnLCD1602(0x38);	//开显示
	__writeComOnLCD1602(0x0c);	//开显示不显示光标
	__writeComOnLCD1602(0x06);	//写一个指针加1
	__writeComOnLCD1602(0x01);	//清屏
	__writeComOnLCD1602(0x80);	//设置数据指针起点
}

// 清除第0或第1行的数据
void clearLineInLCD1602(unsigned char row) {
    unsigned char i;
    __writeComOnLCD1602(((row & 1) << 6) | 0x80);
    for(i=0; i<LineLength; i++) __writeDataOnLCD1602(' ');
}

// 写一个字符
// row: 行(0或1),  column: 第几个字符(0~15),  dat: 要写的字符.
void writeCharOnLCD1602(unsigned char row, unsigned char column, unsigned char dat) {
    __writeComOnLCD1602((((row & 1) << 6) + column) | 0x80);
    __writeDataOnLCD1602(dat);
}

// 写一个字符串
// row: 行(0或1),  column: 第几个字符(0~15),  puts: 要写的字符串指针.
void putStringOnLCD1602(unsigned char row, unsigned char column, unsigned char *puts) {
    __writeComOnLCD1602((((row & 1) << 6) + column) | 0x80);
    for (; *puts != 0; puts++) {	//遇到停止符0结束
        __writeDataOnLCD1602(*puts);
        if(++column >= LineLength) break;
    }
}
