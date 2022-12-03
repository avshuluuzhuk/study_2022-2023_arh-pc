%include  'in_out.asm'

 SECTION .data
 msg1 DB 'найти наименьшее из 3 переменных: А=21, В=28, С=34',0h
 msg2 DB 'наименьшее: ',0h
 A DD '21'
 B DD '28'
 C DD '34'
 
 SECTION .bss
 min RESB 10
 
 SECTION .text 
 GLOBAl _start
 _start:
 
 mov eax,msg1
 call sprintLF
 
 mov ecx,[A]
 mov [min],ecx
 
 cmp ecx,[B]
 jl check_C
 mov ecx,[B]
 mov [min],ecx
 
 check_C:
 mov eax,min
 call atoi
 mov [min],eax
 
 mov ecx,[min]
 cmp ecx,[C]
 jl fin
 mov ecx,[C]
 mov [min],ecx
 
 fin:
 mov eax, msg2
 call sprint
 mov eax,[min]
 call iprintLF
 call quit
 
 