%include "io64.inc"
section .data
fmt: db "%lld %lld",10,0
fmt1: db "GCD = %lld",10,0
section .bss
n1: dq 1
n2: dq 1
section .text
global CMAIN
extern printf
extern scanf
CMAIN:
    ;write your code here
    push rbp
    xor rax,rax
    mov rdi,fmt
    mov rsi,n1
    mov rdx,n2
    call scanf
    mov r12,1
    mov rdx,[n1]
    push rdx
    mov rdx,[n2]
    push rdx
    call F
    xor rax,rax
    mov rdi,fmt1
    mov rsi,r11
    call printf
    pop rax
    pop rax
    pop rbp
    ret
    
F:
    push rbp
    mov rbp,rsp
    mov rax,[rbp+16]
    mov r11,[rbp+24]
    xor rdx,rdx
    idiv r11
    cmp rdx,0
    je END
    push r11
    push rdx
    push r11
    call F
    
END:
    cmp r12,0
    jne print
    leave
    ret
    
print:
    xor r12,r12
    leave
    ret