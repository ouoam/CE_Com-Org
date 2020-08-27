#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
int main (void) {
	printf("wiringPi LED blinking\n");
	if (wiringPiSetup() == -1) {
		printf("Setup problem ... Abort!");
		exit(1);
	}
	pinMode(0, OUTPUT);
	pinMode(1, OUTPUT);
	pinMode(2, OUTPUT);
	for (int i = 0; i <= 7; i++) {
		digitalWrite(0, i & 1);
		digitalWrite(1, i & 2);
		digitalWrite(2, i & 4);
		delay(500);
	}
}
