1. segment .data
2. 	n db 0
3. 	fmt_in : dq "%lld",10,0
4. 	fmt_out : dq "*",10,0
5. 	fmt_outl : dq "* ",10,0
6. 	fmt_outb : dq " ",10,0
7. 	fmt_outn : db "",10,0
8. 	fmt_out1 : dq "%lld",10,0
9. 
10. 
11. section .bss 
12. 
13. segment .text
14. 	global main
15. 	extern printf
16. 	extern scanf
17. 
18. main:
19. 
20. 	push RBP
21. 
22. 	mov RAX,0
23. 	mov RDI,fmt_in
24. 	mov RSI,n
25. 	call scanf
26. 
27. 
28. 
29. 
30. 
31. 
32. 	mov RCX,[n]
33. 	dec RCX
34. 	
35. first:
36. 	push RCX
37. 
38. 
39. space:
40. 	push RCX
41. 	mov RDI,fmt_outb
42. 	mov RAX,0
43. 	call printf
44. 	pop RCX
45. 	LOOP space
46. 
47. 	pop RCX
48. 	push RCX
49. 
50. 	mov RAX,[n]
51. 	sub RAX,RCX
52. 	mov RCX,RAX
53. 	
54. 	
55. line:
56. 	push RCX
57. 	mov RDI,fmt_outl
58. 	mov RAX,0
59. 	call printf
60. 	pop RCX
61. 	LOOP line
62. 
63. 	mov RDI,fmt_outn	;for printing new line
64. 	mov RAX,0
65. 	call printf
66. 	
67. 	pop RCX
68. 	LOOP first
69. 
70. 
71. 
72. 
73. 	mov RCX,[n]
74. 	Add RCX,RCX
75. 	dec RCX
76. 	
77. last:
78. 	push RCX
79. 	mov RDI,fmt_out
80. 	mov RAX,0
81. 	call printf
82. 	pop RCX
83. 	LOOP last
84. 
85. 	pop RBP
86. 	ret

