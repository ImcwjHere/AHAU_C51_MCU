#include "../utils/DELAY.h"
#include "../utils/LCD1602.h"

// ��������
void startupScreen() {
    unsigned char i=0, j=0;
    unsigned int delay_ms=50;  // ��̬��ʾ����ʱ����λΪ����
    xdata unsigned char line_1[] = "Welcome to AAUCS";
    xdata unsigned char line_2[] = "     No. 31     ";
    // ��̬�����ʾ�����ַ�
    for (i = 0; i < 16; i++) {
        writeCharOnLCD1602(0, i, line_1[i]);
        if (i < 7) writeCharOnLCD1602(1, i+5, line_2[i+5]);
        delayOneMillisecond(delay_ms);
    }
    delayOneSecond(1);
    // ���������ƶ�ֱ����ʧ
    for (i = 0; i < 16; i++) {
        // ���������������ƶ�һ�����һ���Ϊ�ո�
        for (j = 0; j < 16; j++) {
            line_1[j] = line_1[j+1];
            line_2[j] = line_2[j+1];
        }
        line_1[15] = ' ';
        line_2[15] = ' ';
        // ���ƶ��������д�� LCD1602
        putStringOnLCD1602(0, 0, line_1);
        putStringOnLCD1602(1, 0, line_2);
        delayOneMillisecond(delay_ms/2);
    }
}