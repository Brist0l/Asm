%include "/home/gautam/practice/Asm/src/functions.asm"

SECTION .data
msg1 	db 	' remainder '

SECTION .text
global 	_start

_start:
	mov 	eax,40
	mov 	ebx,13
	div 	ebx
	call 	iprint
	mov 	eax,msg1
	call 	sprint
	mov 	eax,edx
	call 	iprintLF

	call quit
