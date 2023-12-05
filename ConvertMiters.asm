.data
msg1: .asciiz "Enter the number of meters: "
resMsg: .asciiz "This is equivalent to:\n"
kiloMsg: .asciiz "  in kilometers\n"

.text
# Enter the number of meters
li $v0, 4
la $a0, msg1
syscall

# Read the number of meters
li $v0, 5
syscall
move $t0, $v0

# Conversion to kilometers
li $t2, 1000
div $t0, $t0, $t2

# Print result message
li $v0, 4
la $a0, resMsg
syscall

# Print the result in kilometers
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, kiloMsg
syscall

# End of the program
li $v0, 10
syscall
