segment .data
	scfmt: dq "%s",0
	palin: dq "Palindrome",10 , 0
	nonPalin: dq "Nonpalindrome" , 10, 0
	prr: dq "",10,0
	fmt: dq "%lld" , 10 ,0
segment .bss
	str: resb 100
	proc_con: resq 1
	main_con: resq 1
	parameter: resq 1
	cnt: resq 1
	print_con: resq 1
	str_len: resq 1
	l: resq 1
	r: resq 1

segment .text
	global main
	extern scanf
	extern printf

main:
	push RBP

	xor rax ,rax
	mov rdi , scfmt
	mov rsi , str
	call scanf
	xor rcx , rcx

main_loop:
	mov [str_len] , rcx
	mov al , [str+rcx]
	cmp al , 0
	je palin_check
	cmp al , 96
	jg loop_con
	xor al , 20H
	mov [str+rcx] , al
loop_con:
	mov rcx , [str_len]
	inc rcx
	jmp main_loop

palin_check:
	xor rax , rax
	mov [l] , rax
	mov rax , [str_len]
	dec rax
	mov [r] , rax
checking_loop:
	mov rcx , [l]
	mov rdx , [r]
	mov al , [str+rcx]
	mov bl , [str+rdx]
	cmp al , bl
	jne print_exit
	mov rcx , [l]
	mov rdx , [r]
	inc rcx
	dec rdx
	mov [l] , rcx
	mov [r] , rdx
	cmp rdx , rcx
	jge checking_loop
	
	xor rax ,rax
	mov rdi , palin
	call printf

	mov rdi , prr
	call printf
	pop RBP
	ret
print_exit:
	xor rax ,rax
	mov rdi , nonPalin
	call printf

	mov rdi, prr
	call printf
	pop RBP
	ret
