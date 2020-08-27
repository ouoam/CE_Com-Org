#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
int main (void) {
	int pin = 0;
	printf("wiringPi LED blinking\n");
	if (wiringPiSetup() == -1) {
		printf("Setup problem ... Abort!");
		exit(1);
	}
	pinMode(pin, OUTPUT);
	for (int i = 0; i < 10; i++) {
		digitalWrite(pin, 1);
		delay(250);
		digitalWrite(pin, 0);
		delay(250);
	}
}
