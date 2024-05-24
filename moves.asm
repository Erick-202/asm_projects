TITLE Ejemplos de transferencias de datos (Moves.asm)
; Ejemplo del capítulo 4. Demostración de MOV y
; XCHG con operando directos y de desplazamiento directo.
; Última actualización: 06/01/2006
INCLUDE Irvine32.inc
.data
val1 WORD 1000h
val2 WORD 2000h
arregloB BYTE 10h,20h,30h,40h,50h
arregloW WORD 100h,200h,300h
arregloD DWORD 10000h,20000h
.code
main PROC

; MOVZX
 mov bx,0A69Bh
 movzx eax,bx ; EAX = 0000A69Bh
 movzx edx,bl ; EDX = 0000009Bh
 movzx cx,bl ; CX = 009Bh
; MOVSX
 mov bx,0A69Bh
 movsx eax,bx ; EAX = FFFFA69Bh
 movsx edx,bl ; EDX = FFFFFF9Bh
 mov bl,7Bh
 movsx cx,bl ; CX = 007Bh
; Intercambio de memoria a memoria:
 mov ax,val1 ; AX = 1000h
 xchg ax,val2 ; AX = 2000h, val2 = 1000h
 mov val1,ax ; val1 = 2000h
; Direccionamiento con desplazamiento directo (arreglo de bytes):
 mov al,arregloB ; AL = 10h
 mov al,[arregloB+1] ; AL = 20h
 mov al,[arregloB+2] ; AL = 30h
; Direccionamiento con desplazamiento directo (arreglo de palabras):
 mov ax,arregloW ; AX = 100h
 mov ax,[arregloW+2] ; AX = 200h
; Direccionamiento con desplazamiento directo (arreglo de dobles palabras):
 mov eax,arregloD ; EAX = 10000h
 mov eax,[arregloD+4] ; EAX = 20000h
 mov eax,[arregloD+TYPE arregloD] ; EAX = 20000h
 exit
main ENDP
END main