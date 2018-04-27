.text
.globl main
main: li $v0,6
syscall
mov.s $f12, $f0
li $v0,6
syscall
add.s $f12, $f0, $f12
li $v0, 2
syscall
li $a0, 10
li $v0, 11
syscall	#for printing newline
jr $ra