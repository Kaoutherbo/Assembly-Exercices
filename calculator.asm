.data
msg1: .asciiz "\nEnter the first number: "
msg2: .asciiz "Enter the second number: "
menu: .asciiz "Choose an operation:\n0: Exit\n1: Addition\n2: Subtraction\n3: Multiplication\n4: Division\n"
choice: .asciiz "Enter your choice (0-4): "
resultMsg: .asciiz "\nResult: "
errorMsg: .asciiz "Error: Division by zero\n"
.text
main: 

    # Read first number
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Read second number
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0
    
    # Display the menu
    li $v0, 4
    la $a0, menu
    syscall

    # choose an operation
    li $v0, 4
    la $a0, choice
    syscall

    # Read the user's choice
    li $v0, 5
    syscall
    move $t2, $v0

    
    # Perform the chosen operation
    beq $t2, 0, end
    beq $t2, 1, Addition
    beq $t2, 2, Subtraction
    beq $t2, 3, Multiplication
    beq $t2, 4, Division

    j main

end:
    li $v0, 10
    syscall

Addition:
    add $t3, $t0, $t1
    j PrintResult

Subtraction:
    sub $t3, $t0, $t1
    j PrintResult

Multiplication:
    mul $t3, $t0, $t1
    j PrintResult

Division:
    bnez $t1, notZeroDivisor # branch if not equal to zero (bnez checkes for equality)
   
   # Print error message for division by zero
    li $v0, 4
    la $a0, errorMsg
    syscall
    
    j main
notZeroDivisor:
    div $t3, $t0, $t1
    j PrintResult

PrintResult:
    # Display the result text
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Print the result
    move $a0, $t3
    li $v0, 1
    syscall

    j main
