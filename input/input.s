# x86 Input (32 bit)
#
# Compile with:
# as -32 input.s -o input.o
# ld -m elf_i386 -o input input.o -no-pie

.global _start

.section .bss
    input_buffer:
        .space 100 # Reserve 100 bytes for input 

.section .text

_start:
    # Read call (3)
    mov $3, %eax
    mov $0, %ebx # STDIN code
    lea input_buffer, %ecx
    mov $100, %edx
    int $0x80

    # Write Call (4)
    mov $4, %eax
    mov $1, %ebx # STDOUT code
    lea input_buffer, %ecx
    mov $100, %edx
    int $0x80

    # Exit Call (1)
    mov $1, %eax
    mov $0, %ebx
    int $0x80
