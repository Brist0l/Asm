%include 	'/home/gautam/practice/Asm/src/functions.asm'

SECTION .text
global _start

_start:
	mov 	ecx,0

nextNumber:
	inc 	ecx
	mov 	eax,ecx
	call 	iprintLF
	cmp 	ecx,100
	jne 	nextNumber

	call 	quit
