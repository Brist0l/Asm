%include 	'/home/gautam/practice/Asm/src/functions.asm'

SECTION .data
msg1 	db 	"Hehe Boi",0h
msg2 	db 	"Some Random long string",0h

SECTION .text
global 	_start

_start:
	mov 	eax,msg1
	call 	sprintLF

	mov 	eax,msg2
	call 	sprintLF

	call 	quit
