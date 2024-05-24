TITLE Invertir una cadena (InvCad.asm)
; Este programa invierte una cadena.
; Última actualización: 06/01/2006
INCLUDE Irvine32.inc
.data
unNombre BYTE "Abraham Lincoln",0
tamanioNombre = ($ - unNombre) - 1
.code
main PROC
; Mete el nombre en la pila.
 mov ecx,tamanioNombre
 mov esi,0
L1: movzx eax,unNombre[esi] ; obtiene el carácter
 push eax ; lo mete en la pila
 inc esi
 loop L1
; Saca el nombre de la pila, en orden inverso,
; y lo almacena en el arreglo unNombre.
 mov ecx,tamanioNombre
 mov esi,0

 L2: pop eax ; obtiene el carácter
 mov unNombre[esi],al ; lo almacena en la cadena
 inc esi
 loop L2
; Muestra el nombre.
 mov edx,OFFSET unNombre
 call Writestring
 call Crlf

 call DumpRegs
 ;ESP y ECX
 
 


 exit
main ENDP
END main
