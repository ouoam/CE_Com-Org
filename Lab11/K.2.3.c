#include <stdio.h>
#include <errno.h>
#include <wiringPi.h>
#define BUTTON_PIN 0
// Use GPIO Pin 21, which is Pin 29 for wiringPi library

volatile int eventCounter = 0;

// myInterrupt: called every time an event occurs
void myInterrupt(void) {
	eventCounter++; // the event counter
}

int main(void) {
	if (wiringPiSetup() < 0) // check the existence of wiringPi library
	{
		printf("Unable to setup wiringPi: %s\n", strerror(errno));
		return 1;
	}
	// set wiringPi Pin 29 to generate an interrupt from 1-0 transition
	// myInterrupt() = ISR
	if (wiringPiISR(BUTTON_PIN, INT_EDGE_FALLING, &myInterrupt) < 0)
	{
		printf("Unable to setup ISR: %s \n", strerror(errno));
		return 1;
	}
	// display counter value every second
	while(1) {
		printf("%d\n", eventCounter);
		eventCounter = 0;
		delay(1000); // wait 1 second
	}
	return 0;
}
