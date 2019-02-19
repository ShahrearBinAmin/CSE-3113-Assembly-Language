1. segment .data
2. 
3. a: dq 0
4. i: dq 0
5. j: dq 0
6. 
7. save1: dq 0
8. save2: dq 0
9. cnt: dq 0
10. 
11. fmt: dq "%lld ",10,0
12. fmt_put: dq "%lld",0
13. fmt_get: dq "Sum= %lld ",10,0
14. 
15. segment .bss
16. ara resq 21
17. 
18. segment .text
19. global main
20. extern printf
21. extern scanf
22. 
23. main:
24. push RBP
25. 
26. mov RAX,0
27. mov RBX,0
28. mov RCX,0
29. 
30. in_num:
31. 
32. 	cmp RCX,5
33. 	jz zer
34. 	mov [cnt],RCX
35. 	mov RAX,0
36.         mov RDI,fmt_put
37. 	mov RSI,a
38. 	call scanf
39.         mov RAX,[a]
40. 	mov RCX,[cnt]
41. 	mov [ara+RCX*8],RAX
42. 	inc RCX
43.         jmp in_num
44. 	
45. 
46. zer:
47.         mov RAX,0
48.         mov RCX,0
49.         mov R10,0
50. 
51. outer:
52.         cmp RCX,5
53.         jge zero2
54.         mov [cnt],RCX
55.         mov R10,[ara+RCX*8]
56. 
57. inner:     
58.         inc RCX
59.         mov [j],RCX
60.         cmp RCX,5
61.         jge checker
62.         mov RCX,[j]
63.         cmp R10,[ara+RCX*8]
64.         jle inner
65.         mov RCX,[j]
66.         xchg R10,[ara+RCX*8]
67.         jmp inner
68. 
69. checker:
70.         mov RCX,[cnt]
71.         mov [ara+RCX*8],R10
72.         inc RCX
73.         jmp outer
74. 
75. zero2:
76.         mov RAX,0
77.         mov RCX,0
78.         
79. print:
80.         cmp RCX,5
81.         jz Finish
82.         mov RAX,[ara+RCX*8]
83.         inc RCX
84.         mov [cnt],RCX
85.         mov RDI,fmt
86.         mov RSI,RAX
87.         call printf
88.         mov RCX,[cnt]
89.         jmp print
90.         
91. Finish:        
92.         mov RAX,0
93.         pop RBP
94.         ret
