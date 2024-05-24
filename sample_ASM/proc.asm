; Programa en ensamblador con Irvine32
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
    num1 DWORD 5
    num2 DWORD 10
    sumResult DWORD ?
    mulResult DWORD ?
    msgSum BYTE "La suma es: ", 0
    msgMul BYTE "La multiplicacion es: ", 0

.code
main PROC
    ; Llamada al procedimiento de suma
    mov eax, num1
    mov ebx, num2
    call Sumar
    mov sumResult, eax

    ; Llamada al procedimiento de multiplicación
    mov eax, num1
    mov ebx, num2
    call Multiplicar
    mov mulResult, eax

    ; Mostrar el resultado de la suma
    mov edx, OFFSET msgSum
    call WriteString
    mov eax, sumResult
    call WriteDec
    call Crlf

    ; Mostrar el resultado de la multiplicación
    mov edx, OFFSET msgMul
    call WriteString
    mov eax, mulResult
    call WriteDec
    call Crlf

    ; Salir del programa
    INVOKE ExitProcess, 0
main ENDP

; Procedimiento para sumar dos números
Sumar PROC
    add eax, ebx
    ret
Sumar ENDP

; Procedimiento para multiplicar dos números
Multiplicar PROC
    imul eax, ebx
    ret
Multiplicar ENDP

END main