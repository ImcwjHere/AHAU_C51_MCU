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

// ȫ�ֱ���
// ��ʱ����ֵ
int TH_INIT = 0x8E; // ��ʱ����λ��ֵ
int TL_INIT = 0x8E; // ��ʱ����λ��ֵ
// ���ȵ�λ��0��: 0%ת�٣�1��: 50%ת��, 2��: 75%ת��, 3��: 100%ת��
unsigned char fanLevel = 0; // ���ȵ�λ
// ���ڿ��Ʒ���ת�٣�0: �ر�, 1: �򿪣�
unsigned char fanState[4] = {0, 0, 0, 0}; // ����״̬����
// ��ǰ�¶�
float currentTemperature = 0.0; // ��ǰ�¶�
// ����¶�
int highestTemperature = 0;
// ����¶�
int lowestTemperature = 0;

xdata unsigned char firstLine[] = {'H', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'L', ':', 'x', 'x', 'x', (unsigned char)(0xDF), 'C', '\0'};
xdata unsigned char secondLine[] = {'T', ':', 'x', 'x', 'x', '.', 'x', (unsigned char)(0xDF), 'C', ' ', ' ', 'F', 'A', 'N', ':', 'x', '\0'};
// ��Ļ����ʾ�ĵ�ǰ�¶�ָ��, ռ�� 3 ���ֽ�
xdata unsigned char *onScreenHighestTemperature = &firstLine[2];
// ��Ļ����ʾ������¶�ָ��, ռ�� 3 ���ֽ�
xdata unsigned char *onScreenLowestTemperature = &firstLine[11];
// ��Ļ����ʾ�ĵ�ǰ�¶�ָ��, ռ�� 7 ���ֽ�
xdata unsigned char *onScreenCurrentTemperature = &secondLine[2];
// ��Ļ����ʾ�ķ��ȵ�λָ��, ռ�� 1 ���ֽ�
xdata unsigned char *onScreenFanLevel = &secondLine[15];


void main() {
    
	initializeEverything();
    
    startupScreen();
    alartScreen("Starting...");

    while (1) {
        
        // ������¸�λ���������/����¶Ȼָ�ΪĬ��ֵ
        if (!RST_BUTTON) {
            while (!RST_BUTTON);    // �ȴ������ͷ�
            alartScreen("Resetting...");
            writeAT24C02(0x00, (unsigned char)(22));
            writeAT24C02(0x01, (unsigned char)(20));
        }

        // ������µ��Լ�
        if (!DEBUG_BUTTON) {
            while (!DEBUG_BUTTON);    // �ȴ������ͷ�
            alartScreen("Debugging...");
            initializeBeeper();
            doBeep();
        }

        // ����������ü�����ת�����ý���
        if (!SETTING_BUTTON) {
            while (!SETTING_BUTTON);    // �ȴ������ͷ�
            settingScreen();
        }

        // ��ʾ����Ļ
        mainScreen();

        // ��ʱ 100ms
        // delayOneMillisecond(100);
    }
}

















