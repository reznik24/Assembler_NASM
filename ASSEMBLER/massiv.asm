global main:

extern scanf
extern printf


N equ 16

section .bss
var_probel: resq 1
massiv: resq 100
var_what: resb 1

section .text
main:
push rbp
xor rcx, rcx
xor rdx, rdx



mov rcx, N 

push rbp
scanim:

mov rdx, N
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



      mov rcx, N




      mov r14, N
      inc r14

        fsort:

        push rcx

        mov rdx, N
        sub rdx, rcx
        inc rdx

        mov r11, [massiv + 8*rdx]
        mov r15, rdx
        inc r15
        inc r15
        inc r15
        inc r15
        inc r15
        inc r15
        inc r15
        inc r15
        



        cmp r15, r14
        jge ok

        mov r12, [massiv + 8*r15]



        

        add r11, r12

        cmp r11, 127

        jge full

        jng bit

        push r11

        mov r11, r12

        pop r12



        full:
        mov r11, 127
        mov [massiv + 8*rdx], r11
        jmp ok


        bit:
        mov [massiv + 8*rdx], r11

        
        ok:
 pop rcx
        loop fsort






mov rcx, 8
pechataem:

mov rdx, 8
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
