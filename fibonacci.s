fib:
    slti $t1, $a0, 3
    beq $t1, 0, Label
    addi $v0, $0, 1
    jr $ra
Label:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 4($sp)
    addi $a0, $a0, -1
    jal fib
    addi $a1, $v0, 0
    sw $a1, 0($sp)
    lw $a0, 4($sp)
    addi $a0, $a0, -2
    jal fib
    lw $a1, 0($sp)
    add $a1, $a1, $v0
    lw $a0, 4($sp)
    addi $v0, $a1, 0
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

.text
.globl main
main:
    li $v0, 5
    syscall
    addi $t0, $v0, 0
    addi $t2, $t0, 0
    addi $a0, $0, 1
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    loop:
        addi $t3, $a0, 0
        jal fib
        addi $a0, $v0, 0
        li $v0, 1
        syscall
        addi $a0, $t3, 0
        beq $a0, $t0, comma
        li $v0, 11
        addi $a0, $0, 44
        syscall
        comma:
            addi $a0, $t3, 0
            addi $a0, $a0, 1
            addi $t2, $t2, -1
            bne $t2, $0, loop
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra