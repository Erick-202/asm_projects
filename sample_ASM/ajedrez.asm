; Programa en ensamblador con Irvine32 para sumar 1 + 2 + 4 + 8 + ... hasta la posición 24 usando una pila
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
    position DWORD 24 ; La posición a calcular
    result DWORD 0
    msg BYTE "El resultado de la posición 24 es: ", 0

.code
main PROC
    ; Inicializa los registros
    mov ecx, position
    mov eax, 1   ; Primer valor de la secuencia

    ; Bucle para calcular los valores y guardarlos en la pila
    L1:
        push eax       ; Guarda el valor actual en la pila

        shl eax, 1     ; Desplaza a la izquierda (equivalente a multiplicar por 2)
        
        loop L1

    ; Inicializa el registro de la suma acumulada
    mov ebx, 0

    ; Bucle para sumar los valores en la pila
    mov ecx, position
    L2:
        pop eax        ; Recupera el valor de la pila
        add ebx, eax   ; Suma el valor al acumulado
        
        loop L2

    mov result, ebx ; Guarda el resultado en la variable

    ; Mostrar el resultado
    mov edx, OFFSET msg
    call WriteString
    mov eax, result
    call WriteDec
    call Crlf

    ; Salir del programa
    INVOKE ExitProcess, 0
main ENDP

END main