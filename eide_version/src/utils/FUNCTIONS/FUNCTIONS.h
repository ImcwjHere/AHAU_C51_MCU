#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_

void prepareReadTemperature(unsigned char temperature, unsigned char *buf, int *globalVariable);
void floatToText(int num, unsigned char *buf);
void initializeEverything();

#endif