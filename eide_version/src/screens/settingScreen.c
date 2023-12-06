#include "../utils/LCD1602.h"
#include "../utils/DELAY.h"
#include "../utils/AT24C02.h"
#include "../utils/FUNCTIONS.h"


sbit SETTING_BUTTON = P3^7;
sbit ADD_BUTTON = P3^6;
sbit SUB_BUTTON = P3^5;
sbit APPLY_BUTTON = P3^4;
sbit RST_BUTTON = P3^3;
sbit DEBUG_BUTTON = P3^2;

// 全局变量
extern int highestTemperature;
extern int lowestTemperature;
extern xdata unsigned char *onScreenHighestTemperature;
extern xdata unsigned char *onScreenLowestTemperature;
extern xdata unsigned char firstLine[];
extern xdata unsigned char secondLine[];
extern void alartScreen(unsigned char text[]);

void settingScreen() {
    bit currentCursor=0, prevCursor=0;    // 当前/上一个光标位置，0表示控制最高温度，1表示控制最低温度
    bit splashState=0;  // 闪烁光标状态，0表示显示温度，1表示显示空格
    unsigned char blankspaceText[] = "   ";    // 空格

	
	
	while (!SETTING_BUTTON);    // 等待按键释放
    alartScreen("Setting...");

    
    // 如果按下APPLY_BUTTON则退出设置界面
    while (APPLY_BUTTON) {
        
        // 如果光标位置发生变化，则重新显示屏幕画面（防止之前的光标还处于空格状态）
        if (currentCursor != prevCursor) {
            putStringOnLCD1602(0, 0, firstLine);
            prevCursor = currentCursor;
        }

        // 再次按下SETTING_BUTTON切换光标位置
        if (!SETTING_BUTTON) {
            while (!SETTING_BUTTON);    // 等待按键释放
            currentCursor = !currentCursor;
        }

        // 根据光标位置判断控制哪个温度
        if (!currentCursor) {   // 控制最高温度
            // 闪烁光标: 在空格和温度之间切换, splashState为bit变量，在0和1之间反复横跳
			splashState = !splashState;
            splashState?putStringOnLCD1602(0, 2, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
            if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最高温度（不超过128摄氏度）
                while (!ADD_BUTTON);    // 等待按键释放
                highestTemperature ++;
                if (highestTemperature > 128) highestTemperature = 128;
                // 将int记录的最高温度转换为字符串, 修改对应屏幕显示内容
                floatToText(highestTemperature, onScreenHighestTemperature);
            }
            if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最高温度（不低于最低温度）
                while (!SUB_BUTTON);    // 等待按键释放
                highestTemperature --;
                if (highestTemperature < lowestTemperature) highestTemperature = lowestTemperature;
                // 将int记录的最高温度转换为字符串, 修改对应屏幕显示内容
                floatToText(highestTemperature, onScreenHighestTemperature);
            }
        } else {    // 控制最低温度
            // 闪烁光标: 在空格和温度之间切换, splashState为bit变量，在0和1之间反复横跳
            splashState = !splashState;
			splashState?putStringOnLCD1602(0, 11, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
            if (!ADD_BUTTON) {  // 如果按下ADD_BUTTON则增加最低温度（不高于最高温度）
                while (!ADD_BUTTON);    // 等待按键释放
                lowestTemperature ++;
                if (lowestTemperature > highestTemperature) lowestTemperature = highestTemperature;
                // 将int记录的最高温度转换为字符串, 修改对应屏幕显示内容
                floatToText(lowestTemperature, onScreenLowestTemperature);
            }
            if (!SUB_BUTTON) {  // 如果按下SUB_BUTTON则减少最低温度（不低于-55摄氏度）
                while (!SUB_BUTTON);    // 等待按键释放
                lowestTemperature --;
                if (lowestTemperature < -55) lowestTemperature = -55;
                // 将int记录的最高温度转换为字符串, 修改对应屏幕显示内容
                floatToText(lowestTemperature, onScreenLowestTemperature);
            }
        }
        delayOneMillisecond(300);
    }

    // 保存设置
    alartScreen("Writing...");
    writeAT24C02(0x00, (unsigned char)(highestTemperature));
    writeAT24C02(0x01, (unsigned char)(lowestTemperature));
}