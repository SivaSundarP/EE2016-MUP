/*
 * task1.c
 *
 * Created: 18-09-2024 02:41:54 PM
 * Author : Siva Sundar
 */ 

#define F_CPU 8000000UL			// Preprocessor directive that defines the clock frequency (8 MHz)
#include <avr/io.h>
#include<util/delay.h>
#include <avr/interrupt.h>		// For using interrupt macros ISR()

int main(void)
{
	DDRB=0x03;		// Setting PB0 and PB1 as output pins for LEDs
	DDRD=0x00;		// Initializing PORTD with all pins as input (PD2 is the interrupt pin INT0)
	GICR=0x40;		// 0x40 => 0100 0000 => Bit 6 is HIGH implies External interrupt 0 (PD2/INT0) is enabled
    SREG=0x80;		// 0x80 => 1000 0000 => Global Interrupt Enable (Bit 7) is HIGH, this enables all interrupt pins
	PORTD |= (1<<PD2);		// Assigning pull-up resistor for pin PD2
	
	while(1)
	{
		// White LED (PB0) should be ON till interrupt is given
		PORTB=0x01;
	}
}

ISR(INT0_vect)		// Defining an Interrupt Service Routine, which checks INT0 for interrupting
{
	cli();			// Disable global interrupts, ensures no other interrupt can interrupt the current ISR
	
	// Red LED (PB1) should start blinking
	PORTB=0x02;
	_delay_ms(100);
	PORTB=0x00;
	_delay_ms(100);
	
	sei();			// Re-enables global interrupt, allows other interrupts
}


