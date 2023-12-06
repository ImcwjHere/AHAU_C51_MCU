#include "../utils/DS18B20.h"
#include "../utils/AT24C02.h"
#include "../utils/LCD1602.h"
#include "../utils/FUNCTIONS.h"

#define LED P20
#define BEEP P14

// ȫ�ֱ���
extern unsigned char fanLevel;
extern unsigned char fanState[4];
extern float currentTemperature;
extern int highestTemperature;
extern int lowestTemperature;
extern xdata unsigned char *onScreenHighestTemperature;
extern xdata unsigned char *onScreenLowestTemperature;
extern xdata unsigned char *onScreenCurrentTemperature;
extern xdata unsigned char *onScreenFanLevel;
extern xdata unsigned char firstLine[];
extern xdata unsigned char secondLine[];

// ����Ļ
void mainScreen() {
    int temp = 0;
	
	// ����洢�����/����¶�
    prepareReadTemperature(readAT24C02(0x00), onScreenHighestTemperature, &highestTemperature);
    prepareReadTemperature(readAT24C02(0x01), onScreenLowestTemperature, &lowestTemperature);
    // ����ǰ�¶�
    getTemperatureOfDS18B20(onScreenCurrentTemperature, &currentTemperature);
    // ������ȵ�λ
    *onScreenFanLevel = (unsigned char)('0' + fanLevel);
    
    // �����ǰ�¶�С������¶ȣ���LED����
    LED = !(currentTemperature < lowestTemperature);
    // �����ǰ�¶ȳ�������¶Ȼ��������¶ȣ����������
    // BEEP = ((currentTemperature <= highestTemperature) && (currentTemperature >= lowestTemperature));
    // ÿ��������¶�2�ȣ����ȵȼ�����һ�����������
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

    // ��ʾ
    putStringOnLCD1602(0, 0, firstLine);
    putStringOnLCD1602(1, 0, secondLine);
}