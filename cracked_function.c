#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>
#include <limits.h>  
#include <unistd.h>
#include <unistd.h>
void func1();
void func2();
void func_hack();


void func1(){

    printf("ot korobki do nk ");

}
void func2(){

    printf("RT RT ");

}
void func_hack(){
   long long int* adr1 = &func1;
   long long int* adr2 = &func2; 
   size_t page_size = sysconf(_SC_PAGESIZE);

   long long int* pagestart = (long long int) adr1 - (long long int)adr1 % page_size;
   if (mprotect (pagestart , page_size , PROT_WRITE | PROT_EXEC)) {
        perror("Невозможно выполнить mprotect");
        exit(errno);
   }
 

   int size_jump = (long long int)adr2 - (long long int)adr1 - 2;
   size_jump = size_jump * 16*16;
   *adr1 = size_jump + 0xeb;


}

int main(){
 
    func_hack();

    func1();

    func2();


}




