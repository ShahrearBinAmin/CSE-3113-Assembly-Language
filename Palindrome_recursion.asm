%include "io64.inc"

section .data
s_fmt: db "%s",0
p_fmt: db "Not Palindrome",10,0
p_fmt1: db "Palindrome",10,0

segment .bss
s: resb 50
us: resb 50
section .text
global CMAIN
extern printf
extern scanf

CMAIN:
    xor rax, rax
    mov rdi,s_fmt
    mov rsi,s
    call scanf
    
    xor rcx,rcx
    call get_capital
    xor rdx,rdx
    mov r8,2
    mov rax,rcx
    idiv r8
    push 0
    dec rcx
    push rcx
    push rax
    call palindrome_check
    pop r8
    pop r8
    pop r8
    ret
    
get_capital:
    cmp byte[s+rcx],0
    jz endd
    cmp byte[s+rcx],97
    jge make_capital
    inc rcx
    jmp get_capital
    
make_capital:
    sub byte[s+rcx],32
    inc rcx
    jmp get_capital

endd:
    ret

palindrome_check:
    push rbp
    mov rbp,rsp
    mov r8,[rbp+16]
    mov r9,[rbp+24]
    mov r10,[rbp+32]
    cmp r10,r8
    jge palindrome
    mov bl,[s+r9]
    cmp bl,[s+r10]
    jne not_palindrome
    inc r10
    dec r9
    push r10
    push r9
    push r8
    call palindrome_check
    leave
    ret
    
palindrome:
    xor rax, rax
    mov rdi,p_fmt1
    call printf
    leave
    ret
not_palindrome:
    xor rax, rax
    mov rdi,p_fmt
    call printf
    leave
    ret
    