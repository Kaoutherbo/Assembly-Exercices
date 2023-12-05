.data
    msg1: .asciiz "Enter the value of n: "
    msg2: .asciiz "Enter number: "
    resultMsg: .asciiz "The average is: "

.text
    main:
        # print message to enter the value of n
        li $v0, 4               
        la $a0, msg1
        syscall

        # Read n from the user
        li $v0, 5
        syscall
        move $t0, $v0           

        # Initialize sum and counter
        li $t1, 0               
        li $t2, 0               

    input_loop:
        # print message to enter a number
        li $v0, 4               
        la $a0, msg2  
        syscall

        # Read the number from the user
        li $v0, 5
        syscall
        add $t1, $t1, $v0       # sum += input
        addi $t2, $t2, 1        # counter++
        
        # Check if counter < n
        blt $t2, $t0, input_loop

        # Calculate the average
        div $t3, $t1, $t0             

        # Display the result
        li $v0, 4               
        la $a0, resultMsg     
        syscall

        li $v0, 1               
        move $a0, $t3          
        syscall

        # Exit program
        li $v0, 10             
        syscall
