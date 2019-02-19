segment .data
	n db 0
	fmt_in : dq "%lld",10,0
	fmt_out : dq "*",10,0
	fmt_outl : dq "* ",10,0
	fmt_outb : dq " ",10,0
	fmt_outn : db "",10,0
	fmt_out1 : dq "%lld",10,0


section .bss 

segment .text
	global main
	extern printf
	extern scanf

main:

	push RBP

	mov RAX,0
	mov RDI,fmt_in
	mov RSI,n
	call scanf






	mov RCX,[n]
	dec RCX
	
first:
	push RCX


space:
	push RCX
	mov RDI,fmt_outb
	mov RAX,0
	call printf
	pop RCX
	LOOP space

	pop RCX
	push RCX

	mov RAX,[n]
	sub RAX,RCX
	mov RCX,RAX
	
	
line:
	push RCX
	mov RDI,fmt_outl
	mov RAX,0
	call printf
	pop RCX
	LOOP line

	mov RDI,fmt_outn	;for printing new line
	mov RAX,0
	call printf
	
	pop RCX
	LOOP first




	mov RCX,[n]
	Add RCX,RCX
	dec RCX
	
last:
	push RCX
	mov RDI,fmt_out
	mov RAX,0
	call printf
	pop RCX
	LOOP last

	pop RBP
	ret
