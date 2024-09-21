# x86 Subtraction (32 bit)
#
# Compile with:
# as -32 subtraction.s -o subtraction.o
# ld -m elf_i386 -o subtraction subtraction.o -no-pie

.global _start

.section .data
    msg: .ascii "After subtracting 10 from 90, we get: "
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

    # Perform subtraction
    mov $90, %eax
    mov $10, %ebx
    sub %ebx, %eax

    mov %eax, result

    # Print result
    mov $4, %eax
    mov $1, %ebx
    lea result, %ecx
    mov $4, %edx
    int $0x80

    # Print new_line char
    mov $4, %eax
    mov $1, %ebx
    lea new_line, %ecx
    mov $1, %edx
    int $0x80

    # Exit
    mov $1, %eax
    mov $0, %ebx
    int $0x80
