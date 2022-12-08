%include 'in_out.asm'

SECTION .data 
msg1 db "функция f(x)=15x+2",0
msg2 db "результат: ",0

SECTION .text 
global _start 

_start:

pop ecx
pop edx
sub ecx,1
mov esi,0

next:
cmp ecx,0h
jz _end 

pop eax
call atoi
mov ebx,15
mul ebx 
add eax,2
add esi,eax

loop next 

_end:
mov eax,msg1 
call sprintLF
mov eax,msg2
call sprint
mov eax,esi
call iprintLF

call quit 