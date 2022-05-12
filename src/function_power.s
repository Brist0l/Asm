#PURPOSE: Working of fucntions
# 	  power fucntion is implemented
#

# Everything is stored in the registers so
# data is empty
#
.section .data

.section .text

.globl _start
_start:

pushl $3 	# Push second argument 
pushl $2 	# Push first argument
call power  	# Call the fucntion
addl $8,%esp 	# Move the stack pointer back

pushl %eax 	# Save the first answer before 
		# calling the next function
	
pushl $2 	# Push second argument 
pushl $5 	# Push first argument
call power 	# call the function 
addl $8,%esp 	# Move the stack pointer back 

popl %ebx 	# The second answer is already 
		# in %eax. We saved the 
		# first answer onto the stackm
		# so now we can just pop it 
		# out into %ebx

addl %eax,%ebx  # Add them together
		# The result is in %ebx

movl $1,%eax 	# exit(%ebx is returned)
int $0x80

#PURPOSE: This function is to compute the 
# 	  value of a number raised to its 
#    	  power
#
#INPUT:  First Argument: the base number
# 	 Second Argument: the power
#
#OUTPUT: Will give out the resulting value
#
#NOTES: The power must be more than 1
#
#VARIABLES: 
# 	%ebx - holds the base number
# 	%ecx - holds the power
# 	-4(%ebp) - holds the current resulting
#
# 	%eax is used for storing temp result
#

.type power,@function

power:

pushl %ebp 	# Saves old base pointer
movl %esp,%ebp  # Make stack pointer base pointer
subl $4,%esp    # Get room for our local storage

movl 8(%ebp),%ebx  # Put the first argument in %ebx
movl 12(%ebp),%ecx # Put the second argument in %ecx

movl %ebx,-4(%ebx) # store current value

power_loop_start:

