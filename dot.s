.data
arrayA: .space 64
arrayB: .space 64

.text
.globl main
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $v0, 5
    syscall
    addi $t0, $v0, 0
    addi $t2, $t0, 0
    la $t1, arrayA
    loop:
        li $v0, 6
        syscall
        swc1 $f0, 0($t1)
        addi $t1, $t1, 4
        addi $t2, $t2, -1
        bne $t2, $0, loop
    addi $t2, $t0, 0
    la $t1, arrayB
    loopB:
        li $v0, 6
        syscall
        swc1 $f0, 0($t1)
        addi $t1, $t1, 4
        addi $t2, $t2, -1
        bne $t2, $0, loopB
    la $t1, arrayA
    la $t3, arrayB
    addi $t2, $t0, 0
    mtc1 $0, $f5
    loopC:
        lwc1 $f2, 0($t1)
        lwc1 $f3, 0($t3)
        mul.s $f4, $f2, $f3
        add.s $f5, $f5, $f4
        addi $t1, $t1, 4
        addi $t3, $t3, 4
        addi $t2, $t2, -1
        bne $t2, $0, loopC
    mov.s $f12, $f5
    li $v0,2
    syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra