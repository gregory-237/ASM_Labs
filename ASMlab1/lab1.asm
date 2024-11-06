%include "io64.inc"

section .rodata
    space db ' ', 0  

section .bss
    arr: resd 100

section .text
global main
main:
    mov rbp, rsp          ; for correct debugging 
    GET_UDEC 4, r8d      ; N - r8d
    xor ecx, ecx         ; i = 0 - ecx
    
.input_start:
    cmp ecx, r8d
    je .input_end
    GET_DEC 4, [arr + 4*ecx]
    add ecx, 1
    jmp .input_start 

.input_end:
    xor ecx, ecx         ; reset i for outer loop

.outer_loop:
    cmp ecx, r8d - 1
    jae .end
    mov r10d, ecx        ; min_idx = i
    lea r11d, [ecx + 1]  ; j = i + 1

.inner_loop:
    cmp r11d, r8d
    jae .swap            ; if j >= N, we swap
    mov r12d, [arr + 4*r10d]  ; key = arr[min_idx]
    cmp [arr + 4*r11d], r12d
    jl .if_branch        ; if arr[j] < key, update min_idx
    jmp .continue_inner_loop

.if_branch:
    mov r10d, r11d       ; update min_idx

.continue_inner_loop:
    inc r11d
    jmp .inner_loop

.swap:
    ; Swap arr[min_idx] and arr[i]
    cmp r10d, ecx        ; check if min_idx is different from i
    je .next_outer       ; if they are equal, skip swap
    mov r9d, [arr + 4*r10d]
    mov r13d, [arr + 4*ecx]
    mov [arr + 4*ecx], r9d
    mov [arr + 4*r10d], r13d

.next_outer:
    inc ecx              ; increment i
    jmp .outer_loop

.end:  
    xor ecx, ecx         ; reset i for output

.output_start:
    cmp ecx, r8d
    je .output_end
    PRINT_DEC 4, [arr + 4*ecx]
    PRINT_STRING [space]
    add ecx, 1
    jmp .output_start 

.output_end:
    xor ecx, ecx  
    ret
