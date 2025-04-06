#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum { MOV, KRU } InstrType;

typedef struct {
    InstrType type;
    int a, b, c;  // for triangle sides
} Instr;


Instr program[100];
int instr_count = 0;

// --- Parser ---
void parse_line(char *line) {
    if (strncmp(line, "MOV", 3) == 0) {
        Instr inst;
        inst.type = MOV;
        sscanf(line + 4, "%*s , %d", &inst.a);
        program[instr_count++] = inst;
    } else if (strncmp(line, "KRU", 3) == 0) {
        Instr inst;
        inst.type = KRU;
        sscanf(line + 4, "%d %d %d", &inst.a, &inst.b, &inst.c);
        program[instr_count++] = inst;
    }    
}

// --- Codegen ---
void generate_asm() {
    FILE *f = fopen("output.s", "w");
if (!f) {
    perror("fopen");
    exit(1);
}

    fprintf(f, "section .data\n");
fprintf(f, "msg db \"Result: %%d\", 10, 0\n");

fprintf(f, "section .text\n");
fprintf(f, "extern kru\n");
fprintf(f, "extern printf\n");
fprintf(f, "global main\n\n");
fprintf(f, "main:\n");


for (int i = 0; i < instr_count; ++i) {
    Instr inst = program[i];
    if (inst.type == MOV) {
        fprintf(f, "    mov rax, %d\n", inst.a);
    } else if (inst.type == KRU) {
        fprintf(f, "    mov rdi, %d\n", inst.a);  // side a
        fprintf(f, "    mov rsi, %d\n", inst.b);  // side b
        fprintf(f, "    mov rdx, %d\n", inst.c);  // side c
        fprintf(f, "    call kru\n");
    }
    
}

// Print the result
fprintf(f, "    mov rsi, rax\n");          // Value to print
fprintf(f, "    lea rdi, [rel msg]\n");    // Format string
fprintf(f, "    xor rax, rax\n");          // Clear rax for variadic call
fprintf(f, "    call printf\n");

fprintf(f, "    ret\n");

fclose(f); 
}

int main() {
    char line[100];

    printf("Enter your instructions (end with 'END'):\n");
    while (1) {
        fgets(line, sizeof(line), stdin);
        if (strncmp(line, "END", 3) == 0) break;
        parse_line(line);
    }

    generate_asm();
    printf("Assembly written to output.s\n");
    return 0;
}

