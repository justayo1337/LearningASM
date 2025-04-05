global _start

section .data
	message db "Hello HTB Academy!"
	length equ $-message

section .text
_start:
	;usually would want to push a null byte 00 \x00 0x00 in too 
	xor rax, rax
	mov al,1
	xor rdi, rdi
	mov dil,1	
	xor rbx,rbx
	mov bx, 'y!'
	push rbx
	mov rbx, 'B Academ'
	push rbx
	mov rbx, 'Hello HT'
	push rbx
	mov rsi,rsp
	xor rdx,rdx
	mov dl,18
	syscall
	
	xor rax,rax
	mov al,60
	xor rdi, rdi
	syscall
