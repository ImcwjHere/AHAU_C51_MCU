#include "delay.h"

// ���� 12.0000MHz �µ���ʱ����

// ��ʱ n ����, ��� 5%
void delayOneMillisecond(unsigned int n) {
	unsigned int i;
	for(;n > 0;n --) for(i = 0;i < 123;i ++);
}

// ��ʱ n ��, ��� 5%
void delayOneSecond(unsigned int n) {
	for(;n > 0;n --) delayOneMillisecond(1000);
}

// ��ʱ n * 10 ΢��, ��� 80%
void delayTenMicroseconds(unsigned int n) {
	while(n --);
}
