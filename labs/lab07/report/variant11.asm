%include    'in_out.asm'

  SECTION .data
  div:  DB '10(x+1)-10',0
  msg:  DB 'введите х: ',0
  rem:  DB 'ответ: ',0
  
  SECTION  .bss
  x:    RESB 80
  
  SECTION .text
  GLOBAL _start
   _start:
   
  mov eax, div
  call sprintLF
  mov eax, msg
  call sprint
  
  mov ecx,x
  mov edx, 80
  call sread
  
  mov eax,x
  call atoi
  
  mov eax,eax
  inc eax
  mov ebx,10
  mul ebx
  sub eax,10
  mov edi,eax
  
  mov eax,rem 
  call sprint 
  mov eax,edi
  call iprintLF
  
  call quit
  