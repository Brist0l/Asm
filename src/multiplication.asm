%include "/home/gautam/practice/Asm/src/functions.asm"

SECTION .text
global 	_start

_start:
	mov 	eax,30
	mov 	ebx,20
	mul 	ebx
	call 	iprintLF

	call 	quit
