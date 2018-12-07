format PE console ;Console type of project
entry main

include 'macro/import32.inc'
include 'macro/proc32.inc'



section '.data' data readable writeable
msg1 db 'Iveskite skaiciu kuri noresite paversti i ASCII  simboli   ' , 0
msg2 db " %d" , 0
msg3 db "iveskite savo amziu metais "  , 10,0
msg4 db "antras skaicius didesnis : %d "  , 10,0
msg5 db 'iveskite viena skaiciu kuri norite patikrinti ar jis lyginis ar ne ? ' , 0
msg8 db 'iveskite du skaicius bei zenkla tarp skaiciu koki veiksma norite atlikti  ', 0
msg9 db "%c", 0


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




   call first
   call second
   call third
   call fourth
   call fifth

  first:
        loop1:
        push msg1
        call [printf]

        push kint1
        push msg2
        call [scanf]
         mov kint2, kint1

        push kint1
        push msg9
        call [scanf]

        cmp [kint2],"."

        jne loop1
  ret
  second:

  ret

  third:

  push msg3
  call [printf]

  push kint1
  push msg2
  call [scanf]

  imul [kint1], 365

  push kint1
  push msg2
  call [printf]

  ret

  fourth:


  ret



  fifth:

  ret






invoke system, p
invoke exit, 0

section '.idata' import data readable
library msvcrt, 'msvcrt.dll'
import msvcrt,\
printf, 'printf' ,\
scanf, 'scanf',\
system, 'system',\
exit, 'exit'


