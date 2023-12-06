#include "../utils/LCD1602.h"
#include "../utils/DELAY.h"

void alartScreen(unsigned char text[]) {
    unsigned int cur=0;
    // ����
    clearLineInLCD1602(0);
    clearLineInLCD1602(1);
    // �������λ��
    cur = ((16 - (sizeof(text)/sizeof(unsigned char)-1))) / 4;
    // ��ʾ�ַ���
    putStringOnLCD1602(0, cur, text);
    delayOneMillisecond(300);
}