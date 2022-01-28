global _start					
 
extern scanf
extern printf			
 
 
section .bss						
var1:	resd 1										
var2:   resd 1 
section .text
_start:

mov rdi, format 
mov rsi, var1
mov rax, 0
call scanf


mov rdi, format
mov rsi, var2
mov rax, 0
call scanf

mov eax, [var1]
mov ebx, [var2]
sub eax, ebx
mov [var1], eax

mov rdi, format 
mov rsi, [var1]
mov rax, 0
call printf


xor rax, rax
ret
 
format: db "%d", 0
 
 
exit:						
	mov rax, 60					
	xor rdi, rdi					
	syscall
	ret
