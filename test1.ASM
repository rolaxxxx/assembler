format PE console ;Console type of project
entry main

include 'macro/import32.inc'
include 'macro/proc32.inc'



section '.data' data readable writeable
msg1 db 'Iveskite du sveikus skaicius kuriuos norite palyginti  ' , 0
msg2 db "%d" , 0
msg3 db "pirmas skaicius didesnis : %d "  , 10,0
msg4 db "antras skaicius didesnis : %d "  , 10,0
msg5 db 'iveskite viena skaiciu kuri norite patikrinti ar jis lyginis ar ne ? ' , 0

msg6 db 'skaicius yra lyginis ', 0
msg7 db 'skaicius yra nelyginis ', 0
msg8 db 'iveskite du skaicius bei matematini simboli tarp ju ', 0
p db "pause>nul", 0
kint1 dd ?
kint2 dd ?
kint3 dd ?
kint4 dd ?
kint5 dd ?

section '.code' code readable executable
main:
;pirma uzduotis
        push msg1
        call [printf]

        push kint1
        push msg2
        call [scanf]

        push kint2
        push msg2
        call [scanf]

        mov eax, [kint1]
        mov ebx, [kint2]

        cmp eax, ebx
        ja first_larger
        cmp eax, ebx
        jb second_larger





first_larger:
        push eax
        push msg3
        call [printf]
        jmp uzd2

second_larger:
        push ebx
        push msg4
        call [printf]
        jmp uzd2

;antra uzduotis

uzd2:
        xor eax, eax
        xor ebx, ebx

        push msg5
        call [printf]

        push kint1
        push msg2
        call [scanf]

        mov eax, [kint1]
        xor edx,edx
        mov ecx, 2
        idiv ecx

        cmp edx, 0
        je equal
        cmp edx, 0
        jne not_equal

equal:
       push msg6
       call [printf]
       jmp uzd3

not_equal:
       push msg7
       call [printf]
       jmp uzd3


uzd3:

       xor eax, eax
       xor ecx, ecx
       xor ebx, ebx

       push msg8
       call [printf]










invoke system, p
invoke exit, 0

section '.idata' import data readable
library msvcrt, 'msvcrt.dll'
import msvcrt,\
printf, 'printf' ,\
scanf, 'scanf',\
system, 'system',\
exit, 'exit'


