#include "mainScreen.h"

// 主屏幕
void mainScreen() {
    int temp = 0;
	
	// 处理存储的最高/最低温度
    prepareReadTemperature(readAT24C02(0x00), onScreenHighestTemperature, &highestTemperature);
    prepareReadTemperature(readAT24C02(0x01), onScreenLowestTemperature, &lowestTemperature);
    // 处理当前温度
    getTemperatureOfDS18B20(onScreenCurrentTemperature, &currentTemperature);
    // 处理风扇档位
    *onScreenFanLevel = (unsigned char)('0' + fanLevel);
    
    // 如果当前温度小于最低温度，则LED灯亮
    LED = !(currentTemperature < lowestTemperature);
    // 如果当前温度超过最高温度或低于最低温度，则蜂鸣器响
    // BEEP = ((currentTemperature <= highestTemperature) && (currentTemperature >= lowestTemperature));
    // 每超过最高温度2度，风扇等级增加一级，最高三级
    temp = currentTemperature - highestTemperature;
    if (temp >= 6) {
        fanLevel = 3;
        fanState[0] = 1;
        fanState[1] = 1;
        fanState[2] = 1;
        fanState[3] = 1;
    } else if (temp >= 4) {
        fanLevel = 2;
        fanState[0] = 1;
        fanState[1] = 1;
        fanState[2] = 1;
        fanState[3] = 0;
    } else if (temp >= 2) {
        fanLevel = 1;
        fanState[0] = 1;
        fanState[1] = 1;
        fanState[2] = 0;
        fanState[3] = 0;
    } else {
        fanLevel = 0;
        fanState[0] = 0;
        fanState[1] = 0;
        fanState[2] = 0;
        fanState[3] = 0;
    }

    // 显示
    putStringOnLCD1602(0, 0, firstLine);
    putStringOnLCD1602(1, 0, secondLine);
}