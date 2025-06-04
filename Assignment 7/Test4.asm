AREA Program, CODE, READONLY

ENTRY
    LDR R0 , =0x00000000 ;load the numbers into R0 and R1
    LDR R1 , =0x00000001
    MOV R2 , #0x00000008

Loop
    SUB R2 , R2 , #1
    CMP R2 , #0 
    BEQ Result  
    ADD R0 , R1 , R0
    B Loop

Result
    LDR R4, =Answer
    STR R0 , [R4]
    SWI &11
    Num1 DCD &00000000
    Num2 DCD &00000001
    ALIGN

AREA Data2, DATA, Readwrite
    Answer DCD 0

END  

