;
; sort.asm
;
; Created: 03-09-2024 11:48:53 PM
; Author : Bhavesh
;
 ; Bubble sorting registers R16 to R20
 
Load:
  LDI ZH , high(Num << 1)
  LDI ZL , low(Num << 1)
  lpm R16 , Z+
  lpm R17 , Z+
  lpm R18 , Z+
  lpm R19 , Z+
  lpm R20 , Z+


outer_loop:
    CLR R21             ; Clear the swapped flag (R21) at the start of each pass


step_1:
    CP R16, R17         ; Compare R16 with R17
    BRGE step_2         ; Don't swap if R16 >= R17
    MOV R22, R16         ; Swap R16 and R17
    MOV R16, R17
    MOV R17, R22
    LDI R21, 1          ; Set swapped flag since a swap occurred

step_2:
    CP R17, R18         ; Compare R17 with R18
    BRGE step_3         ; Don't swap if R17 >= R18
    MOV R22, R17         ; Swap R17 and R18
    MOV R17, R18
    MOV R18, R22
    LDI R21, 1          ; Set swapped flag since a swap occurred

step_3:
    CP R18, R19         ; Compare R18 with R19
    BRGE step_4         ; Don't swap if R18 >= R19
    MOV R22, R18         ; Swap R18 and R19
    MOV R18, R19
    MOV R19, R22
    LDI R21, 1          ; Set swapped flag since a swap occurred

step_4:
    CP R19, R20         ; Compare R19 with R20
    BRGE end_step       ; Don't swap if R19 >= R20
    MOV R22, R19         ; Swap R19 and R20
    MOV R19, R20
    MOV R20, R22
    LDI R21, 1          ; Set swapped flag since a swap occurred

end_step:
    TST R21             ; Test if any swaps occurred (check the Z flag)
    BRNE outer_loop     ; If swaps happened, repeat the outer loop

done:
  RJMP done
 

; Sorting is done when no swaps are made in a full pass.

.CSEG
Num:
  .db 20 ,25 ,15 , 16 ,36

