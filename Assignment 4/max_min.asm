.equ num_count = 10       ; to define total number of numbers used to compare  
.def largest = r16        ; Register to store largest value  
.def smallest = r19       ; Register to store smallest value    
.def temp = r17           ; Temperory register to store values   
.def i = r18              ; TO denote number of loops remaining , index
             
rjmp RESET                ;Jump to RESET function           

.CSEG               
RESET:
    ldi ZH, high(n << 1)   ; storing High address of numbers in R30
    ldi ZL, low(n << 1)    ;storing low address of numbers in R31

    lpm largest, Z+       ; first number into 'largest' 
    mov smallest, largest ; Initialize 'smallest' with the first number
    ldi i, num_count - 1  ; index counter to num_count - 1

compare_loop:
    lpm temp, Z+          ;next number into 'temp' 
    cp largest, temp      ; Compare 'largest' with 'temp'
    brlo update_largest   ; If largest < temp 

    cp temp, smallest     ; Compare 'temp' with 'smallest'
    brlo update_smallest  ; If temp < smallest

next_element:
    dec i                 ; Decrement index
    brne compare_loop     ; If index is not zero, repeat the loop

done:
    nop                    
    rjmp done             ; Infinite loop to end the program

update_largest:
    mov largest, temp     ; Update largest with temp
    rjmp next_element     ; next element

update_smallest:
    mov smallest, temp    ; Update smallest with temp
    rjmp next_element     ; next element

             
n: 
    .db 16, 36, 25, 50, 20, 60, 70, 46, 55, 77   ; numbers to be stored 
