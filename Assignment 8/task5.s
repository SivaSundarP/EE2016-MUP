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

; Task 5: Displaying a given number
__main
    LDR R0, =FIO2PIN      ; Use the appropriate register to set values

forever
    MOV R2, #170          ; Display 170 using LEDs (10101010)
    STR R2, [R0]
    B forever             ; Infinite loop to keep displaying the value
	END
