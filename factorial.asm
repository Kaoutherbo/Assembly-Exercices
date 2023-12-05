.data
msg: .asciiz "Enter a nombre : "
resultMsg: .asciiz "The factoriel of the number is : "
errorMsg: .asciiz "Error , the number must be positive"

.text
main:
    # print message 
    li $v0, 4
    la $a0, msg
    syscall

   
    # read a number
    li $v0, 5
    syscall
    move $t0, $v0  
    ble $t0, -1 , error
    # initialiaze the result by 1
    li $t1, 1

    # loop for calculate the factorial
    loop:
        beqz $t0, end  # If $t0 is equal to 0, exit the loop (branch if equal to zero)
        mul $t1, $t1, $t0  # $t1 = $t1 * $t0
        subi $t0, $t0, 1  # $t0 = $t0 - 1
        j loop  # Return to start of loop

    end:
    # print result
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    # End of program
    li $v0, 10
    syscall
    
    error: 
    # print error
        li $v0, 4
    	la $a0, errorMsg
    	syscall