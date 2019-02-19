segment .data
	scfmt: dq "%s",0
	equalfmt: dq "Equal",10 , 0
	notequalfmt: dq "Not Equal" , 10, 0
	fmt: dq "%lld" , 10 ,0
	prr: dq "",10,0

segment .bss
	str1: resb 100
	str2: resb 100
	loop_con: resq 1
	str1_len: resq 1
	str2_len: resq 1

segment .text
	global main
	extern scanf
	extern printf

main:
	push RBP

	xor rax ,rax
	mov rdi , scfmt
	mov rsi , str1
	call scanf
	
	xor rax , rax
	mov rdi , scfmt
	mov rsi , str2
	call scanf

	xor rcx , rcx
	xor rbx , rbx

main_loop1:
	mov [str1_len] , rcx
	mov al , [str1+rcx]
	cmp al , 0
	je main_loop2
	mov rcx , [str1_len]
	inc rcx
	jmp main_loop1
main_loop2:
	mov [str2_len] , rbx
	mov al , [str2+rbx]
	cmp al , 0
	je equal_check
	mov rbx , [str2_len]
	inc rbx
	jmp main_loop2

equal_check:
	xor rax , rax
	mov rbx , [str1_len]
	mov rcx , [str2_len]
	cmp rbx , rcx
	jne notequal_print

	xor rcx , rcx
	
checking_loop:
	mov rcx , [loop_con]
	mov al , [str1+rcx]
	mov bl , [str2+rcx]
	cmp al , bl
	jne notequal_print
	mov rcx, [loop_con]
	inc rcx
	mov [loop_con] , rcx
	cmp [str1_len] , rcx
	jne checking_loop
	
	xor rax, rax
	mov rdi , equalfmt
	call printf

	xor rax , rax
	mov rdi , prr
	call printf
	
	pop RBP
	ret
notequal_print:
	xor rax, rax
	mov rdi , notequalfmt
	call printf

	xor rax , rax
	mov rdi , prr
	call printf

	pop RBP
	ret
