#include "FUNCTIONS.h"

// ��ȡ�¶�ֵ, ת��Ϊ�ַ���, ����ֵ��ȫ�ֱ���
// (unsigned char) temperature: ��ȡ���¶�ֵ
// (unsigned char *) buf: ��Ҫ��ʾ�¶ȵ��ַ���ָ��(ռ�� 3 ���ֽ�)
// (float *) globalVariable: ��Ҫ��ֵ��ȫ�ֱ���ָ��
void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable) {
    // ����洢���¶�
    if (temperature >= 129) {
        // ����
        temperature = 255 - temperature + 1;
        buf[0] = '-';    // ����
        buf[1] = (unsigned char)(temperature % 100 / 10 + '0');
        buf[2] = (unsigned char)(temperature % 10 + '0');
        // תΪ���ָ�ֵ��ȫ�ֱ���
        *globalVariable = (int)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0')));
    } else {
        // ����
        // ȡ��һλ���֣��������0����ʾ��������ʾ�ո�
        buf[0] = (unsigned char)(temperature / 100 + '0');
        buf[1] = (unsigned char)(temperature % 100 / 10 + '0');   
        buf[2] = (unsigned char)(temperature % 10 + '0'); 
        // תΪ���ָ�ֵ��ȫ�ֱ���
        *globalVariable = (int)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0'));
    }
    // �����һλ������0���򽫵�һλ�����滻Ϊ�ո�
    if (buf[0] == '0') buf[0] = ' ';
    // ����ڶ�λ������0���ҵ�һλ�����ǿո�򸺺ţ��򽫵ڶ�λ�����滻Ϊ��һλ����
    if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
        buf[1] = buf[0];
        buf[0] = ' ';
    }
}

// �����/����¶�ת��Ϊ�ַ������޸Ķ�Ӧ��Ļ��ʾ����
void floatToText(int num, unsigned char *buf) {
    // ����¶��Ǹ���
    if (num < 0) {
        buf[0] = '-';
        buf[1] = (unsigned char)(-1 * (int)(num / 10) + '0');
        buf[2] = (unsigned char)(-1 * (int)(num % 10) + '0');
    } else {
        buf[0] = (unsigned char)(num / 100 + '0');
        buf[1] = (unsigned char)(num % 100 / 10 + '0');
        buf[2] = (unsigned char)(num % 10 + '0');
    }
    // �����һλ������0���򽫵�һλ�����滻Ϊ�ո�
    if (buf[0] == '0') buf[0] = ' ';
    // ����ڶ�λ������0���ҵ�һλ�����ǿո�򸺺ţ��򽫵ڶ�λ�����滻Ϊ��һλ����
    if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
        buf[1] = buf[0];
        buf[0] = ' ';
    }
}

void initializeEverything() {
    
    // Ĭ�Ϲر�
    BEEP=1;
    FAN=0;
    LED=1;

    initializeFan();    // ��ʼ������
    initializeLCD1602();    // ��ʼ��LCD1602
    initializeDS18B20();    // ��ʼ��DS18B20������1��ʾ��ʼ���ɹ�������0��ʾ��ʼ��ʧ�ܣ����ﲻ������
}