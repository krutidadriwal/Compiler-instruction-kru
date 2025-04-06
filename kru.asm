
section .text
global kru

kru:
    ; rdi = a, rsi = b, rdx = c

    mov rax, rdi
    add rax, rsi      ; rax = a + b
    cmp rax, rdx
    jle .not_triangle

    mov rax, rdi
    add rax, rdx      ; rax = a + c
    cmp rax, rsi
    jle .not_triangle

    mov rax, rsi
    add rax, rdx      ; rax = b + c
    cmp rax, rdi
    jle .not_triangle

    mov rax, 1        ; valid triangle
    ret

.not_triangle:
    mov rax, 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

