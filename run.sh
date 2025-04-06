#!/bin/bash
set -e
rm -f compiler kru_test output.o kru.o output.s
nasm -f elf64 kru.asm -o kru.o
gcc -Wall -Wextra -no-pie -o compiler compiler.c
./compiler
nasm -f elf64 output.s -o output.o
gcc -no-pie -o kru_test output.o kru.o -lc
./kru_test
