# x86 Addition (32 bit)
#
# Compile with:
# as -32 addition.s -o addition.o
# ld -m elf_i386 -o addition addition.o -no-pie

.global _start

.section .data
    msg: .ascii "After adding 60 + 30, we get: "
    msg_len = . - msg
    
    new_line: .ascii "\n"

.section .bss
    result: .space 4

.section .text

_start:

    # Print the starting text
    mov $4, %eax
    mov $1, %ebx
    lea msg, %ecx
    mov $msg_len, %edx
    int $0x80

    # Perform Addition
    mov $60, %eax
    mov $30, %ebx

    add %ebx, %eax
    mov %eax, result

    # Print addition result
    mov $4, %eax
    mov $1, %ebx
    lea result, %ecx
    mov $10, %edx
    int $0x80

    # Print the new_line character
    mov $4, %eax
    mov $1, %ebx
    lea new_line, %ecx
    mov $1, %edx
    int $0x80

    # Exit
    mov $1, %eax
    mov $0, %ebx
    int $0x80
