include Irvine32.inc

.data
    array WORD 30 DUP(?)     ; array 30 elem tipo palabra
    valorComparar WORD ?     ; comparar con 

.code
main PROC
    mov eax, 5
    mov valorComparar, ax

    ; Inicializamos el arreglo 
    mov ecx, LENGTHOF array
    lea esi, array
    mov ax, 0
    fillArray:
        mov [esi], ax
        add esi, TYPE WORD
        inc ax
        loop fillArray

    ; Restablecer ECX
    mov ecx, LENGTHOF array
    lea esi, array

    xor ebx, ebx

    ; Comparar cada elemento del arreglo 
    compareLoop:
        mov ax, [esi]
        cmp ax, valorComparar
        jne notEqual
        inc bl
    notEqual:
        add esi, TYPE WORD
        loop compareLoop

    ; Ahora BL contiene el número de coincidencias
    movzx ebx, bl


    call DumpRegs
    exit
main ENDP
END main
