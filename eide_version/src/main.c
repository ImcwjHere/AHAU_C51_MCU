/**
 * CPU: AT89C52
 * FREQ: 12.0000 MHz
 * XTAL: 12.0000 MHz
 * AUTHOR: Wenjun Chen
 * DATE: 2023-11-30
*/

#include <reg52.h>
#include <stdio.h>
#include "delay.h"
#include "LCD1602.h"
#include "AT24C02.h"
#include "DS18B20.h"
#include "FUNCTIONS.h"
#include "FAN.h"
#include "BEEP.h"

#include "startupScreen.c"
#include "alartScreen.c"
#include "settingScreen.c"
#include "mainScreen.c"

// 引脚
#define SETTING_BUTTON P37
#define ADD_BUTTON P36
#define SUB_BUTTON P35
#define APPLY_BUTTON P34
#define RST_BUTTON P33
#define DEBUG_BUTTON P32
#define BEEP P14
#define LED P20
#define FAN P27

// TODO: 有bug
// 定时器初值(10ms)
// #define TH_INIT (65535-(1/1200)*12000000)/256
// #define TL_INIT (65535-(1/1200)*12000000)%256

// 全局变量
int TH_INIT = 0x8E; // 定时器初值
int TL_INIT = 0x8E; // 定时器初值
unsigned char fanLevel = 0; // 风扇档位，0档: 0%转速，1档: 50%转速, 2档: 75%转速, 3档: 100%转速
unsigned char fanState[4] = {0, 0, 0, 0}; // 用于控制风扇转速（0: 关闭, 1: 打开）
float currentTemperature = 0.0; // 当前温度
int highestTemperature = 0.0; // 最高温度
int lowestTemperature = 0.0; // 最低温度
xdata unsigned char firstLine[] = {'H', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'L', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', '\0'};
xdata unsigned char secondLine[] = {'T', ':', 'x', 'x', 'x', '.', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'F', 'A', 'N', ':', 'x', '\0'};
xdata unsigned char *onScreenHighestTemperature = &firstLine[2]; // 屏幕上显示的最高温度指针, 占用 3 个字节
xdata unsigned char *onScreenLowestTemperature = &firstLine[11]; // 屏幕上显示的最低温度指针, 占用 3 个字节
xdata unsigned char *onScreenCurrentTemperature = &secondLine[2]; // 屏幕上显示的当前温度指针, 占用 7 个字节
xdata unsigned char *onScreenFanLevel = &secondLine[15]; // 屏幕上显示的风扇档位指针, 占用 1 个字节

void main() {
    initializeEverything();
    startupScreen();
    alartScreen("Starting...", 300);

    while (1) {
        
        // 如果按下复位键，将最高/最低温度恢复为默认值
        if (!RST_BUTTON) {
            while (!RST_BUTTON);    // 等待按键释放
            alartScreen("Resetting...", 300);
            writeAT24C02(0x00, (unsigned char)(22));
            writeAT24C02(0x01, (unsigned char)(20));
        }

        // 如果按下调试键
        if (!DEBUG_BUTTON) {
            while (!DEBUG_BUTTON);    // 等待按键释放
            alartScreen("Debugging...", 300);
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
