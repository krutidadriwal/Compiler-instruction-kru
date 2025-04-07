# Toy Compiler with Custom KRU Instruction

This is a simple toy compiler written in C with NASM assembly integration. It supports a custom instruction called `KRU`, which evaluates whether three given integers can form a right-angled triangle using the Pythagorean theorem.



## Technologies Used

- **C Language** for parsing and code generation
- **NASM (x86-64 Assembly)** for implementing the `KRU` logic
- **GCC** for compiling the C and assembly code
- **Bash (run.sh)** for automation

---



## File Structure

```
├── compiler.c      # Main toy compiler logic (parser + codegen)
├── kru.asm         # Assembly function for KRU
├── output.s        # Generated assembly code
├── run.sh          # Script to compile & run everything
```

---

## How It Works

1. You enter instructions like `KRU 3 4 5`.
2. `compiler.c` parses and generates assembly (`output.s`).
3. The `kru.asm` function is linked and called from generated code.
4. Result (`1` for right triangle, else `0`) is printed using `printf`.

---

## Author
Kruti (using Ubuntu on Windows with WSL)

