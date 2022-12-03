%include 'in_out.asm'

 SECTION .data
 msg1 DB 'введите х: ',0h
 msg2 DB 'введите a: ',0h
 msg3 DB '4а= ',0h
 msg4 DB '4a+х= ',0h
 
 SECTION .bss
 x:  RESB 80
 a:  RESB 80
 
 SECTION .text
 GLOBAL _start
 _start:

 mov eax, msg1
 call sprintLF
 
 mov ecx, x 
 mov edx, 80
 call sread

 mov eax,x
 call atoi
 mov [x],eax 
 
 mov eax, msg2
 call sprintLF
 
 mov ecx, a
 mov edx, 80
 call sread
 
 mov eax,a
 call atoi
 mov [a],eax
 
 mov ecx,[x]
 cmp ecx,0
 jne check_x
 mov ecx,0
 
 mov eax,[a]
 mov ebx,4
 mul ebx 
 mov edi,eax
 
 mov eax,msg3
 call sprint
 mov eax,edi
 call iprintLF
 
 check_x:
 mov eax,[x]
 mov [x],eax
 
 mov eax,[a]
 mov ebx,4
 mul ebx 
 add eax,[x]
 mov edi, eax 
 
 mov eax,msg4
 call sprint
 mov eax,edi
 call iprintLF
 
 call quit 