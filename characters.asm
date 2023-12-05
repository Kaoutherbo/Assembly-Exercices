.data
    msg:     .asciiz "Enter a string: "
    string:     .space 150  # Maximum string length is 150 characters

.text
    main:
        li $v0, 4              
        la $a0, msg        
        syscall

	# Read a string
        li $v0, 8              
        la $a0, string         
        li $a1, 150             # Maximum number of characters to read
        syscall

        la $t0, string         # first character of string
        li $t1, 0              # for the index ( i = 0)

    print_loop:
        lb $a0, ($t0)         
        beqz $a0, end_print_loop 
	# print character
        li $v0, 11           
        syscall

        addi $t0, $t0, 1        # increment the adress
        addi $t1, $t1, 1        # Increment the index (i++)
        j print_loop           

	# Exit program
    end_print_loop:
        li $v0, 10              
        syscall
