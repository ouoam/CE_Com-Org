
#        .global main
/*
main:
         MOV R0, #0
       MOV R1, #2
         MOV R2, #4

         ORR R0 , R1 , R2

    BX LR*/
/*
main:
    MOV R5, #1
loop:
    CMP R4, #0
    BLE end
else :
    MOV R5, #2
end:
    MOV R0,R5
    BX LR
*/
    .data
    .balign 4
var1:   .word 1
        .text
        .global main
main:
        MOV R1,#2
        LDR R2, var1addr
        STR R1, [R2]
        LDR R0, [R2]
        BX LR
var1addr : .word var1
