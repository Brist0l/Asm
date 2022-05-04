#PURPOSE: 	This program finds the maximum number 
# 		of a set of numbers given
#

#VARIABLES: 	The registers have the following uses:
# 
# %edi - Holds the index of the data being examined
# %ebx - Largest value found 
# %eax - Current data value
#
# The following mem locations will be used:
#
# data_items - contains the item data. A 0 is used to
# 	       terminate the data
#

.section .data

data_items: 		# Data Items
.long 3,20,30,40,53,19,32,122,31,0

.section .text 

.globl _start

_start:

movl $0, %edi 		# move 0 into the index registers
movl data_items(,%edi,4), %eax # Load the first byte of data into eax
movl %eax,%ebx 		# First element thats why its the biggest

start_loop:

cmpl $0,%eax 		# Compare if Current value is 0
je loop_exit 		# Jump if equal 
incl %edi 		# load next value, Increases the value of edi by 1
movl data_items(,%edi,4), %eax 
cmpl %ebx,%eax 		# Compare values
jle start_loop 		# Jump to loop if the new one is not bigger , i.e. eax < ebx

movl %eax,%ebx 		# copies eax into ebx	
jmp start_loop

loop_exit:
movl $1,%eax
int $0x80
