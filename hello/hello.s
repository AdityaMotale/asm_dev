# x86 Hello World (32 bit)
#
# Compile with:
# as -32 hello.s -o hello.o
# ld -m elf_i386 -o hello hello.o -no-pie

.global _start
.section .text

_start:

    # Write call (4)
    mov $4, %eax # set the sys call type
    mov $1, %ebx # STDOUT code
    lea message, %ecx
    mov $13, %edx
    int $0x80

    # Exit call (1)
    mov $1, %eax
    mov $0, %ebx
    int $0x80

.section .data
    message:
    .ascii "Hello, World\n"
