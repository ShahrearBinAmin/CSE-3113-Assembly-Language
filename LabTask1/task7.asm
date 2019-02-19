1. segment .data
2. 
3. v:		dq 	0
4. c:		dq	0
5. cnt:		dq	0
6. fmt_in:		db	"%s",0
7. fmt		db	"%d",10,0
8. fmt_out1:	db	"Given input: %s",10,0
9. fmt_out2:	db	"Vowels: %lld ",0
10. fmt_out3:	db	"Consonants: %lld ",10,0
11. 
12. 
13. segment .bss
14. array resq 21
15. 
16. 
17. segment .text
18. global main
19. extern printf,scanf,gets
20. 
21. 
22. main:
23. 	push RBP
24. 
25. 	INPUT_STRING:
26. 	mov RDI,array	
27. 	call gets	
28. 	
29. 	mov RCX,0
30. 	mov RBX,0	
31. 
32. 	CNT:
33. 	cmp [array+RCX],RBX
34. 	jz PRINT_INFO
35. 	
36. 	mov AL,[array+RCX]	
37. 
38. 
39. 	cmp AL,'A'
40. 	jz VOWEL
41. 
42. 	cmp AL,'E'
43. 	jz VOWEL
44. 
45. 	cmp AL,'I'
46. 	jz VOWEL
47. 
48. 	cmp AL,'O'
49. 	jz VOWEL
50. 
51. 	cmp AL,'U'
52. 	jz VOWEL
53. 
54. 	cmp AL,' '
55. 	jnz CONSONANT
56. 	
57. 	jmp INCREMENT
58. 
59. 	VOWEL:
60. 	inc qword[v]
61. 	jmp INCREMENT
62. 	
63. 	CONSONANT:
64. 	inc qword[c]
65. 	
66. 	
67. 	INCREMENT:
68. 	inc RCX
69. 	jmp CNT
70. 	
71. 	PRINT_INFO:
72. 	mov RDI,fmt_out1
73. 	mov RSI,array
74. 	call printf
75. 	
76. 	mov rbx,[v]
77. 	add rbx,4
78. 	mov RDI,fmt_out2
79. 	mov RSI,rbx
80. 	call printf
81. 	
82. 	xor rbx,rbx
83. 	
84. 	mov rbx,[c]
85. 	add rbx,6
86. 	mov RDI,fmt_out3
87. 	mov RSI,rbx
88. 	call printf
89. 	
90. END:
91. 	pop RBP
92. ret
