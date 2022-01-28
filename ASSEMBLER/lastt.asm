global main


extern printf

section .bss

var_write: resq 1

section .data

format: db "%lld", 0


section .text

main:

   call calculate_answer ; функция, указанная в усл. задачи
   call print_answer ; вывод ответа функции в стандартный вывод
   ret





   calculate_answer:
   push rbp
   mov rbp,rsp
   mov qword [rbp],5
   mov qword [rbp-8],13
   mov rdx, qword [rbp]
   mov rax, qword [rbp-8]
   add rax,rdx
   mov qword [rbp-16],rax
   mov rax, qword [rbp-16] 
   pop rbp
   ret





   print_answer:
   push rbp
   mov rdi, format
   mov rsi, rax
   mov rax, 0 
   call printf
   pop rbp
   ret
