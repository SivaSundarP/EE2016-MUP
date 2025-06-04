/*
 * task3.c
 *
 * Created: 9/9/2024 6:14:21 PM
 * Author : Siva Sundar
 */ 

#include <avr/io.h>       // Gives the C pgm access to registers (DDRx, PORTx, and PINx) of the micro-controller
#include <util/delay.h>   // For implementing delays

int main(void) {
	
	// Set PD0 (pin 0 of PORTD) as output (+ve terminal of LED)
	DDRD |= (1 << DDD0);  // DDRD is the Data Direction Register for PORTD
	// DDD0 corresponds to PD0, so set it to output
	
	// Turn ON LED
	PORTD |= (1 << PD0);   // Set PD0 to high (5V)
}


