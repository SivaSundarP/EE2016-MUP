/*
 * task3.c
 *
 * Created: 9/9/2024 6:14:21 PM
 * Author : Siva Sundar
 */ 

#include <avr/io.h>       // Gives the C pgm access to registers (DDRx, PORTx, and PINx) of the micro-controller
#include <util/delay.h>   // For implementing delays

int main(void) {
	
	// Setting PD0 and PD1 (pins 0 and 1 of PORTD) as outputs (+ve terminal of LED1 and LED2 resp.)
	DDRD |= (1 << DDD0);
	DDRD |= (1 << DDD1);
	
	// Blink LEDs in the pattern: 00,01,10,11,00... with 1 sec gap
	while (1) {
		// 00
		PORTD &= ~(1 << PD0);  // Set PD0 to LOW (0V)
		PORTD &= ~(1 << PD1);  // Set PD1 to LOW (0V)
		_delay_ms(1000);       // Wait for 1 second

		// 01
		PORTD |= (1 << PD0);   // Set PD0 to HIGH (5V)
		_delay_ms(1000);       // Wait for 1 second

		// 10
		PORTD &= ~(1 << PD0);  // Set PD0 to LOW (0V)
		PORTD |= (1 << PD1);   // Set PD1 to HIGH (5V)
		_delay_ms(1000);       // Wait for 1 second

		// 11
		PORTD |= (1 << PD0);   // Set PD0 to HIGH (5V)
		_delay_ms(1000);       // Wait for 1 second
	}
}
