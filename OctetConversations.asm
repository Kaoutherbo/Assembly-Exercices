.data
msg1: .asciiz "Enter the number of bits: "
resMsg: .asciiz "This is equivalent to:\n"
octetsMsg: .asciiz "  in octets\n"
kiloMsg: .asciiz "  in kilo octets\n"
megaMsg: .asciiz "  in mega octets\n"
gigaMsg: .asciiz "  in giga octets\n"

.text
# Print message to enter the number of bits
li $v0, 4
la $a0, msg1
syscall

# Read the number of bits
li $v0, 5
syscall
move $t0, $v0

# Conversion in octets (bytes)
li $t1, 8
divu $t2, $t0, $t1

# Conversion in kilo octets (KB)
li $t1, 1024
divu $t3, $t2, $t1

# Conversion in mega octets (MB)
li $t1, 1024
divu $t4, $t3, $t1

# Conversion in giga octets (GB)
li $t1, 1024
divu $t5, $t4, $t1

# Print result
li $v0, 4
la $a0, resMsg
syscall

# in octets (bytes)
li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, octetsMsg
syscall

# in kilo octets (KB)
li $v0, 1
move $a0, $t3
syscall

li $v0, 4
la $a0, kiloMsg
syscall

# in mega octets (MB)
li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, megaMsg
syscall

# in giga octets (GB)
li $v0, 1
move $a0, $t5
syscall

li $v0, 4
la $a0, gigaMsg
syscall

# End of the program
li $v0, 10
syscall
