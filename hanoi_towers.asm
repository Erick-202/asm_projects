INCLUDE Irvine32.inc

.data
torre1 DWORD 10 DUP(?)  ; Primer torre con discos 1-10
torre2 DWORD 10 DUP(0)  ; Segunda torre inicialmente vacía
torre3 DWORD 10 DUP(0)  ; Tercera torre inicialmente vacía

mensaje_torre1 BYTE "Torre 1: ", 0
mensaje_torre2 BYTE "Torre 2: ", 0
mensaje_torre3 BYTE "Torre 3: ", 0

.code
main PROC
    ; Inicializa torre1
    mov ecx, 10          ; Número de discos
    mov esi, 0
    mov edi, OFFSET torre1

inicializa_torre1:
    mov [edi], ecx
    add edi, TYPE torre1
    loop inicializa_torre1

    ; Llama a la función recursiva para mover los discos
    mov eax, 10          ; número de discos
    mov ebx, OFFSET torre1
    mov ecx, OFFSET torre2
    mov edx, OFFSET torre3
    call MoverDiscos

    ; Termina el programa
    invoke ExitProcess, 0

MoverDiscos PROC
    push ebp
    mov ebp, esp
    sub esp, 4          ; espacio para variables locales

    mov eax, [ebp+8]    ; n
    mov ebx, [ebp+12]   ; torre origen
    mov ecx, [ebp+16]   ; torre auxiliar
    mov edx, [ebp+20]   ; torre destino

    cmp eax, 1
    je mover_un_disco   ; mover un disco directamente si n == 1

    ; mover n-1 discos a torre auxiliar
    dec eax
    push edx
    push ecx
    push ebx
    push eax
    call MoverDiscos
    add esp, 16

    ; mover el disco más grande a torre destino
mover_un_disco:
    call MoverDisco
    call ImprimirTorres   ; Imprimir los arreglos después de cada movimiento


    ; mover n-1 discos a torre destino
    mov eax, [ebp+8]
    dec eax
    push edx
    push ebx
    push ecx
    push eax
    call MoverDiscos
    add esp, 16

    mov esp, ebp
    pop ebp
    ret 16
MoverDiscos ENDP

MoverDisco PROC
    ; Implementación de movimiento de un disco
    ; Argumentos:
    ;   [ebx] = Torre de origen
    ;   [ecx] = Torre destino

    mov esi, [ebx]      ; Obtener el disco superior de la torre de origen
    mov edi, [ecx]      ; Obtener el disco superior de la torre destino

    ; Encontrar la posición del disco superior en la torre de origen
    mov eax, 0
    mov edx, ebx
    sub edx, OFFSET torre1
    shr edx, 2
    add edx, esi
    imul edx, TYPE torre1

    ; Encontrar la posición del disco superior en la torre destino
    mov ebx, 0
    mov esi, ecx
    sub esi, OFFSET torre1
    shr esi, 2
    add esi, edi
    imul esi, TYPE torre1

    ; Mover el disco de la torre de origen a la torre destino
    mov eax, [edx]      ; Obtener el disco superior de la torre de origen
    mov [esi], eax      ; Colocar el disco superior en la torre destino
    xor dword ptr [edx], eax   ; Limpiar el disco superior de la torre de origen

    ret
MoverDisco ENDP

ImprimirTorres PROC
    mov esi, OFFSET torre1
    mov edi, OFFSET torre2
    mov ebx, OFFSET torre3
    mov ecx, 10

    mov edx, OFFSET mensaje_torre1
    call WriteString
    call Crlf
    mov edx, OFFSET mensaje_torre2
    call WriteString
    call Crlf
    mov edx, OFFSET mensaje_torre3
    call WriteString
    call Crlf

imprimir_loop:
    mov eax, [esi]
    call WriteDec
    call WriteString
    mov eax, ', '
    call WriteString

    mov eax, [edi]
    call WriteDec
    call WriteString
    mov eax, ', '
    call WriteString

    mov eax, [ebx]
    call WriteDec
    call WriteString
    call Crlf

    add esi, TYPE torre1
    add edi, TYPE torre2
    add ebx, TYPE torre3
    loop imprimir_loop

    ret
ImprimirTorres ENDP



main ENDP
END main