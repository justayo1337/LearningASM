global _start

section .data
	message db "Hello HTB Academy!"
	length equ $-message

section .text
_start:
	;usually would want to push a null byte 00 \x00 0x00 in too 
	mov rax,1
	mov rdi,1	
	mov rbx, 'y!'
	push rbx
	mov rbx, 'B Academ'
	push rbx
	mov rbx, 'Hello HT'
	push rbx
	mov rsi,rsp
	mov rdx,18
	syscall

	mov rax,60
	mov rdi,0
	syscall
