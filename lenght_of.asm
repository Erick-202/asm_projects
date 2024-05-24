Include irvine32.inc
.data

byte1 BYTE 10,20,30
arreglo1 WORD 30 DUP(?),0,0
arreglo2 WORD 5 DUP(3 DUP(?))
arreglo3 DWORD 1,2,3,4
cadDigitos BYTE "12345678",0

.code
main PROC

	;TYPE

	mov eax, type byte1
	mov ebx, type arreglo1
	mov ecx, type arreglo2
	mov edx, type arreglo3
	mov esi, type cadDigitos

	call DumpRegs

	; LENGTH OF

	mov eax, lengthof byte1
	mov ebx, lengthof arreglo1
	mov ecx, lengthof arreglo2
	mov edx, lengthof arreglo3
	mov esi, lengthof cadDigitos

	call DumpRegs

	;SIZE OF -> Multiplica el Type por el Length Of

	mov eax, sizeof byte1
	mov ebx, sizeof arreglo1
	mov ecx, sizeof arreglo2
	mov edx, sizeof arreglo3
	mov esi, sizeof cadDigitos

	call DumpRegs


	

exit
main endp
end main














