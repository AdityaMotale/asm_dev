# x86 Multiplication (32 bit)
#
# Compile with:
# as -32 multiplication.s -o multiplication.o
# ld -m elf_i386 -o multiplication multiplication.o -no-pie

.global _start

.section .data

    msg: .ascii "After 20 * 5, we get: "
    msg_len = . - msg

    new_line: .ascii "\n"

.section .bss

    result: .space 4

.section .text

_start:

    # Print starting text
    mov $4, %eax
    mov $1, %ebx
    lea msg, %ecx
    mov $msg_len, %edx
    int $0x80

    # Perform multiplication
    mov $20, %eax
    mov $5, %ebx

    mul %ebx
    
    mov %eax, result

    # Print the result
    mov $4, %eax
    mov $1, %ebx
    lea result, %ecx
    mov $4, %edx
    int $0x80

    # Print new_line character
    mov $4, %eax
    mov $1, %ebx
    lea new_line, %ecx
    mov $1, %edx
    int $0x80

    # Exit
    mov $1, %ecx
    mov $0, %ebx
    int $0x80
