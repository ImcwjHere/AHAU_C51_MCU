#include "../utils/DELAY.h"
#include "../utils/LCD1602.h"

// 开机画面
void startupScreen() {
    unsigned char i=0, j=0;
    unsigned int delay_ms=50;  // 动态显示的延时，单位为毫秒
    xdata unsigned char line_1[] = "Welcome to AAUCS";
    xdata unsigned char line_2[] = "     No. 31     ";
    // 动态逐个显示两行字符
    for (i = 0; i < 16; i++) {
        writeCharOnLCD1602(0, i, line_1[i]);
        if (i < 7) writeCharOnLCD1602(1, i+5, line_2[i+5]);
        delayOneMillisecond(delay_ms);
    }
    delayOneSecond(1);
    // 整体向左移动直至消失
    for (i = 0; i < 16; i++) {
        // 将所有文字向左移动一格，最后一格改为空格
        for (j = 0; j < 16; j++) {
            line_1[j] = line_1[j+1];
            line_2[j] = line_2[j+1];
        }
        line_1[15] = ' ';
        line_2[15] = ' ';
        // 将移动后的文字写入 LCD1602
        putStringOnLCD1602(0, 0, line_1);
        putStringOnLCD1602(1, 0, line_2);
        delayOneMillisecond(delay_ms/2);
    }
}