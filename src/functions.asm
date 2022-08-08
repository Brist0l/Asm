;---------------------
; int atoi(int)
; Ascii to Integer conver
atoi:
	push 	ebx
	push 	ecx
	push 	edx
	push 	esi
	mov 	esi,eax
	mov 	eax,0
	mov 	ecx,0
.multiplyLoop: 		;local label
	xor 	ebx,ebx ;resets both lower and upper bytes to 0 of ebx
	mov 	bl,[esi+ecx]
	cmp 	bl,48  ; checks if its ascii 0
	jl 	.finished
	cmp 	bl,57 ; checks if its ascii 9
	jg 	.finished
	sub     bl, 48          ; convert ebx register's lower half to decimal representation of ascii value
    	add     eax, ebx        ; add ebx to our interger value in eax
    	mov     ebx, 10         ; move decimal value 10 into ebx
    	mul     ebx             ; multiply eax by ebx to get place value
   	inc     ecx             ; increment ecx (our counter register)
    	jmp     .multiplyLoop   ; continue multiply loop
 
.finished:
    	cmp     ecx, 0          ; compare ecx register's value against decimal 0 (our counter register)
    	je      .restore        ; jump if equal to 0 (no integer arguments were passed to atoi)
    	mov     ebx, 10         ; move decimal value 10 into ebx
    	div     ebx             ; divide eax by value in ebx (in this case 10)
 
.restore:
    	pop     esi             ; restore esi from the value we pushed onto the stack at the start
    	pop     edx             ; restore edx from the value we pushed onto the stack at the start
    	pop     ecx             ; restore ecx from the value we pushed onto the stack at the start
    	pop     ebx             ; restore ebx from the value we pushed onto the stack at the start
    	ret

;---------------------
; void iprint
; Integer printing function(iota)
iprint:
	push 	eax
	push 	ecx
	push 	edx
	push 	esi
	mov  	ecx,0

divideLoop:
	inc 	ecx
	mov 	edx,0
	mov 	esi,10
	idiv 	esi
	add 	edx,48
	push 	edx
	cmp 	eax,0
	jnz 	divideLoop 

printLoop:
	dec 	ecx
	mov 	eax,esp
	call 	sprint
	pop 	eax
	cmp 	ecx,0
	jnz 	printLoop

	pop 	esi
	pop 	edx
	pop 	ecx
	pop 	eax
	ret
;--------------------
; void iprintLF(Integer number)
; Integer printing function with linefeed
iprintLF:
	call 	iprint

	push 	eax
	mov 	eax,0Ah
	push 	eax
	mov 	eax,esp
	call 	sprint
	pop 	eax
	pop 	eax
	ret 


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
