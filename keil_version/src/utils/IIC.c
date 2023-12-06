#include "IIC.h"
#include "delay.h"

// I2C�Ľӿ�����
sbit SCL = P1^6;
sbit SDA = P1^7;

// ��ʼ�źţ�SCLʱ���ź��ڸߵ�ƽ�ڼ�SDA�źŲ���һ���½���
void startIIC(void) {
	SDA = 1;
	I2c_Delay;
	SCL = 1;
	I2c_Delay;	//����ʱ����SDA����ʱ��>4.7us
	SDA = 0;
	I2c_Delay;	//����ʱ����>4us
	SCL = 0;			
	I2c_Delay;		
}

// ��ֹ�źţ�SCLʱ���ź��ڸߵ�ƽ�ڼ�SDA�źŲ���һ�������أ�IIC��ֹͣ����
void stopIIC(void) {
	SDA = 0;
	I2c_Delay;
	SCL = 1;
	I2c_Delay;	//����ʱ�����4.7us
	SDA = 1;
	I2c_Delay;		
}

// ͨ��I2C����һ���ֽڡ���SCLʱ���źŸߵ�ƽ�ڼ䣬���ַ����ź�SDA�����ȶ�
// ������һ���ֽ�SCL=0, SDA=1
// ����ֵΪ0��1�����ͳɹ�����1������ʧ�ܷ���0
unsigned char sendByteToIIC(unsigned char dat) {
	unsigned char a=0, b=0;	//���255��һ����������Ϊ1us�������ʱ255us

	for(a = 0;a < 8;a ++) {	//Ҫ����8λ�������λ��ʼ
		SDA = dat >> 7;	//��ʼ�ź�֮��SCL=0�����Կ���ֱ�Ӹı�SDA�ź�
		dat = dat << 1;
		I2c_Delay;
		SCL = 1;
		I2c_Delay;	//����ʱ��>4.7us
		SCL = 0;
		I2c_Delay;	//ʱ�����4us		
	}
	
	SDA = 1;
	I2c_Delay;
	SCL = 1;
	
	while(SDA) {	//�ȴ�Ӧ��Ҳ���ǵȴ����豸��SDA����
		b ++;
		if(b > 200) {	//�������2000usû��Ӧ����ʧ�ܣ�����Ϊ��Ӧ�𣬱�ʾ���ս���
			SCL = 0;
			I2c_Delay;
			return 0;
		}
	}
	
	SCL = 0;
	I2c_Delay;
 	return 1;		
}

// ��ȡһ���ֽڣ������λ��ʼ������һ���ֽ�֮��SCL=0��SDA=1
// ����ֵΪ��ȡ�����ֽ�
unsigned char readByteFromIIC(void) {
	unsigned char a, dat=0;
	
	SDA = 1;	//��ʼ�ͷ���һ���ֽ�֮��SCL����0
	I2c_Delay;
	
	for(a = 0;a < 8;a ++) {	//����8���ֽ�
		SCL = 1;
		I2c_Delay;
		dat <<= 1;
		dat |= SDA;
		I2c_Delay;
		SCL = 0;
		I2c_Delay;
	}
	
	return dat;		
}
