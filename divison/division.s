# x86 Division (32 bit)
#
# Compile with:
# as -32 division.s -o division.o
# ld -m elf_i386 -o division division.o -no-pie

.global _start

.section .data

    msg: .ascii "After 120 / 2, we get: "
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

        # Perform division
        mov $120, %eax
        xor %edx, %edx # clear `edx` to ensure the high 32 bits are zero
        mov $2, %ebx

        div %ebx

        mov %eax, result

        # Print the result
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
