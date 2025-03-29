global _start
extern printf, scanf

section .data
	message db "Please Enter the number of fibonacci numbers to print: ", 0x0a
	msgLength equ $-message
	outFmt db "%hd",0x0a,0x00; newline and null terminator at the end
	inFmt db "%hd",0x00
section .bss 
	userIn resb 1

section .text
_start:
	call printMessage
	call getInput
	call initFib
	call loopFib ; calculate sequence
	call Exit ;exit
getInput:
	mov rdi,inFmt
	mov rsi, userIn
	sub rsp, 8
	call scanf
	add rsp, 8
	ret 

printMessage:
	mov rax, 1  ; syscall write
	mov rdi, 1 ; stdout
	mov rsi,message; the message pointer
	mov rdx, msgLength; length
	syscall
	ret

initFib:
	xor rax,rax ; initialize to 0
	xor rbx,rbx ; initialize to 0
	inc rbx     ; increment by 1
	mov rcx, [userIn] ; loop counter  using user input 
	ret
	
loopFib:
	push rcx
	call printFib

	pop rcx
	add rax, rbx
	xchg rax,rbx
	dec rcx
	jnz loopFib ; loop loopFib
	ret
	
printFib:

	push rax;push registers to stack
	push rbx; 
	push rcx;
	mov rdi,outFmt ;
	mov rsi, rbx
	call printf
	pop rcx
	pop rbx
	pop rax
	ret
Exit:
	mov rax, 60 ; exit syscall
	mov rdi, 0  ; status
	syscall

