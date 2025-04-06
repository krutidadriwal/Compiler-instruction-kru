# 🛠️ Custom KRU Instruction using a Toy Compiler

This is a simple toy compiler built in C that parses a mini assembly-like language and generates x86-64 assembly. It includes a custom instruction `KRU`. It takes 3 values of sides of triangle and tells wether it is a valid triangle or not. 

---

## 🚀 Features

- Supports the instruction:
  - `KRU a b c` - Pass three sides of a triangle to determine if it's valid.
- Translates high-level instructions into x86-64 assembly.
- Uses a custom `kru.asm` subroutine in NASM.
- Automatically builds and runs the assembly output.
- Built and tested on **Ubuntu (WSL on Windows)**.

---

## 🧠 How KRU Works

The `KRU` instruction calls a custom function written in NASM (`kru.asm`) that receives 3 integers and returns:

- `1` if they can form a triangle (using triangle inequality).
- `0` if they cannot.

---

## 📁 Project Structure

```
toy-compiler/
├── compiler.c     # The C-based parser and code generator
├── kru.asm        # The custom KRU implementation in NASM
├── run.sh         # Build and run script
├── output.s       # Generated assembly (auto-generated)
└── README.md      # This file
```

---

## 🛠️ Build & Run (WSL)

### 1. Run the compiler pipeline:

```bash
./run.sh
```

### 2. Input Instructions:

```text
KRU 3 4 5
END
```

### 3. Output:
```
Result: 1   # (Valid triangle)
```

---

## 🔧 Dependencies

- GCC (with `-no-pie` support)
- NASM
- WSL (Ubuntu) or any Linux env
- Git (optional, for version control)

Install with:

```bash
sudo apt update
sudo apt install gcc nasm
```

---

## 🧪 Example Inputs

| Instruction | Description |
|------------|-------------|
| `KRU 3 4 5` | ✅ Valid triangle |
| `KRU 1 1 5` | ❌ Not a triangle |

---

## 📄 License

This is a learning project. Feel free to fork, modify, and share.

---

Made with 💻 by Kruti
