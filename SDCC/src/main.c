/**
 * CPU: AT89C52
 * FREQ: 12.0000 MHz
 * XTAL: 12.0000 MHz
 * AUTHOR: Wenjun Chen
 * DATE: 2023-11-30
*/

#include <reg52.h>
#include <stdio.h>

#include "./CONFIGS.h"
#include "./utils/delay.h"
#include "./utils/LCD1602.h"
#include "./utils/AT24C02.h"
#include "./utils/DS18B20.h"
#include "./utils/FAN_PWM.h"
#include "./utils/BEEP.h"
#include "./utils/FUNCTIONS.h"

#include "./screens/startupScreen.h"
#include "./screens/alartScreen.h"
#include "./screens/settingScreen.h"
#include "./screens/mainScreen.h"

// 全局变量
// 定时器初值
int TH_INIT = 0x8E; // 定时器高位初值
int TL_INIT = 0x8E; // 定时器低位初值
// 风扇档位，0档: 0%转速，1档: 50%转速, 2档: 75%转速, 3档: 100%转速
unsigned char fanLevel = 0; // 风扇档位
// 用于控制风扇转速（0: 关闭, 1: 打开）
unsigned char fanState[4] = {0, 0, 0, 0}; // 风扇状态数组
// 当前温度
float currentTemperature = 0.0; // 当前温度
// 最高温度
int highestTemperature = 0;
// 最低温度
int lowestTemperature = 0;

xdata unsigned char firstLine[] = {'H', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'L', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', '\0'};
xdata unsigned char secondLine[] = {'T', ':', 'x', 'x', 'x', '.', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'F', 'A', 'N', ':', 'x', '\0'};
// 屏幕上显示的当前温度指针, 占用 3 个字节
xdata unsigned char *onScreenHighestTemperature = &firstLine[2];
// 屏幕上显示的最低温度指针, 占用 3 个字节
xdata unsigned char *onScreenLowestTemperature = &firstLine[11];
// 屏幕上显示的当前温度指针, 占用 7 个字节
xdata unsigned char *onScreenCurrentTemperature = &secondLine[2];
// 屏幕上显示的风扇档位指针, 占用 1 个字节
xdata unsigned char *onScreenFanLevel = &secondLine[15];


void main() {
    
	initializeEverything();
    
    startupScreen();
    alartScreen("Starting...");

    while (1) {
        
        // 如果按下复位键，将最高/最低温度恢复为默认值
        if (!RST_BUTTON) {
            while (!RST_BUTTON);    // 等待按键释放
            alartScreen("Resetting...");
            writeAT24C02(0x00, (unsigned char)(22));
            writeAT24C02(0x01, (unsigned char)(20));
        }

        // 如果按下调试键
        if (!DEBUG_BUTTON) {
            while (!DEBUG_BUTTON);    // 等待按键释放
            alartScreen("Debugging...");
            initializeBeeper();
            doBeep();
        }

        // 如果按下设置键，跳转到设置界面
        if (!SETTING_BUTTON) {
            while (!SETTING_BUTTON);    // 等待按键释放
            settingScreen();
        }

        // 显示主屏幕
        mainScreen();

        // 延时 100ms
        // delayOneMillisecond(100);
    }
}

















