1. segment .data
2. 	fmt: dq "%d",0
3. 	fmt_prnt: dq "%d ",10,0
4. segment .bss
5. 	a: resq 10
6. segment .text
7. 	global main
8. 	extern scanf
9. 	extern printf
10. main:
11. 	push RBP
12. 	
13. 	mov RCX,10
14. 	mov RAX,0
15. 	
16. scan_loop:
17. 	push RCX
18. 	push RAX 	
19. 	mov RDI,fmt
20. 	mov RBX,a
21. 	add RAX,RBX
22. 	mov RSI,RAX
23. 	xor RAX,RAX
24. 	call scanf
25. 	pop RAX
26. 	pop RCX
27. 	add RAX,8
28. 	loop scan_loop
29. 
30. mov RCX,10
31. mov RAX,0
32. mov RBX,0
33. 
34. first_odd:			;loop from forward
35. 	mov RBX,[a+8*RAX]
36. 	inc RAX
37. 	and RBX,1
38. 	cmp RBX,1
39. 	cmp RAX,5	
40. 	jmp skip		;jump to skip
41. 	jz first_odd_print	;if found any odd then
42. 	loop first_odd
43. 
44. first_odd_print:
45. 	mov RDI,fmt_prnt
46. 	dec RAX
47. 	mov RSI,[a+8*RAX]
48. 	mov RAX,0
49. 	call printf
50. mov RCX,5
51. mov RAX,0
52. mov RBX,0
53. 
54. last_odd:			;loop from backward
55. 	mov RBX,[a+8*RCX]	
56. 	inc RAX
57. 	and RBX,1
58. 	cmp RBX,1
59. 	jz last_odd_print	;if found any odd from
60. 	loop last_odd
61. 
62. last_odd_print:
63. 	mov RDI,fmt_prnt
64. 	mov RSI,[a+8*RCX]
65. 	mov RAX,0
66. 	call printf
67. skip:		
68. pop RBP
69. ret	
