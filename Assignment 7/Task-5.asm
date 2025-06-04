AREA Program, CODE, READONLY

ENTRY
    LDR R0 , =0xAB124563 ;load the numbers into R0 and R1
    LDR R1 , =0x00001373
    MOV R2 , #0x00000000 ; assign and clear the quotient register

Loop
    CMP R1 , #0 ;test division by 0
    BEQ Error1
    CMP R0 , R1 ;is the dividend less than the divisor ?
    BLT Result ;if yes, then we are done
    ADD R2 , R2 , #1;add one to quotient
    SUB R0 , R0 , R1
    B Loop

Error1
    MOV R3, #0xFFFFFFFF ;error flag (-1)

Result
    LDR R4, = Remainder ;store the remainder and quotient
    STR R0 , [R4]
    LDR R5, = Quotient
    STR R2 , [R5]
    SWI &11
    Num1 DCD &AB124563  
    Num2 DCW &00001373
    ALIGN
    
AREA Data2, DATA, Readwrite
    Quotient DCD 0
    Remainder DCD 0

END