.data
msg: .asciiz "Enter a the base : "
msg2: .asciiz "Enter a the exponent : "
resultMsg: .asciiz "The power of the number is : "
errorMsg: .asciiz "Error , the number must be positive"

.text
main:
    
    # print message 
    li $v0, 4
    la $a0, msg2
    syscall
    # read a exponent
    li $v0, 5
    syscall
    move $t1, $v0  
    
    
    # print message 
    li $v0, 4
    la $a0, msg
    syscall
    # read the base
    li $v0, 5
    syscall
    move $t0, $v0  
    
    # test for negative numbers
    ble $t0, -1 , error
    ble $t1, -1 , error
    # initialiaze the result by 1
    li $t2, 1

    # loop for calculate the power
    loop:
        beqz $t0, end  
        mul $t2, $t2, $t1 # $t2 = $t2 * $t1
        subi $t0, $t0, 1  # $t0 = $t0 - 1
        j loop  # Return to start of loop

    end:
    # print result
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # End of program
    li $v0, 10
    syscall
    
    error: 
    # print error
        li $v0, 4
    	la $a0, errorMsg
    	syscall
