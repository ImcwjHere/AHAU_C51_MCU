#include "reg52.h"

sbit FAN = P2^7;

extern unsigned char fanState[4];
extern int TH_INIT;
extern int TL_INIT;

void initializeFan() {
    // 默认关闭风扇
    FAN = 0;
    // 初始化定时器0
	TMOD &= 0xF0;   // 清除定时器0模式位
	TMOD |= 0x01;   // 设置定时器模式
	TL0 = TL_INIT;  // 设置定时初值
	TH0 = TH_INIT;  // 设置定时初值
	TF0 = 0;    // 清除TF0标志
	TR0 = 1;    // 定时器0开始计时
	ET0 = 1;    // 使能定时器0中断
	EA = 1; // 开启总中断
}

void PWM () interrupt 1 {
    // PWM计数
    static unsigned char i=0;
    // 重新设置定时初值
	TL0 = TL_INIT;
	TH0 = TH_INIT;
    FAN = fanState[i%4];
    if (++i >= 100) i = 0;
}