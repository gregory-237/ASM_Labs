%include "io64.inc"

section .rodata:
    x: dd 1.9

section .text
global main
main:
    mov rbp, rsp 
    movss xmm0, dword[x]
    roundss xmm0, xmm0, 3  ; Округление вниз
    cvtss2si eax, xmm0
    PRINT_DEC 4, eax
    xor eax, eax
    ret
