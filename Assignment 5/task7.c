/*
 * main.c
 *
 * Created: 9/10/2024 2:41:11 PM
 *  Author: Bhavesh
 */ 

#include <avr/io.h>       // Gives the C pgm access to registers (DDRx, PORTx, and PINx) of the micro-controller

int main(void)
{
	// Set PD0, PD1, and PD2 as outputs for the LEDs
	DDRD |= (1 << PD0);
	DDRD |= (1 << PD1);
	DDRD |= (1 << PD2);
	
	// 2-bit numbers
	uint8_t N1 = 0b10;
	uint8_t N2 = 0b11;
	
	// Sum of the two numbers
	uint8_t Sum = N1 + N2;
	
	// Extract individual bits of the sum
	uint8_t S1 = Sum & 0b00000001;
	uint8_t S2 = Sum & 0b00000010;
	uint8_t C = Sum & 0b00000100;
	
	
	S2 = S2 >> 1;
	C = C >> 2;
	
	// Display S1 on LED connected to PD0
	if(S1)
	{
	PORTD |= (1 << PD0);  // Turn on LED if S1 is 1
	}
	else
	{
	PORTD &= ~(1 << PD0);  // Turn off LED if S1 is 0
	}
	
   // Display S2 on LED connected to PD0
	if(S2)
	{
		PORTD |= (1 << PD1);   // Turn on LED if S2 is 1
	}
	else
	{
		PORTD &= ~(1 << PD1);   // Turn off LED if S2 is 0
	}
   
    // Display C on LED connected to PD0
	if(C)
	{
		PORTD |= (1 << PD2);    // Turn on LED if C is 1
	}
	else
	{
		PORTD &= ~(1 << PD2);    // Turn off LED if C is 0
	}
}