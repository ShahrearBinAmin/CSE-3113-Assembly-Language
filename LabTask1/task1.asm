1. segment .data
2. 	fmt: dq "%d",0
3. 	fmt_prnt: dq "%d ",10,0
4. segment .bss
5. 	a: resq 20
6. segment .text
7. 	global main
8. 	extern scanf
9. 	extern printf
10. main:
11. 	push RBP
12. 	
13. 	mov RCX,20
14. 	mov RAX,0
15. 	mov R10,0
16. 	
17. scan_loop:
18. 	push RCX
19. 	push RAX
20. 	push R10 	
21. 	mov RDI,fmt
22. 	mov RBX,a
23. 	add RAX,RBX
24. 	mov RSI,RAX
25. 	xor RAX,RAX
26. 	call scanf
27. 	pop R10
28. 	pop RAX
29. 	pop RCX
30. 	mov RBX,a
31. 	add RBX,RAX
32. 	add R10,[RBX]
33. 	add RAX,8
34. 	loop scan_loop
35. 
36. mov RDI,fmt_prnt
37. mov RSI,R10
38. mov RAX,0
39. call printf
40. 
41. mov RCX,20
42. mov RBX,0
43. 
44. print_loop:
45. 	push RCX	
46. 	mov RDI,fmt_prnt
47. 	mov RSI,[a+8*RBX]
48. 	xor RAX,RAX
49. 	call printf
50. 	inc RBX
51. 	pop RCX
52. 	loop print_loop	
53. pop RBP
54. ret	

