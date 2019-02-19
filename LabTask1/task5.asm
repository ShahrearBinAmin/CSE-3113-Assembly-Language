1. segment .data
2. sfmt: dq "Smallest number %lld was found at location %lld ",10,0
3. lfmt: dq "Largest number %lld was found at location %lld ",10,0
4. ssfmt: dq "%lld",0
5. 
6. 
7. segment .bss
8. a: resq 255
9. b: resq 1
10. c: resq 1
11. d: resq 1
12. cnt:  resq 2
13. now: resq 2
14. 
15. segment .text
16. global main
17. extern printf
18. extern scanf
19. 
20. main:
21. 	push RBP
22. 	xor rcx, rcx
23. 
24. ll:
25. 	mov rbx , rcx
26. 	mov [b], rcx
27. 	xor rax, rax
28. 	mov rdi , ssfmt
29. 	mov rsi, d
30. 	call scanf
31. 	mov rax , [d]
32. 	mov qword[a+rbx*8],rax
33. 	mov rcx , [b]
34. 	INC rcx
35. 	cmp rcx , 5
36. 	jne ll
37. 
38. xor rbx , rbx
39. mov r8 , 0
40. mov [d] , r8
41. mov rbx , [a]
42. mov [b] , rbx
43. mov rcx  , 1
44. 
45. first:
46. 	mov [c], rcx
47. 	mov rax , qword[a+rcx*8]
48. 	mov rdx , [b]
49. 	cmp rax , rdx
50. 	jg first_con
51. mov [b],rax
52. mov rcx , [c]
53. mov [d] , rcx
54. 
55. first_con:
56. 	INC rcx
57. 	cmp rcx , 5
58. 	jne first
59. 
60. xor rax , rax
61. mov rdi , sfmt
62. mov rsi , [b]
63. mov rdx , [d]
64. call printf
65. 
66. xor rbx , rbx
67. mov r8 , 0
68. mov [d] , r8
69. mov rbx , [a]
70. mov [b] , rbx
71. mov rcx  , 1
72. 
73. second:
74. 	mov [c], rcx
75. 	mov rax , qword[a+rcx*8]
76. 	mov rdx , [b]
77. 	cmp rax , rdx
78. 	jl second_con
79. 	mov [b],rax
80. 	mov rcx , [c]
81. 	mov [d] , rcx
82. 
83. second_con:
84. 	INC rcx
85. 	cmp rcx , 5
86. 	jne second
87. 
88. xor rax , rax
89. mov rdi , lfmt
90. mov rsi , [b]
91. mov rdx , [d]
92. call printf
93. 
94. 
95. pop RBP
96. ret

