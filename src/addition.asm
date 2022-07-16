%include "/home/gautam/practice/Asm/src/functions.asm"

SECTION .text
global  _start

_start:
	
	mov 	eax,40
	mov 	ebx,30
	add 	eax,ebx
	call 	iprintLF

	call quit
