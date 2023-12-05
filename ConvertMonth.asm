.data
msg1: .asciiz "\nEnter the number of month: "
menu: .asciiz "\n0-Exit\t1-January\t2-February\t3-March\t4-April\t5-May\t6-June\n7-July\t8-August\t9-September\t10-October\t11-November\t12-December\n"
resMsg: .asciiz "This is equivalent to: \n"
months: .asciiz "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"

.text
main:
    # Enter the number of the month message
    li $v0, 4
    la $a0, msg1
    syscall
    
    # print the menu 
    li $v0, 4
    la $a0, menu
    syscall

    # Read the number of the month
    li $v0, 5
    syscall
    move $t0, $v0
    
    # print the month 
    li $v0, 4
    la $a0, resMsg
    syscall

    # Perform the chosen month
    beq $t0, 0, end
    beq $t0, 1, print1
    beq $t0, 2, print2
    beq $t0, 3, print3
    beq $t0, 4, print4
    beq $t0, 5, print5
    beq $t0, 6, print6
    beq $t0, 7, print7
    beq $t0, 8, print8
    beq $t0, 9, print9
    beq $t0, 10, print10
    beq $t0, 11, print11
    beq $t0, 12, print12
    j main

end:
    # End the program
    li $v0, 10
    syscall

print1:
    li $v0, 4
    la $a0, months
    syscall
    j main
print2:
    li $v0, 4
    la $a0, months + 8  # Point to "February"
    syscall
    j main
print3:
    li $v0, 4
    la $a0, months + 17  # Point to "March"
    syscall
    j main

print4:
    li $v0, 4
    la $a0, months + 23  # Point to "April"
    syscall
    j main

print5:
    li $v0, 4
    la $a0, months + 29  # Point to "May"
    syscall
    j main

print6:
    li $v0, 4
    la $a0, months + 33  # Point to "June"
    syscall
    j main

print7:
    li $v0, 4
    la $a0, months + 38 # Point to "July"
    syscall
    j main

print8:
    li $v0, 4
    la $a0, months + 43 # Point to "August"
    syscall
    j main

print9:
    li $v0, 4
    la $a0, months + 50 # Point to "September"
    syscall
    j main

print10:
    li $v0, 4
    la $a0, months + 60  # Point to "October"
    syscall
    j main

print11:
    li $v0, 4
    la $a0, months + 68  # Point to "November"
    syscall
    j main

print12:
    li $v0, 4
    la $a0, months + 77  # Point to "December"
    syscall
    j main
