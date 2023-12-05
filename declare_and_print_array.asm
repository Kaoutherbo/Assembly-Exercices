.data
printIntMsg: .asciiz "The elements of tab_int are :\n"
printFloatMsg: .asciiz "\nThe elements of tab_float are :\n"
printDoubleMsg: .asciiz "\nThe elements of tab_double are :\n"
space: .asciiz " "
tab_int: .word 1, -6, 10
tab_float: .float 1.12, 12.4, -3.14
tab_double: .double 1.1234, -69.234, 19.2318
line: .asciiz "\n"
.text

main:
    
    li $v0, 4          
    la $a0, printIntMsg
    syscall

    # Print int array
    la $t0, tab_int   # t0 contains the @ of the first element of the array
    li $t1, 3         # t1 contains the size of the array
    li $t2, 0         # t2 is the loop counter

printIntLoop:
    beq $t2, $t1, printFloat  # Branch to print float array if the int array is complete

    lw $t3, ($t0)     # Load the content of the current element in t3
    move $a0, $t3   
      
     # Print integer
    li $v0, 1          
    syscall

      # Print space
    li $v0, 4          
    la $a0, space
    syscall

    addi $t2, $t2, 1   # Increment loop counter
    addi $t0, $t0, 4   # Move to the next element in the array (Increment the @)
    j printIntLoop  

printFloat:
     # print message
    li $v0, 4          
    la $a0, printFloatMsg
    syscall

    la $t0, tab_float
    li $t1, 3
    li $t2, 0

printFloatLoop:
    beq $t2, $t1, printDouble

    lwc1 $f4, ($t0)   # Load the content of the current element in $f4 (float register)
    mov.s $f12, $f4     
    #  Print float
    li $v0, 2           
    syscall

    #  Print space
    li $v0, 4          
    la $a0, space
    syscall

    addi $t2, $t2, 1    
    addi $t0, $t0, 4   
    j printFloatLoop  

printDouble:
    # print message for float elements
    li $v0, 4          
    la $a0, printDoubleMsg
    syscall

    la $t0, tab_double
    li $t1, 3
    li $t2, 0

printDoubleLoop:
    beq $t2, $t1, end

    ldc1 $f6, ($t0)    # Load the content of the current element in $f6 (double register)
    mov.d $f12, $f6
    
    #  Print double
    li $v0, 3           
    syscall

    # print space
    li $v0, 4           
    la $a0, space
    syscall

    addi $t2, $t2, 1    
    addi $t0, $t0, 8    # Move to the next element in the array (double takes 8 bytes)
    j printDoubleLoop 


   #  Exit program
end:
    li $v0, 10          
    syscall
