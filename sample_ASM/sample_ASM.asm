
INCLUDE Irvine32.inc

.data
	val1 BYTE 10h

.code
main PROC
	mov al, 0h
	mov bl, 0h

	mov esi, OFFSET val1
	mov bl, [esi]
	mov eax, esi

	Call DumpRegs
main ENDP


END
