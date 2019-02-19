;Author : Sanjib Narzary
;Institute: NIT Calicut
;Email: o-._.-o@live.com
;Assembly Code
section .data
	;New line string
	NEWLINE: db 0xa, 0xd
	LENGTH: equ $-NEWLINE
section .bss
	INPT: resd 1

section .text
	global _start
_start:
	
	;Read character
	mov eax, 0x3
	mov ebx, 0x1
	mov ecx, INPT
	mov edx, 0x1
	int 80h

	;print character
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, INPT
	mov edx, 0x1
	int 80h

	;Print new line after the output 
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, NEWLINE
	mov edx, LENGTH
	int 0x80

	;Terminate
	mov eax, 0x1
	xor ebx, ebx
	int 0x80