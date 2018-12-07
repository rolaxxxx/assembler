format PE console ;Console type of project

entry main

include 'macro/import32.inc' ;Additional libraries
include 'macro/proc32.inc'

section '.data' data readable writeable
wrong   db      'Blogas ivedimas!',10,0
uzd_num db      'Iveskite uzduoties numeri:',10,0
uzd_n   db      '%d',0
ats1    db      '%d',10,0
char    db      ' %c',0
char_m  db      'Iveskite simboli: ',10,0
uzd3    db      'Iveskite amziu metais: ',10,0
uzd4    db      'atsakymas didziausias skaicius: %d ' , 10,0
uzd3_a  db      'Metai parversti i dienas: ',10,0
pabaiga db      ' ', 10,0
message db      '%c',0
ats_tmp db '%d %d %d %d',10,0
aprasas db 'iveskite sveikaji skaiciu', 10,0
p db "pause>nul",0
a    dd ?
b    dd ?
c    dd ?
u    dd ?
sim  db ' '
kartai dd ?
temp dd ?
kintamasis dd ?
kintamasis2 dd ?
section '.code' code readable executable
main:

push uzd_num
call [printf]
push u
push uzd_n
call [scanf]
cmp [u], 1
   je fun1
cmp [u], 2
   je fun2
cmp [u], 3
   je fun3
cmp [u], 4
   je fun4
jmp main

push u

fun1:
        call function1
fun3:
        call function3
fun2:
    mov [kartai], 3
    mov [sim], ' '
        call function2
    mov [kartai], 1
    mov [sim], '*'
        call function2
    mov [kartai], 2
    mov [sim], ' '
        call function2
    mov [kartai], 3
    mov [sim], '*'
        call function2

fun4:
       mov [kartai], 0
      mov [kartai], 3
      call function4

invoke system, p ;Calling function with invoke command
invoke exit, 0


function1:
push ebp
mov ebp, esp
;mov [a],[esp]+4
        _while:
           invoke printf, char_m
           invoke scanf, char, c
           invoke printf, ats1, [c]
        cmp [c], '.'
        jne _while
       ; invoke printf, ats1, [a]
mov esp, ebp
pop ebp
ret

function3:
push ebp
mov ebp, esp
        invoke printf, uzd3
        invoke scanf, uzd_n, b
        ;call empty
        invoke printf, ats_tmp, eax, ebx, ecx, edx
        mov ecx, 4
        mov ebx, [b]
        imul ebx, 365
        mov eax, [b]
        idiv ecx
        add ebx, eax
        mov [b], ebx
        invoke printf, uzd3_a
        invoke printf, ats1, [b]
       ; invoke
mov esp, ebp
pop ebp
ret


function2:
push ebp
mov ebp, esp

    xor ecx,ecx ; cx-registras skaitiklis, nustatomas i 0
loop1:
     mov [temp], ecx

     invoke printf, message, dword [sim]

     mov ecx, [temp]
 inc ecx ; skaitiklio didinimas
 cmp ecx, [kartai] ; lyginame registro cx turini su for ciklo pabaiga
 jne loop1

    cmp [sim], '*'
    jne praleisti
    invoke printf, pabaiga
    praleisti:
mov esp, ebp
pop ebp
ret



function4:
push ebp
mov ebp, esp
invoke scanf, uzd_n   ,kintamasis
        xor ecx,ecx ; cx-registras skaitiklis, nustatomas i 0
        l1:
         mov [temp], ecx
          invoke printf, aprasas
          invoke scanf, uzd_n , kintamasis2
          xor edx, edx
          mov edx, [kintamasis2]
          cmp edx, [kintamasis]
          ja saug
          jmp pral
          saug:
          mov [kintamasis], edx
          pral:
          mov ecx, [temp]
           inc ecx ; skaitiklio didinimas
          cmp ecx, [kartai] ; lyginame registro cx turini su for ciklo pabaiga
          jne l1
          invoke printf, uzd4, [kintamasis]


mov esp, ebp
pop ebp
ret

section '.idata' import data readable
library msvcrt,'msvcrt.dll'
import msvcrt,\
printf,'printf',\
scanf, 'scanf',\
system,'system',\
exit,'exit'