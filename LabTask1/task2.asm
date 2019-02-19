1. segment .data
2. 	fmt: dq "%d",0
3. 	fmt_prnt: dq "%d ",10,0
4. segment .bss
5. 	a: resq 10
6. 	index: resq 1
7. segment .text
8. 	global main
9. 	extern scanf
10. 	extern printf
11. main:
12. 	push RBP
13. 	
14. 	mov RCX,10
15. 	mov RAX,0
16. 	mov R10,0
17. 	
18. scan_loop:
19. 	push RCX
20. 	push RAX
21. 	push R10 	
22. 	mov RDI,fmt
23. 	mov RBX,a
24. 	add RAX,RBX
25. 	mov RSI,RAX
26. 	xor RAX,RAX
27. 	call scanf
28. 	pop R10
29. 	pop RAX
30. 	pop RCX
31. 	add RAX,8
32. 	loop scan_loop
33. 
34. mov RDI,fmt
35. mov RSI,index
36. mov RAX,0
37. call scanf
38. 
39. mov RBX,[index]
40. dec RBX
41. 
42. mov RDI,fmt_prnt
43. mov RSI,[a+8*RBX]
44. mov RAX,0
45. call printf
46. 
47. pop RBP
48. ret	
49. 	

