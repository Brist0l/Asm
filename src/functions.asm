;---------------------
; int slen(char[] msg)
; Calculate lenght of string

slen:
	push 	ebx
	mov 	ebx,eax
nextchar:
	cmp 	byte [eax],0
	jz 	finished
	inc 	eax
	jmp 	nextchar
finished:
	sub 	eax,ebx
	pop 	ebx
	ret 		; eax holds the value

;--------------------
; void sprint(char[] msg)
; print msg to STDOUT

sprint:
	push 	edx
	push 	ecx
	push 	ebx
	push 	eax
	call 	slen

	mov 	edx,eax ; lenght moved into edx
	pop 	eax

	mov 	ecx,eax
	mov 	ebx,1
	mov 	eax,4
	int 	80h

	pop 	ebx
	pop 	ecx
	pop 	edx
	ret
;-------------------
; void sprintLF(char[] msg)
; print msg to STDOUT with line feed function
sprintLF:
	call 	sprint

	push 	eax
	mov 	eax,0Ah
	push 	eax
	mov 	eax,esp
	call 	sprint
	pop 	eax
	pop 	eax
	ret

;-------------------
; void exit()
; Exit program

quit:
	mov 	ebx,0
	mov 	eax,1
	int 	80h
	ret
