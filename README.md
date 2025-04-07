# 🛠️ Custom KRU Instruction using a Toy Compiler

This is a simple toy compiler written in C with NASM assembly integration. It supports a custom instruction called `KRU`, which evaluates whether three given integers can form a right-angled triangle using the Pythagorean theorem.

---

## Features

- **Custom Instruction:** `KRU a b c`
  - Checks if `a^2 + b^2 == c^2` (Pythagorean triplet check)
  - Returns `1` if true, `0` otherwise

- **MOV Instruction:** `MOV R1, x`
  - Used in earlier versions for setting a value, now optional

- **Output:** Displays result (`1` or `0`) using `printf` from C

---

## 🧠 How KRU Works

The `KRU` instruction calls a custom function written in NASM (`kru.asm`) that receives 3 integers and returns:

- `1` if the sides of the traingle form a right angled triangle (using Pythagorean theorem).

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

### How to Run

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd <repo-directory>
```

### 2. Execute the Compiler
```bash
./run.sh
```

### 3. Sample Input
```txt
KRU 3 4 5
END
```
Expected Output:
```
Result: 1
```

---

### 3. Output Screenshot:
![Output Screenshot](https://github.com/krutidadriwal/Compiler-instruction-kru/blob/main/output_screenshot.jpg)


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
| `KRU 3 4 5` | ✅ Valid right-angled triangle |
| `KRU 5 5 5` | ❌ Not a right-angled triangle |

---

## 📄 License

This is a learning project. Feel free to fork, modify, and share.

---

Made with 💻 by Kruti


