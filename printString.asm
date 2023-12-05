.data 
a: .asciiz "Leo Messi The G.O.A.T (The Greatest footbaler Of All Time)"

.text

la $t1, a

move $a0, $t1
li $v0, 4
syscall

li $v0, 10
syscall