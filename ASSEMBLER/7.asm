global main:


section .bss
var1: resd 1
var2: resd 1

section .text

extern scanf 
extern printf

main:

push rbp

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

pop rbp

xor rax, rax
ret
format: db "%d", 0
stroka: db "HELLO", 0
