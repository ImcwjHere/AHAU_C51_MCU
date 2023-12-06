#include "AT24C02.h"

// ��AT24C02��һ����ַд��һ������
// AT24C02 �� 2K bit, 32ҳ x 8 Byte/ҳ, ��256Byte
// addr ��ַ, ��ΧΪ0x00-0xFF
// ����д��̫�죬�ǵü�һ��delay��������1s�����ȣ����Գ��Ե��γ�Ƶһ��
void writeAT24C02(unsigned char addr, unsigned char dat) {
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD));	//����д������ַ
	sendByteToIIC(addr);	//����Ҫд���ڴ��ַ
	sendByteToIIC(dat);	//��������
	stopIIC();
	delayOneMillisecond(300);
}

// ��ȡAT24C02��һ����ַ��һ������
// addr ��ַ, ��ΧΪ0x00-0xFF
// ����ֵΪ����������
unsigned char readAT24C02(unsigned char addr) {
	unsigned char num;
	
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD));	//����д������ַ
	sendByteToIIC(addr);	//����Ҫ��ȡ�ĵ�ַ
	startIIC();
	sendByteToIIC((unsigned char)(AT24C02_ADD + 1));	//���Ͷ�������ַ
	num=readByteFromIIC();	//��ȡ����
	stopIIC();
	delayOneMillisecond(300);
	
	return num;	
}
