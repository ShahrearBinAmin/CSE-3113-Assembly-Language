%include "io64.inc"

section .data
s_fmt: db "%s",0
p_fmt: db "Given String : %s",10,0
p_fmt1: db "modified String : %s",10,0

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
    
    xor rax, rax
    mov rdi,p_fmt
    mov rsi,s
    call printf
    xor rcx,rcx
    push 0
    call get_unique_character
    xor rax, rax
    mov rdi,p_fmt1
    mov rsi,us
    call printf
    pop r8
    ret
    
    
get_unique_character:
    push rbp
    mov rbp,rsp
    mov r8,[rbp+16]
    mov bl,[s+r8]
    
    cmp bl,0
    jz base_case
    xor rdx,rdx
    call check_uniqueness
    inc r8
    push r8
    call get_unique_character
    pop r9
    leave
    ret
    
base_case:
    leave
    ret
    
check_uniqueness:
    cmp rdx,rcx
    je unique
    cmp bl,[us+rdx]
    je notunique
    inc rdx
    jmp check_uniqueness
    
unique:
    mov [us+rcx],bl
    inc rcx
    ret
notunique:
    ret