TITLE Suma y resta, Versión 2 (SumaResta2.asm)
; Este programa suma y resta enteros de 32 bits sin signo
; y almacena la suma en una variable.
INCLUDE Irvine32.inc
.data
val1 dword 10000h
val2 dword 40000h
val3 dword 20000h
valFinal dword ?
.code
main PROC
 mov eax,val1 ; empieza con 10000h
 add eax,val2 ; suma 40000h
 sub eax,val3 ; resta 20000h
 mov valFinal,eax ; almacena el resultado (30000h)
 call DumpRegs ; muestra los registros
 exit
main ENDP
END main


  COMMENT !
  ////////////////////////////////////////////
            LISTAS

include Irvine32.inc

.data
    miLista WORD 1,2,3,4,5

    arreglo WORD 5 DUP(?)

    val1 DD 12345678h   ; sin signo, DD = Define
    val2 DD -2147483648 ; con signo 


.code
main PROC
    mov al, 'A'
    mov bl, 0Ah
    call DumpRegs

  

    A mayuscula es el 65 en ascii
    65d en hexadecimal es 41
    Por eso el registro al tiene un 41

    


    exit                   
main ENDP

END main

!
