#include "delay.h"

// 晶振 12.0000MHz 下的延时函数

// 延时 n 毫秒, 误差 5%
void delayOneMillisecond(unsigned int n) {
	unsigned int i;
	for(;n > 0;n --) for(i = 0;i < 123;i ++);
}

// 延时 n 秒, 误差 5%
void delayOneSecond(unsigned int n) {
	for(;n > 0;n --) delayOneMillisecond(1000);
}

// 延时 n * 10 微秒, 误差 80%
void delayTenMicroseconds(unsigned int n) {
	while(n --);
}
