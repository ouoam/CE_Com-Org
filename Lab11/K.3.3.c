#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <wiringPi.h>
#include <math.h>
volatile int eventCounter = 0;
void myInterrupt(void) {
	eventCounter++;
	eventCounter%=3;
}
int main (void) {
	printf("wiringPi LED blinking\n");
	if (wiringPiSetup() == -1) {
		printf("Setup problem ... Abort!");
		exit(1);
	}
	if (wiringPiISR(29, INT_EDGE_FALLING, &myInterrupt) < 0) {
		printf("Unable to setup ISR: %s\n", strerror(errno));
		exit(1);
	}
	pinMode(0, OUTPUT);
	pinMode(1, OUTPUT);
	pinMode(2, OUTPUT);

	for (;;)
	for (int i = 7; i >= 0; i--) {
		digitalWrite(0, i & 1);
		digitalWrite(1, i & 2);
		digitalWrite(2, i & 4);
		delay(500 * pow(2, eventCounter));
	}
}
