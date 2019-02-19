%include "io64.inc"

section .data
s_fmt: db "%lld",0
p_fmt: db "%lld has been found at position %lld",10,0
p_fmt1: db "%lld hasn't been found in the array",10,0

segment .bss
array: resq 50
n: resq 1
x: resq 1

section .text
global CMAIN
extern printf
extern scanf

CMAIN:
    xor rax, rax
    mov rdi,s_fmt
    mov rsi,n   ;number of elements in the input array
    call scanf
    xor rcx,rcx
    mov rbx,array
    get_input:
        push rcx
        push rbx
        xor rax, rax
        mov rdi,s_fmt
        mov rsi,rbx
        call scanf
        pop rbx
        pop rcx
        inc rcx
        add rbx,8
        cmp rcx,[n]
        jl get_input
        
    xor rax, rax
    mov rdi,s_fmt
    mov rsi,x   ;value to be searched for
    call scanf
    
    mov rcx,[n]
    dec rcx
    mov rdx,[x]
    ;in cpp, this function looks like binary_search(int low,int high,int val)
    push 0
    push rcx
    push rdx
    call binary_search; it's like calling binary_search from the main function with value of low=0,high=n-1 and val=x
    pop r10
    pop r10
    pop r10
    ret
    
binary_search:
    push rbp
    mov rbp,rsp
    mov rbx,[rbp+16];value of x
    mov r9,[rbp+24];value of hi
    mov r8,[rbp+32]; value of lo
    
    cmp r8,r9
    jg not_found
    
    xor rdx,rdx
    mov rax,r8
    add rax,r9
    mov rcx,2
    idiv rcx; rax=(r8+r9)/2 which is mid=(low+high)/2
    
    cmp rbx,[array+8*rax]; check if the current position's value is the one we are looking for or not
    je found_it
    jl lesser
    jg greater 
    
    back:
    push r8; new low
    push r9; new high
    push rbx; value of x       
    call binary_search;recursive call
    pop r10
    pop r10
    pop r10
    leave
    ret
lesser:
    mov r9,rax ;update high=mid-1.
    dec r9  
    jmp back
greater:
    mov r8,rax ;upadte low=mid+1
    inc r8
    jmp back
    
found_it:
    inc rax
    mov rdi,p_fmt
    mov rsi,rbx
    mov rdx,rax
    xor rax,rax
    call printf
    leave
    ret
not_found:
    mov rdi,p_fmt1
    mov rsi,rbx
    xor rax,rax
    call printf
    leave
    ret
