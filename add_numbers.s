.data
arrayX: .space 4000
msg: .asciiz "Sum of values: "
endmsg: .asciiz "\n"

.text
.globl main
main: li $v0, 5
syscall
addi $t0, $v0, 0
addi $t2, $t0, 0
la $t1, arrayX
loop: li $v0, 5
syscall
sw $v0, 0($t1)
addi $t1, $t1, 4
addi $t2, $t2, -1
bne $t2, $0, loop

addi $t2, $t0, 0
la $t1, arrayX
xor $t3, $t3, $t3
loop1: lw $v0,0($t1)
add $t3, $t3, $v0
addi $t1, $t1, 4
addi $t2, $t2, -1
bne $t2, $0, loop1

li $v0,4
la $a0, msg
syscall
li $v0,1
add $a0, $t3, $0
syscall
li $v0,4
la $a0, endmsg
syscall

jr $ra