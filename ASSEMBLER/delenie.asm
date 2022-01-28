global main:

extern scanf
extern printf



section .bss
answer: resq 1

prosim1: resq 1
prosim2: resq 1


section .data
var1: dq 13.324
var2: dq 112.123
varfloat: dq 123.1342
format: db "%lf", 0


section .text
main:
   
    finit ; reset fpu geristers
    
    push rbp
    mov rdi, format
    mov rsi, prosim1
    mov rax, 0
    call scanf
    pop rbp

    push rbp
    mov rdi, format
    mov rsi, prosim2
    mov rax, 0
    call scanf
    pop rbp



    fld qword [prosim1]
    fld qword [prosim2]

    fdiv  
    
    fstp qword [answer]

    
    push rbp 
    mov rdi, format
	movq xmm0, qword [answer]
	mov rax, 1			; 1 xmm register
	call printf
    pop rbp

    xor rax, rax
    ret
   
