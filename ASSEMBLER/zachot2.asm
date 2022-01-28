global main

section .bss
var_buff: resb 1

section .text

main:
        mov rbx, 329949049 
 
            mov rcx, 60
			metka:

          push rcx
            
            mov rdx, 64
            sub rdx, rcx
            
            mov rax, rbx
			shr rax, cl 
			
			
		    and al, 15	
            cmp al, 10
            
            jge bukva
            
            add rax, 48
            mov [var_buff], al
            mov rax, 1
            mov rdi, 1
            mov rsi, var_buff
            mov rdx, 1 
            syscall
            
            jmp end 
            bukva:
            
            add rax, 87
            mov [var_buff], al
            mov rax, 1
            mov rdi, 1
            mov rsi, var_buff
            mov rdx, 1
            syscall

        end:
        pop rcx
        sub rcx, 4
        cmp rcx, 0
        jl stop
        jmp metka
        stop:

        ret
    

