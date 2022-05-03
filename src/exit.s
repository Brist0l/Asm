#PURPOSE:   Simple program that exits and returns 
# 	    a status code to the linux kernel 
#

#INPUT: none
#

#OUTPUT:    returns a status code. which can be 
# 	    viewed by typing
# 	    
#           echo $?
# 	    after running the program

#VARIABLES:
#          %eax holds the system call number
# 	   %ebx holds the return codes
#

.section .data

.section .text

.globl _start
_start:

movl $1,%eax 	# This is the sys call for 
		# the linux kernel to exit
		# a program

movl $0,%ebx 	# status number 
# movl $10,%ebx

int $0x80
