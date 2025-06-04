;
; Interrupt1.asm
;
; Created: 17-09-2024 04:24:31 PM
; Author : Bhavesh
;

.org 0
rjmp reset            ; on reset, program starts here

.org 0x002            ; Interrupt vector address for INT1.
rjmp int1_ISR

reset:
    ldi r16, 0x70     ; setup the stack pointer to point to address 0x0070
    out spl, r16
    ldi r16, 0x00
    out sph, r16

    ldi r16, (1<<pb1) ; make PB1 output
    out ddrb, r16     ; setting direction of PB1 to output

    ldi r16, 0x00     ; make PORTD input (for button)
    out ddrd, r16

    ldi r16, 0x08     ; enable pull-up resistor for PD3
    out portd, r16

    in r16, gicr
    ori r16, 0x80     ; enable INT1 interrupt
    out gicr, r16

    ldi r16, 0x00     ; Turn off LED
    out portb, r16

    sei               ; Enable global interrupts

    ; Trigger INT1 on falling edge
    ldi r16, (1<<isc11)
    out mcucr, r16

main:
    rjmp main         ; Infinite loop (wait for interrupt)

; ISR for INT1
int1_ISR:
    cli               ; Clear all the interrupts
    in r16, sreg      ; save status register SREG
    push r16          ; push it onto the stack

    ldi r16, 10       ; blink led 10 times
    mov r0, r16       ; store the counter

blink_loop:
    ; Turn on LED
    ldi r16, (1<<pb1)
    out portb, r16

    ; Delay
    ldi r16, 0xff
delay1:
    ldi r17, 0xff
delay2:
    dec r17
    brne delay2
    dec r16
    brne delay1

    ; Turn off LED
    ldi r16, 0x00
    out portb, r16

    ; Another delay (LED off period)
    ldi r16, 0xff
delay3:
    ldi r17, 0xff
delay4:
    dec r17
    brne delay4
    dec r16
    brne delay3

    dec r0            ; Decrement blink count
    brne blink_loop   ; Repeat if not zero

    pop r16           ; Retrieve status register
    out sreg, r16     ; Restore SREG

    sei               ; Re-enable interrupts
    reti              ; Return from interrupt
