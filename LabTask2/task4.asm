1. segment .data
2. 	scfmt: dq "%s",0
3. 	equalfmt: dq "Equal",10 , 0
4. 	notequalfmt: dq "Not Equal" , 10, 0
5. 	fmt: dq "%lld" , 10 ,0
6. 	prr: dq "",10,0
7. 
8. segment .bss
9. 	str1: resb 100
10. 	str2: resb 100
11. 	loop_con: resq 1
12. 	str1_len: resq 1
13. 	str2_len: resq 1
14. 
15. segment .text
16. 	global main
17. 	extern scanf
18. 	extern printf
19. 
20. main:
21. 	push RBP
22. 
23. 	xor rax ,rax
24. 	mov rdi , scfmt
25. 	mov rsi , str1
26. 	call scanf
27. 	
28. 	xor rax , rax
29. 	mov rdi , scfmt
30. 	mov rsi , str2
31. 	call scanf
32. 
33. 	xor rcx , rcx
34. 	xor rbx , rbx
35. 
36. main_loop1:
37. 	mov [str1_len] , rcx
38. 	mov al , [str1+rcx]
39. 	cmp al , 0
40. 	je main_loop2
41. 	mov rcx , [str1_len]
42. 	inc rcx
43. 	jmp main_loop1
44. main_loop2:
45. 	mov [str2_len] , rbx
46. 	mov al , [str2+rbx]
47. 	cmp al , 0
48. 	je equal_check
49. 	mov rbx , [str2_len]
50. 	inc rbx
51. 	jmp main_loop2
52. 
53. equal_check:
54. 	xor rax , rax
55. 	mov rbx , [str1_len]
56. 	mov rcx , [str2_len]
57. 	cmp rbx , rcx
58. 	jne notequal_print
59. 
60. 	xor rcx , rcx
61. 	
62. checking_loop:
63. 	mov rcx , [loop_con]
64. 	mov al , [str1+rcx]
65. 	mov bl , [str2+rcx]
66. 	cmp al , bl
67. 	jne notequal_print
68. 	mov rcx, [loop_con]
69. 	inc rcx
70. 	mov [loop_con] , rcx
71. 	cmp [str1_len] , rcx
72. 	jne checking_loop
73. 	
74. 	xor rax, rax
75. 	mov rdi , equalfmt
76. 	call printf
77. 
78. 	xor rax , rax
79. 	mov rdi , prr
80. 	call printf
81. 	
82. 	pop RBP
83. 	ret
84. notequal_print:
85. 	xor rax, rax
86. 	mov rdi , notequalfmt
87. 	call printf
88. 
89. 	xor rax , rax
90. 	mov rdi , prr
91. 	call printf
92. 
93. 	pop RBP
94. 	ret

