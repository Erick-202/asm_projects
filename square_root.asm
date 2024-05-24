

include Irvine32.inc
 

.code
main PROC
    mov al, 'A'
    mov bl, 0Ah
    call DumpRegs

    exit                   
main ENDP

END main

