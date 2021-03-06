segment .data
	fmt_scan: dq "%lld %lld",10,0
	fmt_print: dq "%lld",10,0	
segment .bss
	a: resq 1
	b: resq 1
	array: resq 255
segment .text
	global main
	extern printf
	extern scanf
main:
	push RBP
	
	mov RDI,fmt_scan
	mov RSI,a
	mov RDX,b
	xor RAX,RAX
	call scanf

	mov RAX,[a]
	mov RBX,[b]

	mov RCX,RAX
	sub RCX,RBX
	xor R10,R10
	mov R8,RCX

ly:
	push RAX
	mov RBX,400
	xor RDX,RDX
	div RBX
	cmp RDX,0
	pop RAX
	jz inc
	
	push RAX
	mov RBX,4
	xor RDX,RDX
	div RBX
	cmp RDX,0
	pop RAX
	jnz not_inc
	
	push RAX
	mov RBX,100
	xor RDX,RDX
	div RBX
	cmp RDX,0
	pop RAX
	jz not_inc
	

inc:
	;mov [array+8*R10],RAX
	inc R10
	inc RAX
	loop ly
	jmp skip

not_inc:

	inc RAX
	loop ly
	
skip:
push R10
mov RDI,fmt_print
mov RSI,R10
xor RAX,RAX
call printf
pop R10

mov RCX,R10
mov RBX,0

print_loop:
	push RCX	
	mov RDI,fmt_print
	mov RSI,[array+8*RBX]
	xor RAX,RAX
	call printf
	inc RBX
	pop RCX
	loop print_loop	
finish:
	pop RBP
	ret

