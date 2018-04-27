.text
.globl main
main: li $v0, 5
syscall
addi $a0, $v0, 42
li $v0,1
syscall
li $a0, 10
li $v0, 11
syscall	#for printing newline
jr $ra