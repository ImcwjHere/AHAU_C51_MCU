#include "LCD1602.h"

// ��LCDд��һ���ֽ�
void __writeComOnLCD1602(unsigned char com)	{	//д������
	LCD1602_E = 0;	//ʹ��
	LCD1602_RS = 0;	//ѡ��������
	LCD1602_RW = 0;	//ѡ��д��
	
	LCD1602_DATAPINS = com;	//��������
	delayOneMillisecond(1);	//�ȴ������ȶ�

	LCD1602_E = 1;	//д��ʱ��
	delayOneMillisecond(5);	//����ʱ��
	LCD1602_E = 0;
}

// ��LCDд��һ���ֽڵ�����
void __writeDataOnLCD1602(unsigned char dat) {	//д������
	LCD1602_E = 0;	//ʹ������
	LCD1602_RS = 1;	//ѡ����������
	LCD1602_RW = 0;	//ѡ��д��

	LCD1602_DATAPINS = dat;	//д������
	delayOneMillisecond(1);

	LCD1602_E = 1;	//д��ʱ��
	delayOneMillisecond(5);	//����ʱ��
	LCD1602_E = 0;
}

// ��ʼ��LCD1602
void initializeLCD1602(void) {	//LCD��ʼ���ӳ���
 	__writeComOnLCD1602(0x38);	//����ʾ
	__writeComOnLCD1602(0x0c);	//����ʾ����ʾ���
	__writeComOnLCD1602(0x06);	//дһ��ָ���1
	__writeComOnLCD1602(0x01);	//����
	__writeComOnLCD1602(0x80);	//��������ָ�����
}

// �����0���1�е�����
void clearLineInLCD1602(unsigned char row) {
    unsigned char i;
    __writeComOnLCD1602(((row & 1) << 6) | 0x80);
    for(i=0; i<LineLength; i++) __writeDataOnLCD1602(' ');
}

// дһ���ַ�
// row: ��(0��1),  column: �ڼ����ַ�(0~15),  dat: Ҫд���ַ�.
void writeCharOnLCD1602(unsigned char row, unsigned char column, unsigned char dat) {
    __writeComOnLCD1602((((row & 1) << 6) + column) | 0x80);
    __writeDataOnLCD1602(dat);
}

// дһ���ַ���
// row: ��(0��1),  column: �ڼ����ַ�(0~15),  puts: Ҫд���ַ���ָ��.
void putStringOnLCD1602(unsigned char row, unsigned char column, unsigned char *puts) {
    __writeComOnLCD1602((((row & 1) << 6) + column) | 0x80);
    for (; *puts != 0; puts++) {	//����ֹͣ��0����
        __writeDataOnLCD1602(*puts);
        if(++column >= LineLength) break;
    }
}
