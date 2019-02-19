%include "io64.inc"

section .data
s_fmt: db "%lld %lld",0
p_fmt: db "%lld ",0
p_fmt1: db "%lld hasn't been found in the array",10,0

segment .bss
array: resq 50
a: resq 1
b: resq 1

section .text
global CMAIN
extern printf
extern scanf

CMAIN:
    xor rax, rax
    mov rdi,s_fmt
    mov rsi,a
    mov rdx,b
    call scanf
    mov rcx,[a]
    xor r11,r11
    for:
        push 2
        push rcx
        call check_prime
        pop rcx
        pop r9
        inc rcx
        cmp rcx,[b]
        jle for
    xor rcx,rcx    
    for1:
        push rcx
        push r11
        mov rdi,p_fmt
        mov rsi,[array+8*rcx]
        xor rax,rax
        call printf
        pop r11
        pop rcx
        inc rcx
        cmp rcx,r11
        jl for1
       
    ret
        
check_prime:
    push rbp
    mov rbp,rsp
    mov rax,[rbp+16]
    mov r8,[rbp+24]
    
    cmp r8,rax
    jge prime
    
    mov r10,rax
    xor rdx,rdx
    idiv r8
    cmp rdx,0
    jz not_prime
    inc r8
    push r8
    push r10
    call check_prime
    pop r10
    pop r8
    leave
    ret
    
prime:
    mov [array+8*r11],rax
    inc r11
    leave
    ret
not_prime:
    leave
    ret
    