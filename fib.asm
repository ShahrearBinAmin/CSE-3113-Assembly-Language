%include "io64.inc"
section .data
fmt: db "%lld",10,0
section .bss
n: dq 1
sum: dq 1
section .text
global CMAIN
extern printf
extern scanf
CMAIN:
    ;write your code here
    push rbp
    xor rax,rax
    mov rdi,fmt
    mov rsi,n
    call scanf
    mov r12,1
    mov rdx,[n]
    push rdx
    push 0
    push 1
    push 1
    call F
    xor rax,rax
    mov rdi,fmt
    mov rsi,r13
    call printf
    pop rax
    pop rax
    pop rax
    pop rax
    pop rbp
    ret
    
F:
    push rbp
    mov rbp,rsp
    mov rax,[rbp+16]
    mov r11,[rbp+24]
    mov r10,[rbp+32]
    mov rcx,[rbp+40]
    cmp rax,rcx
    je END
    mov rdx,r11
    add r11,r10
    inc rax
    push rcx
    push rdx
    push r11
    push rax
    call F
    
    
END:
    cmp r12,0
    jne print
    leave
    ret
    
print:
    mov r13,[rbp+24]
    xor r12,r12
    leave
    ret