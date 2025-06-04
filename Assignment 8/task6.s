	AREA LED, CODE, READONLY
	ENTRY
	EXPORT SystemInit
	EXPORT __main

; Task 1: Fill the port register addresses from the LPC2378 manual
PINSEL10 EQU 0xE002C028
FIO2DIR  EQU 0x3FFFC040
PINSEL4  EQU 0xE002C010
FIO2PIN  EQU 0x3FFFC054

SystemInit
; Task 2: Use PINSEL10 to disable ETM function of FIO2 port pins (see p. 166 of user manual)
    LDR R0, =PINSEL10
    LDR R1, [R0]          ; Load the value at PINSEL10 into R1
    MOV R2, #0xFFFFFFFB   ; Load appropriate constant
    AND R1, R2
    STR R1, [R0]

; Task 3: Configure PINSEL4 register
    LDR R0, =PINSEL4
    MOV R2, #0
    STR R2, [R0]

; Task 4: Configure FIO2DIR register
    LDR R0, =FIO2DIR
    MOV R2, #0xFF
    STR R2, [R0]

; Task 6: Creating a Blinking effect
__main
    LDR R0, =FIO2PIN      ; Use the appropriate register to set values

forever
    ; First pattern: 170 (0xAA) displayed on LEDs (10101010)
    LDR R1, =0xFFFF
    LDR R3, =0xFFFF

delay1
    MOV R2, #170
    STR R2, [R0]
    SUBS R1, R1, #1
    BNE delay1

delay2
    ; Second pattern: 85 (0x55) displayed on LEDs (01010101)
    MOV R4, #85
    STR R4, [R0]
    SUBS R3, R3, #1
    BNE delay2

    B forever            ; Loop back to repeat LED pattern display

	END