;
; ADD10.asm
;
; Created: 04-09-2024 09:16:50 AM
; Author : Bhavesh
;

.ORG 0x0000                  ;Starting address for storing the code            
LDI R16, 0                   ; R16 for storing the sum  
LDI ZH, HIGH(numbers << 1)   ;For storing high address of numbers in R30  
LDI ZL, LOW(numbers << 1)    ;For storing low address of numbers in R31
LDI R17, 10                  ;For showing the numbers still to be added 

SUM_LOOP:                    ; loop to add and store
    LPM R18, Z+               ; load the numers from flash memory
    ADD R16, R18              ; add numbers in R16 , R18 and store in R16
    DEC R17                   ; Decrement the numbers count
    BRNE SUM_LOOP            ;enter the loop if number count is not 0

NOP_lo:                       ; infinite loop to stop after addition is over
NOP                          
rjmp NOP_lo                  

.CSEG                        ;Commands to store numbers in flash
numbers:
    .DB 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
