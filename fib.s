global _start
extern printf, scanf

section .data
	message db "Fibonacci Sequence:", 0x0a
	outFmt db "%d",0x0a,0x00; newline and null terminator at the end
section .text
_start:
	call printMessage
	call initFib
	call loopFib ; calculate sequence
	call Exit ;exit

printMessage:
	mov rax, 1  ; syscall write
	mov rdi, 1 ; stdout
	mov rsi,message; the message pointer
	mov rdx, 20; length
	syscall
	ret

initFib:
	xor rax,rax ; initialize to 0
	xor rbx,rbx ; initialize to 0
	inc rbx     ; increment by 1
	mov rcx, 10 ; loop counter 
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

