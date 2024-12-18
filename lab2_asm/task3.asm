%include "io64.inc"

section .rodata
    a: dd 1.0          ; Значение a
    b: dd 0.0          ; Значение b (например, 1.0)

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ; x = arctan(2^b) - a
    fld dword[b]       
    fld1                      
    fyl2x
    fld1
    fld st1
    fprem
    f2xm1
    fadd
    fscale
    fstp st1             
    fld1           
    fpatan
    fsub dword[a]       
    fstp st0
    ret
