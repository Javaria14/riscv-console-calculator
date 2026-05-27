.data
menu: .asciz "\n1. Add\n2. Sub\n3. Mul\n4. Div\n5. Mod\n6. Use Prev Result\n7. Exit\nChoice: "

num1_msg: .asciz "First: "
num2_msg: .asciz "Second: "
result_msg: .asciz "Result: "
error_msg: .asciz "Invalid choice!\n"
div_zero_msg: .asciz "Error: Division by zero!\n"
no_prev_msg: .asciz "No previous result!\n"

.text
.globl main

main:
    li s0, 0      # previous result = 0
    li s1, 0      # flag = 0 (no result yet)

# -------- MAIN LOOP --------
loop:
    # print menu
    li a7, 4
    la a0, menu
    ecall

    # read choice
    li a7, 5
    ecall
    mv t0, a0

    # check choices
    li t1, 1
    beq t0, t1, add_op

    li t1, 2
    beq t0, t1, sub_op

    li t1, 3
    beq t0, t1, mul_op

    li t1, 4
    beq t0, t1, div_op

    li t1, 5
    beq t0, t1, mod_op

    li t1, 6
    beq t0, t1, use_prev

    li t1, 7
    beq t0, t1, exit

    # invalid choice
    li a7, 4
    la a0, error_msg
    ecall
    j loop


# -------- ADD --------
add_op:
    jal ra, input_numbers
    add t2, t3, t4
    jal ra, save_and_print
    j loop


# -------- SUB --------
sub_op:
    jal ra, input_numbers
    sub t2, t3, t4
    jal ra, save_and_print
    j loop


# -------- MUL --------
mul_op:
    jal ra, input_numbers
    mul t2, t3, t4
    jal ra, save_and_print
    j loop


# -------- DIV --------
div_op:
    jal ra, input_numbers
    beq t4, zero, div_error   # check division by zero
    div t2, t3, t4
    jal ra, save_and_print
    j loop

div_error:
    li a7, 4
    la a0, div_zero_msg
    ecall
    j loop


# -------- MOD --------
mod_op:
    jal ra, input_numbers
    rem t2, t3, t4
    jal ra, save_and_print
    j loop


# -------- USE PREVIOUS RESULT --------
use_prev:
    beq s1, zero, no_prev   # if no previous result

    # ask for second number
    li a7, 4
    la a0, num2_msg
    ecall

    li a7, 5
    ecall
    mv t4, a0

    mv t3, s0      # previous result as first number
    add t2, t3, t4

    jal ra, save_and_print
    j loop

no_prev:
    li a7, 4
    la a0, no_prev_msg
    ecall
    j loop


# -------- INPUT FUNCTION --------
input_numbers:
    # first number
    li a7, 4
    la a0, num1_msg
    ecall

    li a7, 5
    ecall
    mv t3, a0

    # second number
    li a7, 4
    la a0, num2_msg
    ecall

    li a7, 5
    ecall
    mv t4, a0

    ret


# -------- SAVE + PRINT RESULT --------
save_and_print:
    mv s0, t2   # store result
    li s1, 1    # mark available

    li a7, 4
    la a0, result_msg
    ecall

    li a7, 1
    mv a0, t2
    ecall

    ret


# -------- EXIT --------
exit:
    li a7, 10
    ecall
