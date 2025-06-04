/*
 * test4.c
 *
 * Created: 9/9/2024 8:32:48 PM
 * Author : LENOVO
 */ 

#include <avr/io.h>       // Gives the C pgm access to registers (DDRx, PORTx, and PINx) of the micro-controller
#include <util/delay.h>   // For implementing delays

int main(void) {
	
	// Set PD0 (pin 0 of PORTD) as output (+ve terminal of LED)
	DDRD |= (1 << DDD0);  // DDRD is the Data Direction Register for PORTD
	// DDD0 corresponds to PD0, so set it to output
	// Turn ON LED
	PORTD |= (1 << PD0);  // Set PD0 to high (5V)
	
	// Blink LED with 1 sec gap
	while (1) {
		// Turn ON LED
		PORTD |= (1 << PD0);   // Set PD0 to high (5V)
		_delay_ms(1000);       // Wait for 1 second

		// Turn OFF LED
		PORTD &= ~(1 << PD0);  // Set PD0 to low (0V)
		_delay_ms(1000);       // Wait for 1 second
	}
}


