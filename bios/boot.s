.code16

.section .text.entry
    call clear
    call print_b
    #call long_mode
    mov $1048576, %esp
    call main
    call print_b
pause:
    jmp pause

long_mode:
    call enable_a20
    ret

enable_a20:
    in $0x92, %al
    or $2, %al
    out %al, $0x92
    ret

clear:
    mov $0x0f, %ah
    int $0x10
    mov $0x107, %al
    mov $0x00, %ah
    int $0x10
    ret

print_b:
    mov $'b', %al
    mov $0x0e, %ah
    int $0x10
    ret

.org 510
.word 0xaa55
