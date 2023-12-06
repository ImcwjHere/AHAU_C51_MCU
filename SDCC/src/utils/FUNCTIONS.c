#include "FUNCTIONS.h"

// 读取温度值, 转换为字符串, 并赋值给全局变量
// (unsigned char) temperature: 读取的温度值
// (unsigned char *) buf: 需要显示温度的字符串指针(占用 3 个字节)
// (float *) globalVariable: 需要赋值的全局变量指针
void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable) {
    // 处理存储的温度
    if (temperature >= 129) {
        // 负数
        temperature = 255 - temperature + 1;
        buf[0] = '-';    // 负号
        buf[1] = (unsigned char)(temperature % 100 / 10 + '0');
        buf[2] = (unsigned char)(temperature % 10 + '0');
        // 转为数字赋值给全局变量
        *globalVariable = (int)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0')));
    } else {
        // 正数
        // 取第一位数字，如果不是0则显示，否则显示空格
        buf[0] = (unsigned char)(temperature / 100 + '0');
        buf[1] = (unsigned char)(temperature % 100 / 10 + '0');   
        buf[2] = (unsigned char)(temperature % 10 + '0'); 
        // 转为数字赋值给全局变量
        *globalVariable = (int)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0'));
    }
    // 如果第一位数字是0，则将第一位数字替换为空格
    if (buf[0] == '0') buf[0] = ' ';
    // 如果第二位数字是0，且第一位数字是空格或负号，则将第二位数字替换为第一位数字
    if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
        buf[1] = buf[0];
        buf[0] = ' ';
    }
}

// 将最高/最低温度转换为字符串并修改对应屏幕显示内容
void floatToText(int num, unsigned char *buf) {
    // 如果温度是负数
    if (num < 0) {
        buf[0] = '-';
        buf[1] = (unsigned char)(-1 * (int)(num / 10) + '0');
        buf[2] = (unsigned char)(-1 * (int)(num % 10) + '0');
    } else {
        buf[0] = (unsigned char)(num / 100 + '0');
        buf[1] = (unsigned char)(num % 100 / 10 + '0');
        buf[2] = (unsigned char)(num % 10 + '0');
    }
    // 如果第一位数字是0，则将第一位数字替换为空格
    if (buf[0] == '0') buf[0] = ' ';
    // 如果第二位数字是0，且第一位数字是空格或负号，则将第二位数字替换为第一位数字
    if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
        buf[1] = buf[0];
        buf[0] = ' ';
    }
}

void initializeEverything() {
    
    // 默认关闭
    BEEP=1;
    FAN=0;
    LED=1;

    initializeFan();    // 初始化风扇
    initializeLCD1602();    // 初始化LCD1602
    initializeDS18B20();    // 初始化DS18B20，返回1表示初始化成功，返回0表示初始化失败，这里不做处理
}