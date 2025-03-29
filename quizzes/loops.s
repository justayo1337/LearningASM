global _start

section .text
_start:
    mov rax, 2
    mov rcx, 5
    
loop1:
    imul rax, rax
    loop loop1
