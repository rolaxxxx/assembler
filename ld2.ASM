format PE console ;Console type of project
entry main

include 'macro/import32.inc'
include 'macro/proc32.inc'

section '.data' data readable writeable
msg1 db 'Iveskite pirma sveikaji skaiciu: ' , 0
msg2 db " %d" , 0
msg3 db 'Iveskite antraji sveikaji skaiciu: '  , 0
msg4 db " %d" , 0
msg5 db "skaicius: %d" , 10,0
msg6 db "atimtis skaicius: %d", 10,0
msg7 db "daugyba skaicius: %d", 10,0
msg8 db "dalyba skaicius: %d", 10,0
msg9 db 'iveskite laika valandas minutes ir sekundes: ' , 0
msg10 db " %d" , 0
msg11 db " %d" , 0
msg12 db " %d" , 0
msg13 db 'iveskite kiek sekundziu norite pakelti laika ' , 0
msg14 db " %d" , 0
msg15 db " " , 0
msg16 db " %d  %d " , 10,0
msg19 db "ivestas laikas valandos minutes ir sekundes ir kiek sekundziu pakelti laika   %d   %d   %d  %d \n" , 0
msg20 db "padidintas laikas valandos minutes ir sekundes   %d  %d  %d  " , 0
msg21 db "ascii simbol is %d %c " ,0
msg22 db 'iveskite skaiciu simbolio konvertavimui '   ,0

p db "pause>nul", 0
kint1 dd ?
kint2 dd ?
kint3 dd ?
kint4 dd ?
kint5 dd ?

section '.code' code readable executable
main:

        push msg1
        call [printf]

        push kint1
        push msg2
        call [scanf]


        push msg3
        call [printf]

        push kint2
        push msg4
        call [scanf]

        mov eax, [kint2]
        mov ebx, [kint1]
        add eax, ebx

        push eax
        push msg5
        call [printf]
        pop eax
        pop ebx

        mov eax, [kint2]
        mov ebx, [kint1]

        sub ebx, eax

        push ebx
        push msg6
        call [printf]

        pop eax
        pop ebx

        mov eax, [kint2]
        mov ebx, [kint1]

        imul eax, ebx

        push eax
        push msg7
        call [printf]

        pop eax
        pop ebx

        mov eax, [kint2]
        xor edx,edx
        mov ecx, [kint1]
        idiv ecx

        push edx
        push msg8
        call [printf]

       ; pop eax
        ;pop ebx
        ;pop ecx
        ;pop edx
        ;pop [kint1]
        ;pop [kint2]



        ;2 uzduotis


        push msg9
        call [printf]

        push kint1
        push msg10
        call [scanf]

        push kint2
        push msg11
        call [scanf]

        push kint3
        push msg12
        call [scanf]



        push msg13
        call [printf]

        push kint4
        push msg14
        call [scanf]


        push [kint4]
        push [kint3]
        push [kint2]
        push [kint1]
        push msg19
        call [printf]
        ;ecx    ebx     esp     ebp     esi     edi

        mov ebp, [kint3]
        mov edi, [kint4]

        add ebp, edi
        mov eax, ebp
        mov ecx, 60
        idiv ecx

        mov [kint3], edx
        add [kint2], eax
        xor eax, eax
        xor edx, edx

        mov eax, [kint2]
        mov ecx, 60
        idiv ecx

        ;eax sveika dalis edx likutis nuo sveikos
        add [kint1], eax
        mov [kint2], edx

        push [kint3]
        push [kint2]
        push [kint1]
        push msg20
        call [printf]




        ;trecia uzduotis

        push msg22
        call [printf]

        push kint1
        push msg14
        call [scanf]

        push kint1
        push msg21
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


