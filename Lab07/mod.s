.data
@ Define all the strings and variables
            .balign 4
get_val_1:  .asciz "Number 1 : "

            .balign 4
get_val_2:  .asciz "Number 2 : "

@ printf and scanf usd %d in decimal numbers
            .balign 4
pattern:    .asciz "%d"

@ variables: num_1 and num_2
            .balign 4
num_1:      .word 0

            .balign 4
num_2:      .word 0

@Output format
            .balign 4
output:     .asciz "%d %% %d = %d\n"

@ Back up the link register
            .balign 4
lr_bu:      .word 0

            .balign 4
lr_bu_2:    .word 0


    .text
sum_vals:
    @ Save Link Register
    LDR R2, addr_lr_bu_2
    STR lr, [R2]            @ Mem[R2] <- LR

    @ Sum values in R0 and R1 and return in R0
    @ ADD R0, R0, R1

    while:
        CMP R0, R1
        BLT end
        SUB R0, R0, R1
        B while
    end:


    @ Restore Link Register
    LDR lr, addr_lr_bu_2
    LDR lr, [lr]            @ LR <- Mem[addr_lr_bu2]

    BX lr
@ variable to back up Link Register
addr_lr_bu_2: .word lr_bu_2

@ Used by the compiler to tell libc where main is located
    .global main

main:
    @ Keep the value inside Link Register
    LDR R1, addr_lr_bu
    STR lr, [R1]            @ Mem[addr_lr_bu] <- LR

    @ Print out message to get 1st value
    LDR R0, addr_get_val_1
    BL printf

    @ Get num1 from user via keyboard
    LDR R0, addr_pattern
    LDR R1, addr_num_1
    BL scanf

    @ Print out message to get 2nd value
    LDR R0, addr_get_val_2
    BL printf

    @ Get num2 from user via keyboard
    LDR R0, addr_pattern
    LDR R1, addr_num_2
    BL scanf

    @ Pass by values entered to sum_vals
    LDR R0, addr_num_1
    LDR R0, [R0]        @ R0 <- Mem[addr_num_1]
    LDR R1, addr_num_2
    LDR R1, [R1]        @ R1 <- Mem[addr_num_2]
    BL sum_vals

    @Keep returned value from sum_vals in R3
    MOV R3, R0

    @ Pass the vaklues to display
    LDR R0, addr_output
    LDR R1, addr_num_1
    LDR R1, [R1]
    LDR R2, addr_num_2
    LDR R2, [R2]
    BL printf

    @ Restore Link Register
    LDR lr, addr_lr_bu
    LDR lr, [lr]        @ LR <= Mem[addr_lr_bu]
    BX lr

@ Define pointer addresses
addr_get_val_1:    .word get_val_1
addr_get_val_2:    .word get_val_2
addr_pattern:    .word pattern
addr_num_1:    .word num_1
addr_num_2:    .word num_2
addr_output:    .word output
addr_lr_bu:    .word lr_bu

@ Define printf and scanf functions to be linked with
.global printf
.global scanf
