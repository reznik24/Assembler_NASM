global main:

extern scanf
extern printf


section .bss
var1: resd 1
var2: resd 1
section .text

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
xor rax, rax
xor rbx, rbx
mov eax, [var1]
mov ebx, [var2]

mov r8, rax
mov r9, rbx

cmp eax, 0
je caseEA_0

cmp ebx, 0
je caseEB_0

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

mov rax, r8

mul r9

div ebx



mov [var1], eax

mov rdi, format
mov rsi, [var1]
mov rax, 0
call printf
jmp the_end

caseEA_0: 
mov [var1], eax
mov rdi, format
mov rsi, [var1]
mov rax, 0
call printf
jmp the_end

caseEB_0:
mov [var1], ebx
mov rdi, format
mov rsi, [var1]
mov rax, 0
call printf



the_end:
pop rbp
xor rax, rax
ret
format: db "%d", 0
