.data
resultMsg: .asciiz "The sum of numbers from 0 to 1 is : "

.text
main:
    # initialiaze the result by 10
    li $t0, 10
    
    # loop for calculate the sum from 0 to 10
    loop:
        beqz $t0, end  # If $t0 is equal to 0, exit the loop (branch if equal to zero)
        add $t1, $t1, $t0  # $t1 = $t1 + $t0
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
    