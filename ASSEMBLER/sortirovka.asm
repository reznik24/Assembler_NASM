global main:

extern scanf
extern printf


section .bss
varN:   resd 1
var_probel: resq 1
massiv: resq 100
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

mov rdx, [varN]
sub rdx, rcx
inc rdx

push rcx

mov rdi, format
mov rsi, massiv
add rsi, rdx
add rsi, rdx
add rsi, rdx
add rsi, rdx
add rsi, rdx
add rsi, rdx
add rsi, rdx
add rsi, rdx
mov rax, 0
call scanf

pop rcx


loop scanim

        mov r13, [varN] ;number of iterations



        continue:
      

      mov rcx, [varN]




      mov r14, [varN]
      inc r14

        fsort:
        
        push rcx 
        
        mov rdx, [varN]
        sub rdx, rcx
        inc rdx
        
        mov r11, [massiv + 8*rdx]
        mov r15, rdx
        inc r15

        cmp r15, r14 
        je ok
        
        mov r12, [massiv + 8*r15]
         
            

        cmp r11, r12
        
        jg sort

        jng ok
        
        
        sort:
        
        push r11

        ;mov r11, 0 
        mov r11, r12

        pop r12
        

        
        mov [massiv + 8*rdx], r11
        mov [massiv + 8*r15], r12
        
        
        ok:
        
        pop rcx
        loop fsort

        dec r13
        cmp r13, 0
        jne continue
        
        



mov rcx, [varN]
pechataem:

mov rdx, [varN]
sub rdx, rcx
inc rdx
push rcx


push rbp

mov rdi, format
mov rsi, [massiv + 8*rdx]
mov rax, 0
call printf

pop rbp

pop rcx

loop pechataem
pop rbp
pop rbp
xor rax, rax
ret

format: db " %lld", 0
