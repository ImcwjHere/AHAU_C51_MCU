#include "DS18B20.h"
#include "DELAY.h"

sbit DSPORT = P1^5;

// ��ʼ��DS18B20
// ����ֵ��1�ɹ���0ʧ��
unsigned char initializeDS18B20(void) {
	int i=0;
	
	DSPORT = 0;	//����������480us~960us
	delayTenMicroseconds(64);	//��ʱ642us
	
	DSPORT = 1;	//Ȼ���������ߣ����DS18B20������Ӧ�Ὣ��15us~60us����������
	
	while(DSPORT) {	//�ȴ�DS18B20��������
		i ++;
		delayOneMillisecond(1);
		if(i > 5) return 0;	//�ȴ�>5MS, ���ʼ��ʧ��
	}
	
	return 1;	//��ʼ���ɹ�
}

// ��DS18B20д��һ���ֽ�
void writeByteToDS18B20(unsigned char dat) {
	unsigned int i, j;

	for(j = 0;j < 8;j ++) {
		DSPORT = 0;	//ÿд��һλ����֮ǰ�Ȱ���������1us
		i ++;
		DSPORT = dat & 0x01;	//Ȼ��д��һ�����ݣ������λ��ʼ
		
		i = 6;
		while(i --);	//��ʱ68us������ʱ������60us
		
		DSPORT = 1;	//Ȼ���ͷ����ߣ�����1us�����߻ָ�ʱ����ܽ���д��ڶ�����ֵ
		dat >>= 1;
	}
}

// ��ȡһ���ֽڵ�����
unsigned char readByteFromDS18B20(void) {
	unsigned char byte=0, bi=0;
	unsigned int i, j;	
	
	for(j = 8;j > 0;j --) {
		DSPORT = 0;	//�Ƚ���������1us
		i ++;
		DSPORT = 1;	//Ȼ���ͷ�����
		i ++;
		i ++;	//��ʱ6us�ȴ������ȶ�
		bi = DSPORT;	//��ȡ���ݣ������λ��ʼ��ȡ
		byte = (byte >> 1) | (bi << 7);	// ��byte����һλ��Ȼ����������7λ���bi��ע���ƶ�֮���Ƶ���λ��0
		i = 4;	//��ȡ��֮��ȴ�48us�ٽ��Ŷ�ȡ��һ����
		while(i --);
	}			
	
	return byte;
}

//��DS18B20��ʼת���¶�
void changeTemperatureCommandOfDS18B20(void) {
	initializeDS18B20();
	delayOneMillisecond(1);
	writeByteToDS18B20(0xcc);	//����ROM��������		 
	writeByteToDS18B20(0x44);	//�¶�ת������
}

//���Ͷ�ȡ�¶�����
void readTemperatureCommandOfDS18B20(void)
{	
	initializeDS18B20();
	delayOneMillisecond(1);
	writeByteToDS18B20(0xCC);	//����ROM��������
	writeByteToDS18B20(0xBE);	//���Ͷ�ȡ�¶�����
}

// ��ȡ�¶�
// ����ֵΪ�¶ȵ�ԭʼ��ֵ(int)����Ҫװ��
int readTemperatureOfDS18B20(void) {
	int temp = 0;
	unsigned char tmh, tml;
	
	changeTemperatureCommandOfDS18B20();	//��д��ת������
	readTemperatureCommandOfDS18B20();	//Ȼ��ȴ�ת������Ͷ�ȡ�¶�����
	tml = readByteFromDS18B20();	//��ȡ�¶�ֵ��16λ���ȶ����ֽ�
	tmh = readByteFromDS18B20();	//�ٶ����ֽ�
	temp = tmh;
	temp <<= 8;
	temp |= tml;
	
	return temp;
}

void getTemperatureOfDS18B20(unsigned char * buf, float * temperature) {
	int temp=0;
    float tp=0;
    temp = readTemperatureOfDS18B20();
    if (temp < 0) {    // ���¶�ֵΪ����
		buf[0] = '-';    //   -
		// ��ȡ���¶���ʵ���¶ȵĲ��룬���Լ�1����ȡ�����ԭ��
		temp = temp - 1;
		temp = ~temp;
		tp = temp;
		temp = tp * 0.0625 * 100 + 0.5;
        // ������С�����*100��+0.5���������룬��ΪC���Ը�����ת��Ϊ���͵�ʱ���С����
		// ��������Զ�ȥ���������Ƿ����0.5����+0.5֮�����0.5�ľ��ǽ�1�ˣ�С��0.5�ľ�
		// �����0.5��������С������档
	} else {			
		tp = temp;  //��Ϊ���ݴ�����С�������Խ��¶ȸ���һ�������ͱ���
		// ����¶������ģ���ô������ԭ����ǲ���������
		temp = tp * 0.0625 * 100 + 0.5;
		// ������С�����*100��+0.5���������룬��ΪC���Ը�����ת��Ϊ���͵�ʱ���С����
		// ��������Զ�ȥ���������Ƿ����0.5����+0.5֮�����0.5�ľ��ǽ�1�ˣ�С��0.5�ľ�
		// �����0.5��������С������档
		buf[0] = (temp / 10000) + '0';
	}
	buf[1] = (temp % 10000 / 1000) + '0';
	buf[2] = (temp % 1000 / 100) + '0';
	buf[3] = '.';
	buf[4] = (temp % 100 / 10) + '0';
	buf[5] = 0xDF;
	buf[6] = 'C';

	// ����ת����
	if (buf[0] == '-') {
		tp = (float)(-1 * ((int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1));
	} else {
		tp = (float)((int)(buf[0] - '0') * 100 + (int)(buf[1] - '0') * 10 + (int)(buf[2] - '0') + (int)(buf[4] - '0') * 0.1);
	}
	*temperature = tp;
	
	// �����һλ������0���򽫵�һλ�����滻Ϊ�ո�
	if (buf[0] == '0') buf[0] = ' ';
	// ����ڶ�λ������0���ҵ�һλ�����ǿո�򸺺ţ��򽫵ڶ�λ�����滻Ϊ��һλ����
	if (buf[1] == '0' && (buf[0] == ' '||buf[0] == '-')) {
		buf[1] = buf[0];
		buf[0] = ' ';
	}

}

