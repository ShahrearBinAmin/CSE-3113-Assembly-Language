1. segment .data
2. 	scfmt: dq "%s",0
3. 	palin: dq "Palindrome",10 , 0
4. 	nonPalin: dq "Nonpalindrome" , 10, 0
5. 	prr: dq "",10,0
6. 	fmt: dq "%lld" , 10 ,0
7. segment .bss
8. 	str: resb 100
9. 	proc_con: resq 1
10. 	main_con: resq 1
11. 	parameter: resq 1
12. 	cnt: resq 1
13. 	print_con: resq 1
14. 	str_len: resq 1
15. 	l: resq 1
16. 	r: resq 1
17. 
18. segment .text
19. 	global main
20. 	extern scanf
21. 	extern printf
22. 
23. main:
24. 	push RBP
25. 
26. 	xor rax ,rax
27. 	mov rdi , scfmt
28. 	mov rsi , str
29. 	call scanf
30. 	xor rcx , rcx
31. 
32. main_loop:
33. 	mov [str_len] , rcx
34. 	mov al , [str+rcx]
35. 	cmp al , 0
36. 	je palin_check
37. 	cmp al , 96
38. 	jg loop_con
39. 	xor al , 20H
40. 	mov [str+rcx] , al
41. loop_con:
42. 	mov rcx , [str_len]
43. 	inc rcx
44. 	jmp main_loop
45. 
46. palin_check:
47. 	xor rax , rax
48. 	mov [l] , rax
49. 	mov rax , [str_len]
50. 	dec rax
51. 	mov [r] , rax
52. checking_loop:
53. 	mov rcx , [l]
54. 	mov rdx , [r]
55. 	mov al , [str+rcx]
56. 	mov bl , [str+rdx]
57. 	cmp al , bl
58. 	jne print_exit
59. 	mov rcx , [l]
60. 	mov rdx , [r]
61. 	inc rcx
62. 	dec rdx
63. 	mov [l] , rcx
64. 	mov [r] , rdx
65. 	cmp rdx , rcx
66. 	jge checking_loop
67. 	
68. 	xor rax ,rax
69. 	mov rdi , palin
70. 	call printf
71. 
72. 	mov rdi , prr
73. 	call printf
74. 	pop RBP
75. 	ret
76. print_exit:
77. 	xor rax ,rax
78. 	mov rdi , nonPalin
79. 	call printf
80. 
81. 	mov rdi, prr
82. 	call printf
83. 	pop RBP
84. 	ret
