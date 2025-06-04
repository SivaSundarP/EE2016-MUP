/*
 * main.c
 *
 * Created: 9/10/2024 2:41:11 PM
 *  Author: Bhavesh
 */ 

#include <avr/io.h>       // Gives the C pgm access to registers (DDRx, PORTx, and PINx) of the micro-controller

int main(void)
{
    // Set PD0, PD1, PD2, PD3, and PD4 as outputs for the LEDs
    DDRD |= (1 << PC0);
    DDRD |= (1 << PC1);
    DDRD |= (1 << PC2);
    DDRD |= (1 << PC3);
    DDRD |= (1 << PC4);
    
    // 4-bit numbers
    uint8_t N1 = 0b1010;  // Example 4-bit number (10 in decimal)
    uint8_t N2 = 0b1101;  // Example 4-bit number (13 in decimal)
    
    // Sum of the two numbers
    uint8_t Sum = N1 + N2;
    
    // Extract individual bits of the sum (for up to 5 bits)
    uint8_t S1 = Sum & 0b00000001;  // Bit 0
    uint8_t S2 = (Sum & 0b00000010) >> 1;  // Bit 1 (shifted right to the LSB position)
    uint8_t S3 = (Sum & 0b00000100) >> 2;  // Bit 2 (shifted right to the LSB position)
    uint8_t S4 = (Sum & 0b00001000) >> 3;  // Bit 3 (shifted right to the LSB position)
    uint8_t C = (Sum & 0b00010000) >> 4;  // Bit 4 (shifted right to the LSB position)
    
    // Display S1 on LED connected to PD0
    if(S1)
    {
        PORTD |= (1 << PC0);  // Turn on LED if S1 is 1
    }
    else
    {
        PORTD &= ~(1 << PC0);  // Turn off LED if S1 is 0
    }
    
    // Display S2 on LED connected to PD1
    if(S2)
    {
        PORTD |= (1 << PC1);  // Turn on LED if S2 is 1
    }
    else
    {
        PORTD &= ~(1 << PC1);  // Turn off LED if S2 is 0
    }
    
    // Display S3 on LED connected to PD2
    if(S3)
    {
        PORTD |= (1 << PC2);  // Turn on LED if S3 is 1
    }
    else
    {
        PORTD &= ~(1 << PC2);  // Turn off LED if S3 is 0
    }
    
    // Display S4 on LED connected to PD3
    if(S4)
    {
        PORTD |= (1 << PC3);  // Turn on LED if S4 is 1
    }
    else
    {
        PORTD &= ~(1 << PC3);  // Turn off LED if S4 is 0
    }
    
    // Display S5 on LED connected to PD4
    if(C)
    {
        PORTD |= (1 << PC4);  // Turn on LED if S5 is 1
    }
    else
    {
        PORTD &= ~(1 << PC4);  // Turn off LED if S5 is 0
    }
}
