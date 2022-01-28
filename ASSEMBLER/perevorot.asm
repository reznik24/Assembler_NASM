global main:					
 
extern scanf
extern printf			
 
 
section .bss						
varN:	resd 1										
var_probel: resq 1
massiv: resd 100 
var_what: resb 1

section .text
main:
push rbp
xor rcx, rcx
xor rdx, rdx

mov rdi, format 
mov rsi, varN
mov rax, 0
call scanf


mov rcx, [varN]

push rbp
scanim:
push rcx

mov rdi, format
mov rsi, massiv
add rsi, rcx
add rsi, rcx
add rsi, rcx
add rsi, rcx
mov rax, 0
call scanf

pop rcx

  
loop scanim







mov rcx, [varN]
pechataem:

mov rdx, [varN]
sub rdx, rcx
inc rdx
push rcx





push rbp

mov rdi, format
mov rsi, [massiv + 4*rdx]
mov rax, 0
call printf

pop rbp

pop rcx

loop pechataem
pop rbp
pop rbp
xor rax, rax
ret

format: db " %d", 0
