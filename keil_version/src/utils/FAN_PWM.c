#include "reg52.h"

sbit FAN = P2^7;

extern unsigned char fanState[4];
extern int TH_INIT;
extern int TL_INIT;

void initializeFan() {
    // Ĭ�Ϲرշ���
    FAN = 0;
    // ��ʼ����ʱ��0
	TMOD &= 0xF0;   // �����ʱ��0ģʽλ
	TMOD |= 0x01;   // ���ö�ʱ��ģʽ
	TL0 = TL_INIT;  // ���ö�ʱ��ֵ
	TH0 = TH_INIT;  // ���ö�ʱ��ֵ
	TF0 = 0;    // ���TF0��־
	TR0 = 1;    // ��ʱ��0��ʼ��ʱ
	ET0 = 1;    // ʹ�ܶ�ʱ��0�ж�
	EA = 1; // �������ж�
}

void PWM () interrupt 1 {
    // PWM����
    static unsigned char i=0;
    // �������ö�ʱ��ֵ
	TL0 = TL_INIT;
	TH0 = TH_INIT;
    FAN = fanState[i%4];
    if (++i >= 100) i = 0;
}