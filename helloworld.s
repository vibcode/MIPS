.data
msg: .asciiz "Hello World\n"
.text
.globl main
main: li $v0, 4
la $a0, msg
syscall
jr $ra
