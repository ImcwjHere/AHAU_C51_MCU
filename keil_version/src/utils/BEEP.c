#include <reg52.h>
#include "DELAY.h"

sbit BEEP = P1^4;

//播放速度，值为四分音符的时长(ms)
#define SPEED	500

//音符与索引对应表，P：休止符，L：低音，M：中音，H：高音，下划线：升半音符号#
#define P	0
#define L1	1
#define L1_	2
#define L2	3
#define L2_	4
#define L3	5
#define L4	6
#define L4_	7
#define L5	8
#define L5_	9
#define L6	10
#define L6_	11
#define L7	12
#define M1	13
#define M1_	14
#define M2	15
#define M2_	16
#define M3	17
#define M4	18
#define M4_	19
#define M5	20
#define M5_	21
#define M6	22
#define M6_	23
#define M7	24
#define H1	25
#define H1_	26
#define H2	27
#define H2_	28
#define H3	29
#define H4	30
#define H4_	31
#define H5	32
#define H5_	33
#define H6	34
#define H6_	35
#define H7	36

//索引与频率对照表
xdata unsigned int FreqTable[]={
	0,
	63628,63731,63835,63928,64021,64103,64185,64260,64331,64400,64463,64528,
	64580,64633,64684,64732,64777,64820,64860,64898,64934,64968,65000,65030,
	65058,65085,65110,65134,65157,65178,65198,65217,65235,65252,65268,65283,
};

//乐谱
//音符与索引对应表，P：休止符，L：低音，M：中音，H：高音，下划线：升半音符号#
xdata unsigned char Music[]={
	//音符,时值,
    // 前奏
	H1, 4,
    H2, 4,
    M5, 4,
    H2, 4,
    H3, 4,
    M5, 1,
    M4, 1,
    M3, 1,
    M1, 1,

	H1, 4,
    H2, 4,
    M5, 4,
    M5, 4,
    P,  4,
    M5, 1,
    M5, 1,
    M5, 1,
    M6, 1,
    M1, 1,
    M6, 1,
    M1, 1,

	H1, 4,
    H2, 4,
    M5, 4,
    H2, 4,
    H3, 4,
    M5, 1,
    M4, 1,
    M3, 1,
    M1, 1,

	H1, 4,
    H2, 4,
    M5, 4,
    M5, 4,
    P,  4,
    M1, 1,
    M1, 1,
    L7, 1,
    M1, 1,
    L7, 1,
    M1, 1,

    // Never gonna give you up
    M5, 1, 
    M6, 1,
    M1, 1,
    M6, 1,
    H3, 4,
    H3, 4,
    H2, 4,

    // Never gonna let you down
    M5, 1, 
    M6, 1,
    M1, 1,
    M6, 1,
    H2, 4,
    H2, 4,
    M1, 4,
    M7, 1,
    M6, 1,

    // Never gonna run around and desert you
    M5, 1, 
    M6, 1,
    M1, 1,
    M6, 1,
    M1, 4,
    M2, 2,
    M7, 2,
    M6, 1,
    M5, 2,
    P,  1,
    M5, 2,
    M2, 4,

	0xFF	//终止标志
};

unsigned char FreqSelect=0, MusicSelect=0;


void initializeBeeper() {
    // 默认关闭蜂鸣器
    BEEP = 1;
    // 初始化定时器1
    TMOD &= 0x0F;   // 清除定时器1模式位
    TMOD |= 0x10;   // 设置定时器模式
    TL1 = 0x00;  // 设置定时初值
    TH1 = 0x00;  // 设置定时初值
    TF1 = 0;    // 清除TF1标志
    TR1 = 1;    // 定时器1开始计时
    ET1 = 1;    // 使能定时器1中断
    EA = 1; // 开启总中断
}

void BEEPER () interrupt 3 {
    if(FreqTable[FreqSelect]) { //如果不是休止符
		/*取对应频率值的重装载值到定时器*/
		TL1 = FreqTable[FreqSelect]%256;		//设置定时初值
		TH1 = FreqTable[FreqSelect]/256;		//设置定时初值
		BEEP=!BEEP;	//翻转蜂鸣器IO口
	}
}

void doBeep() {
	while(1) {
		if(Music[MusicSelect]!=0xFF) {  // 如果不是停止标志位
			FreqSelect=Music[MusicSelect];  // 选择音符对应的频率
			MusicSelect++;
			delayOneMillisecond(SPEED/4*Music[MusicSelect]);  // 选择音符对应的时值
			MusicSelect++;
			TR1 = 0;
			delayOneMillisecond(5);	// 音符间短暂停顿
			TR1 = 1;
		}
		else {  // 如果是停止标志位
			TR1 = 0;
            BEEP = 1;
			break;
		}
	}
}