#ifndef __CONFIGS_H_
#define __CONFIGS_H_

#define EIDE_MODE
// #define KEIL_MODE

// 按钮引脚
#ifdef EIDE_MODE
    #define SETTING_BUTTON P37
    #define ADD_BUTTON P36
    #define SUB_BUTTON P35
    #define APPLY_BUTTON P34
    #define RST_BUTTON P33
    #define DEBUG_BUTTON P32
#endif
#ifdef KEIL_MODE
    sbit SETTING_BUTTON = P3^7;
    sbit ADD_BUTTON = P3^6;
    sbit SUB_BUTTON = P3^5;
    sbit APPLY_BUTTON = P3^4;
    sbit RST_BUTTON = P3^3;
    sbit DEBUG_BUTTON = P3^2;
#endif

// 硬件引脚
#ifdef EIDE_MODE
    #define BEEP P14
    #define LED P20
    #define FAN P27
#endif
#ifdef KEIL_MODE
    sbit BEEP = P1^4;
    sbit LED = P2^0;
    sbit FAN = P2^7;
#endif

// LCD1602的引脚
#define LCD1602_DATAPINS P0 // LCD1602数据引脚
#ifdef EIDE_MODE
    #define LCD1602_E P12   // LCD1602使能引脚
    #define LCD1602_RW P11  // LCD1602读写引脚
    #define LCD1602_RS P10  // LCD1602选择引脚
# endif
#ifdef KEIL_MODE
    sbit LCD1602_E = P1^2;   // LCD1602使能引脚
    sbit LCD1602_RW = P1^1;  // LCD1602读写引脚
    sbit LCD1602_RS = P1^0;  // LCD1602选择引脚
#endif

// IIC的引脚
#ifdef EIDE_MODE
    #define SDA P17
    #define SCL P16
#endif
#ifdef KEIL_MODE
    sbit SDA = P1^7;
    sbit SCL = P1^6;
#endif

// DS18B20的引脚
#ifdef EIDE_MODE
    #define DSPORT P15
#endif
#ifdef KEIL_MODE
    sbit DSPORT = P1^5;
#endif


#endif