%include 	'/home/gautam/practice/Asm/src/functions.asm'

SECTION 	.text
global 		_start

_start:
	pop 	ecx ; number of args

nextArg:
	cmp 	ecx,0h
	jz 	noMoreArgs
	pop 	eax
	call 	sprintLF
	dec 	ecx
	jmp 	nextArg

noMoreArgs:
	call 	quit
