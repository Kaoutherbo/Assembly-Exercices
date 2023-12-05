.data
msg1: .asciiz "Enter the number of hours: "
resultMsg: .asciiz  "This is equivalent to : \n"
minutesMsg: .asciiz " in minutes\n"
secondsMsg: .asciiz " in seconds\n"

.text
    # print message
    li $v0, 4
    la $a0, msg1
    syscall
    
    # read hour 
    li $v0, 5
    syscall
    move $t0,$v0
    
    # convert to minutes
    mul $t1, $t0, 60
    
    # convert to seconds
    mul $t2, $t0, 3600
    
    # Display the result
    li $v0, 4
    la $a0, resultMsg
    syscall
  # in minutes
    move $a0, $t1
    li $v0, 1
    syscall
     
    li $v0, 4
    la $a0, minutesMsg
    syscall
    
    move $a0, $t2
    li $v0, 1
    syscall
    
     # in seconds
    li $v0, 4
    la $a0, secondsMsg
    syscall

     # End the program
    li $v0, 10
    syscall
    
    