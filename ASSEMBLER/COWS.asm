global main:
    
extern scanf
extern printf
    
section .bss
answer: resq 1
    
coordinata: resq 1
prosim2: resq 1
    
section .data
varHALF: dq 2.0
varTHIRD: dq 3.0

nolik: dq 0.0
edinica: dq -1.0
    
point: dq 1.0

flag: dq -1.5

summa: dq 0.0


format: db "%lf", 0

stroka: db "IT IS WORK", 0
    
section .text
main:
    

finit ; reset fpu geristers
    
    push rbp
    mov rdi, format
    mov rsi, coordinata
    mov rax, 0
    call scanf
    pop rbp
    
    push qword [flag]
    ; положим в начало стека число -1.5, чтобы остановить программу, когда вытащим из стека это число
    
    push qword [nolik]
    pop qword [summa]             ; нам необходимо чтобы на старте программы в СУММЕ лежало значение НОЛЬ
    
  
  push qword [coordinata]   ; прочитали введённую координату

    fld qword [coordinata]
    fld qword [edinica]
    fadd
    fld qword [summa]
    fadd
    fstp qword [summa]


 AGAIN:
  ;----------------------------------------------------------------------- примерно здесь будет начало цикла 
    
    
    
  pop qword [point]  
  ; здесь нужно взять значение из стека  
    
    
    fld qword [point]   ; то, что делиM 

    
fcom qword [flag]
fstsw ax
and eax, 0100011100000000B                             ;сравнили значение точки из стека с -1.5 (флаговое) и если равно, то завершаем программу
cmp eax, 0100000000000000B ;is st0 = source ?
je flagcase     


    fld qword [varHALF] ; то, на что делим
              
    fdiv               ; выполняем деление           
    
    fst qword [answer] ; из стека fpu выгружаем в answer результат, FST чтобы осталось это значение там
    
    fld qword [edinica]
    fadd
; после чего положим на стек FPU минус единицу и выполним fadd, на стеке FPU останется ( координата минус единица ) - молоко


fcom qword [nolik]
fstsw ax
and eax, 0100011100000000B                             ; сравнили *молоко* с нулём, если оно отрицательно, то не будем push qword [answer], эта точка нам уже не нужна  
cmp eax, 0000000100000000B ;is st0 < source ?
je YouShallNotPass1                ;в случае отрицательного молока прыжок на YouShallNotPass,пропускаем этап push qword [answer] и, конечно, суммы молока к общей сумме тоже не будет
  
; сравниваем то, что осталось на стеке FPU  (молоко) с нулём, и если меньше нуля, то значит после деления координата меньше 1, тогда пропустим шаг выгрузки значения координаты на стек(обычный)
; и конечно же пропустим шаг добавления молока к сумме

fld qword [summa]
fadd                  ; положили в fpu текущее значение суммы, суммировали его с молоком, результат положили обратно - в сумме лежит актуальная сумма молока
fstp qword [summa]


push qword [answer] ; положили на стек значение полученной точки (новой координаты, не молока)


YouShallNotPass1:
fninit

; после чего закидываем на стек FPU  число из summa и выполняем fadd,  и это число fstp обратно в summa, таким образом суммируем все значения
 ; и делаем push qword [answer] - положим на стек результат после деления, который больше единицы, так как молоко неотрицательное (если прошло проверку) а стало быть ему ещё предстоит поделиться




    fld qword [point]   ; то, что делим

    fld qword [varTHIRD] ; то, на что делим

    fdiv               ; выполняем деление           
    
    
    fst qword [answer] ; из стека fpu выгружаем в answer результат
   
    fld qword [edinica]
    fadd           ;в st0 молоко
    
fcom qword [nolik]
fstsw ax
and eax, 0100011100000000B                             ; сравнили *молоко* с нулём, если оно отрицательно, то не будем push qword [answer], эта точка нам уже не нужна  
cmp eax, 0000000100000000B ;is st0 < source ?
je YouShallNotPass2                ; в случае отриц молока не суммируем его и не push 


fld qword [summa]
fadd
fstp qword [summa]

push qword [answer]


YouShallNotPass2:
fninit


jmp AGAIN
;---- здесь снова должен начаться цикл
    
   jmp noflag 
    
   flagcase:

   ; mov rdi, stroka
   ; mov rax, 0
   ; call printf
   ; jmp theend
    
    noflag:


    
    push rbp
    mov rdi, format
 
    movq xmm0, qword [summa]
    mov rax, 1          ; 1 xmm register
    call printf
    pop rbp
    
    
    theend:
    xor rax, rax
    ret
