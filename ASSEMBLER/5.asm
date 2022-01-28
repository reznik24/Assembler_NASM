global main

extern scanf
extern printf


section .bss
var1: resd 1
var2: resd 1
section .text

main:

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

cmp eax, ebx

je done

search:
cmp eax, ebx

jg right

sub ebx, eax
jmp pak

right:
sub eax, ebx

pak:

cmp eax, ebx
jne search

done:

mov [var1], eax

mov rdi, format
mov rsi, [var1]
mov rax, 0
call printf
ret
format: db "%ld", 0
