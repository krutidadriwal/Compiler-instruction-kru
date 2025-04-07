section .data
msg db "Result: %d", 10, 0
section .text
extern kru
extern printf
global main

main:
    mov rdi, 4
    mov rsi, 4
    mov rdx, 4
    call kru
    mov rsi, rax
    lea rdi, [rel msg]
    xor rax, rax
    call printf
    ret
