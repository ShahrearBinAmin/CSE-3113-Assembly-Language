SECTION .data			; data section
	a db 4
	b dq 7777
SECTION .text		        ; code section
        global main		; make label available to linker 
main:				; standard  gcc  entry point
	mov rax,a
