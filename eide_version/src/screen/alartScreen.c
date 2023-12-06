#include "LCD1602.h"
#include "DELAY.h"

void alartScreen(unsigned char text[], unsigned int ms) {
    unsigned int cur=0;
    // 清屏
    clearLineInLCD1602(0);
    clearLineInLCD1602(1);
    // 计算居中位置
    cur = ((16 - (sizeof(text)/sizeof(unsigned char)-1))) / 4;
    // 显示字符串
    putStringOnLCD1602(0, cur, text);
    delayOneMillisecond(ms);
}