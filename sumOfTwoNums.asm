
# declaration part
.data
a: .word 12
b: .word 14

 # instruction 
.text 
lw $t1, a
lw $t2, b

add $t3, $t1, $t2
# afichage
move $a0, $t3
li $v0, 1
syscall


li $v0, 10
syscall
