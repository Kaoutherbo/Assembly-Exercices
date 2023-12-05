.data
tab_int: .space 100  # 100 bytes
tab_float: .space 100
tab_double: .space 100
msg1: .asciiz "\nEnter the size of array: "
msg2: .asciiz "\nEnter an element: "
msg3_int: .asciiz "The elements of the integer array are: \n"
msg3_float: .asciiz "The elements of the float array are: \n"
msg3_double: .asciiz "The elements of the double array are: \n"
menu: .asciiz "Choose the type of array: 1. Integer 2. Float 3. Double 4. Exit\n"
space: .asciiz " "  

.text

# Print menu
li $v0, 4
la $a0, menu
syscall

# Read user choice
li $v0, 5
syscall
move $t4, $v0  

# Exit if the user chooses 4
beq $t4, 4, exit
  
# Read array size
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0  # $t0: array size

# Read array elements based on user choice
beq $t4, 1, read_int_array
beq $t4, 2, read_float_array
beq $t4, 3, read_double_array

exit:
li $v0, 10
syscall

# -------------- Read Int array ------------------------------
read_int_array:
la $t1, tab_int
li $t2, 0
j read_int_array_loop

read_int_array_loop:
beq $t2, $t0, print_int
#print message
li $v0, 4 
la $a0, msg2
syscall
# read input
li $v0, 5
syscall

move $t3, $v0
sw $t3, ($t1)
addi $t2, $t2, 1  # i++
addi $t1, $t1, 4 # increament adress
j read_int_array_loop

#---------- print the Int array ----------------
print_int:
li $t2, 0 
la $t1, tab_int

li $v0, 4  # print message
la $a0, msg3_int
syscall
j print_Int_loop

print_Int_loop:
beq $t2, $t0, End_print_Int_loop

lw $a0, ($t1)
li $v0, 1  # print int
syscall

li $v0, 4   # print space
la $a0, space
syscall

addi $t2, $t2, 1 
addi $t1, $t1, 4 
j print_Int_loop

End_print_Int_loop:
j exit

# -------------- Read Float array ------------------------------
read_float_array:
    la $t1, tab_float
    li $t2, 0
    j read_float_array_loop 

read_float_array_loop:
    beq $t2, $t0, print_float
    # print message
    li $v0, 4 
    la $a0, msg2
    syscall
    # read input
    li $v0, 6
    syscall

    s.s $f0, ($t1)  # Store the float value in $f0
    addi $t2, $t2, 1  # i++
    addi $t1, $t1, 4  # increment address
    j read_float_array_loop

# ---------- Print the float array ----------------
print_float:
    li $t2, 0 
    la $t1, tab_float

    li $v0, 4  # print message
    la $a0, msg3_float
    syscall

    j print_float_loop

print_float_loop:
    beq $t2, $t0, End_print_float_loop

    l.s $f4, ($t1)
    li $v0, 2  # print float
    mov.s $f12, $f4
    syscall

    li $v0, 4   # print space
    la $a0, space
    syscall

    addi $t2, $t2, 1 
    addi $t1, $t1, 4 
    j print_float_loop

End_print_float_loop:
    j exit

# -------------- Read double array ------------------------------
read_double_array:
la $t1, tab_double
li $t2, 0
j read_double_array_loop 

read_double_array_loop :
beq $t2, $t0, print_double
#print message

li $v0, 4 
la $a0, msg2
syscall
# read input
li $v0, 7
syscall

s.d $f0, ($t1)  # Store the double value in the 
addi $t2, $t2, 1  # i++
addi $t1, $t1, 8 # increament adress
j read_double_array_loop 

#---------- print the double array ----------------
print_double:
li $t2, 0 
la $t1, tab_double

li $v0, 4  # print message
la $a0, msg3_double
syscall
j print_Double_loop

print_Double_loop:
beq $t2, $t0, End_print_Double_loop

l.d $f6, ($t1)
li $v0, 3  # print double
mov.d $f12, $f6
syscall

li $v0, 4   # print space
la $a0, space
syscall

addi $t2, $t2, 1 
addi $t1, $t1, 8 
j print_Double_loop

End_print_Double_loop:
j exit
