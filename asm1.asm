section .data
	x db 0
section .bss
section .txt
	global _start

_start:
	mov ah,1 ;input
	int 21h
	mov x,al
	
	mov ah,2 ;output
	mov dl,x
	int 21h
