#include "delay.h"

// æß’Ò 12.0000MHz œ¬µƒ—” ±∫Ø ˝

// —” ± n ∫¡√Î, ŒÛ≤Ó 5%
void delayOneMillisecond(unsigned int n) {
	unsigned int i;
	for(;n > 0;n --) for(i = 0;i < 123;i ++);
}

// —” ± n √Î, ŒÛ≤Ó 5%
void delayOneSecond(unsigned int n) {
	for(;n > 0;n --) delayOneMillisecond(1000);
}

// —” ± n * 10 Œ¢√Î, ŒÛ≤Ó 80%
void delayTenMicroseconds(unsigned int n) {
	while(n --);
}
