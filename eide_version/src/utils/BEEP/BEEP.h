#ifndef __BEEP_H_
#define __BEEP_H_

void initializeBeeper();
void BEEPER () interrupt 3;
void doBeep();

#endif