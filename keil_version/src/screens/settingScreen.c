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

// ȫ�ֱ���
extern int highestTemperature;
extern int lowestTemperature;
extern xdata unsigned char *onScreenHighestTemperature;
extern xdata unsigned char *onScreenLowestTemperature;
extern xdata unsigned char firstLine[];
extern xdata unsigned char secondLine[];
extern void alartScreen(unsigned char text[]);

void settingScreen() {
    bit currentCursor=0, prevCursor=0;    // ��ǰ/��һ�����λ�ã�0��ʾ��������¶ȣ�1��ʾ��������¶�
    bit splashState=0;  // ��˸���״̬��0��ʾ��ʾ�¶ȣ�1��ʾ��ʾ�ո�
    unsigned char blankspaceText[] = "   ";    // �ո�

	
	
	while (!SETTING_BUTTON);    // �ȴ������ͷ�
    alartScreen("Setting...");

    
    // �������APPLY_BUTTON���˳����ý���
    while (APPLY_BUTTON) {
        
        // ������λ�÷����仯����������ʾ��Ļ���棨��ֹ֮ǰ�Ĺ�껹���ڿո�״̬��
        if (currentCursor != prevCursor) {
            putStringOnLCD1602(0, 0, firstLine);
            prevCursor = currentCursor;
        }

        // �ٴΰ���SETTING_BUTTON�л����λ��
        if (!SETTING_BUTTON) {
            while (!SETTING_BUTTON);    // �ȴ������ͷ�
            currentCursor = !currentCursor;
        }

        // ���ݹ��λ���жϿ����ĸ��¶�
        if (!currentCursor) {   // ��������¶�
            // ��˸���: �ڿո���¶�֮���л�, splashStateΪbit��������0��1֮�䷴������
			splashState = !splashState;
            splashState?putStringOnLCD1602(0, 2, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
            if (!ADD_BUTTON) {  // �������ADD_BUTTON����������¶ȣ�������128���϶ȣ�
                while (!ADD_BUTTON);    // �ȴ������ͷ�
                highestTemperature ++;
                if (highestTemperature > 128) highestTemperature = 128;
                // ��int��¼������¶�ת��Ϊ�ַ���, �޸Ķ�Ӧ��Ļ��ʾ����
                floatToText(highestTemperature, onScreenHighestTemperature);
            }
            if (!SUB_BUTTON) {  // �������SUB_BUTTON���������¶ȣ�����������¶ȣ�
                while (!SUB_BUTTON);    // �ȴ������ͷ�
                highestTemperature --;
                if (highestTemperature < lowestTemperature) highestTemperature = lowestTemperature;
                // ��int��¼������¶�ת��Ϊ�ַ���, �޸Ķ�Ӧ��Ļ��ʾ����
                floatToText(highestTemperature, onScreenHighestTemperature);
            }
        } else {    // ��������¶�
            // ��˸���: �ڿո���¶�֮���л�, splashStateΪbit��������0��1֮�䷴������
            splashState = !splashState;
			splashState?putStringOnLCD1602(0, 11, blankspaceText):putStringOnLCD1602(0, 0, firstLine);
            if (!ADD_BUTTON) {  // �������ADD_BUTTON����������¶ȣ�����������¶ȣ�
                while (!ADD_BUTTON);    // �ȴ������ͷ�
                lowestTemperature ++;
                if (lowestTemperature > highestTemperature) lowestTemperature = highestTemperature;
                // ��int��¼������¶�ת��Ϊ�ַ���, �޸Ķ�Ӧ��Ļ��ʾ����
                floatToText(lowestTemperature, onScreenLowestTemperature);
            }
            if (!SUB_BUTTON) {  // �������SUB_BUTTON���������¶ȣ�������-55���϶ȣ�
                while (!SUB_BUTTON);    // �ȴ������ͷ�
                lowestTemperature --;
                if (lowestTemperature < -55) lowestTemperature = -55;
                // ��int��¼������¶�ת��Ϊ�ַ���, �޸Ķ�Ӧ��Ļ��ʾ����
                floatToText(lowestTemperature, onScreenLowestTemperature);
            }
        }
        delayOneMillisecond(300);
    }

    // ��������
    alartScreen("Writing...");
    writeAT24C02(0x00, (unsigned char)(highestTemperature));
    writeAT24C02(0x01, (unsigned char)(lowestTemperature));
}