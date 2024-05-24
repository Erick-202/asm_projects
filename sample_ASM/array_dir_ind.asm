INCLUDE Irvine32.inc

.data
	arregloD DWORD 1,2,3,4

.code
	main PROC
	mov esi, 3
	mov eax, arregloD[esi*4]
	
	Call DumpRegs
main ENDP


END




