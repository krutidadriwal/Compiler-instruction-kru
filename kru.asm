section .text
global kru

kru:
    ; Input: rdi = a, rsi = b, rdx = c
    ; Output: rax = 1 if right-angled, 0 otherwise

    ; Step 1: find max(a, b, c)
    mov r8, rdi        ; r8 = a
    mov r9, rsi        ; r9 = b
    mov r10, rdx       ; r10 = c

    ; Find the largest of a, b, c and put it in r11 (hypotenuse)
    mov r11, r8
    cmp r9, r11
    jle .skip1
    mov r11, r9
.skip1:
    cmp r10, r11
    jle .skip2
    mov r11, r10
.skip2:

    ; Now r11 = hypotenuse (c)
    ; Put other two in r12 and r13
    ; First initialize r12 and r13 with a, b
    mov r12, r8
    mov r13, r9

    ; Adjust r12 and r13 if c is in r10
    cmp r11, r8
    jne .check_b
    mov r12, r9
    mov r13, r10
    jmp .squares
.check_b:
    cmp r11, r9
    jne .check_c
    mov r12, r8
    mov r13, r10
    jmp .squares
.check_c:
    mov r12, r8
    mov r13, r9

.squares:
    ; r11 = hypotenuse, r12 & r13 = other sides
    ; Check r12^2 + r13^2 == r11^2
    mov rax, r12
    imul rax, r12      ; rax = r12^2
    mov rbx, r13
    imul rbx, r13      ; rbx = r13^2
    add rax, rbx       ; rax = r12^2 + r13^2

    mov rcx, r11
    imul rcx, r11      ; rcx = r11^2

    cmp rax, rcx
    jne .not_right
    mov rax, 1         ; is right-angled
    ret

.not_right:
    mov rax, 0         ; not a right triangle
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
