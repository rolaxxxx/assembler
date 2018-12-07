format PE console ;Console type of project
entry main

include 'macro/import32.inc'
include 'macro/proc32.inc'



section '.data' data readable writeable
msg1 db 'Iveskite du sveikus skaicius kuriuos norite palyginti  ' , 0
msg2 db "%d" , 10,0
msg3 db 'Rolandas, Ulevicius' , 10,0
msg4 db 'iveskite skaiciuojamu nariu kieki b1 nari ir geometrini daugikli ', 10,0
msg5 db ' geometrines progresijos programa spauskite 1, funkcijos reiksme taske spauskite 2' , 10,0
msg6 db 'iveskite X ir Y reiksmes kad gautumete Z reiksme'
msg7 db "progresijos elementas yra %d" , 10,0
p db "pause>nul", "$"
kint1 dd ?
kint2 dd ?
kint3 dd ?
kint4 dd ?
kint5 dd ?

section '.code' code readable executable
main:
          push msg3
          call [printf]


          ciklas:
          push msg5
          call [printf]

          push kint1
          push msg2
          call [scanf]

          mov edi, [kint1]




          cmp edi, 1
          je pirma_programa
          cmp edi, 2
          je antra_programa
          cmp edi, 3
          je pabaiga



pirma_programa:
        push msg4
        call [printf]

        push kint2   ; kiek kartu kartosis ciklas
        push msg2
        call [scanf]
        cmp [kint2], 20
        je ciklas
        push kint3   ;B1 narys
        push msg2
        call [scanf]

        push kint4    ; progresijos daugiklis
        push msg2
        call [scanf]




        mov ecx, [kint2]
        mov edx, [kint3]
        mov ebx, [kint4]

        push ecx
        push msg2
        call [printf]

        l1:
        mov esi, ecx
        imul edx, ebx
        push edx
        push msg7
        call [printf]

        mov ecx, esi
        loop l1




jmp ciklas




antra_programa:
     push msg6
     call [printf]

     push kint1  ; X
     push msg2
     call [scanf]

     push kint2    ; Y
     push msg2
     call [scanf]

     mov ebx, 0
     mov ebx, [kint2]
     imul ebx, ebx
     imul ebx, [kint1]

     mov ebp, 0
     mov ebp, [kint1]
     mov ecx, 5

     l5:
     imul ebp, ebp
     loop l5
     imul ebp, 5

     sub ebx, ebp
     push ebx
     push msg2
     call [printf]

jmp ciklas

pabaiga:




invoke system, p
invoke exit, 0

section '.idata' import data readable
library msvcrt, 'msvcrt.dll'
import msvcrt,\
printf, 'printf' ,\
scanf, 'scanf',\
system, 'system',\
exit, 'exit'

