TITLE sqt

include Irvine32.inc

.data
numero DWORD ?      
contador DWORD 0         

.code
main PROC
    mov edx, OFFSET numero   ;Pedir Numero
    call ReadDec             ; Leer numero
    mov numero, eax          

    ; CONTADOR
    mov eax, 0              
    mov ecx, 1               

bucle:
    cmp numero, ecx          
    jb fin                   
    sub numero, ecx          
    add ecx, 2              
    inc eax                  
    jmp bucle             

fin:
    ; Muestra el resultado.
    mov edx, OFFSET contador 
    call WriteDec            
    call Crlf  
    call DumpRegs

    exit                   
main ENDP

END main

COOMENT ! este es un comentario   !
