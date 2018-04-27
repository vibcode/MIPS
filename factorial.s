fact:
    slti $t0, $a0, 1
    beq $t0, 0, Label
    addi $v0, $0, 1
    jr $ra
Label:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    addi $a0, $a0, -1
    jal fact
    lw $a0, 0($sp)
    mult $a0, $v0
    mflo $v0
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

.text
.globl main
main:
    li $v0, 5
    syscall
    addi $a0, $v0, 0
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal fact
    addi $a0, $v0, 0
    li $v0, 1
    syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra