Include irvine32.inc
.data

miDoble DWORD 12345678h

.code
main PROC
	mov al, BYTE PTR miDoble
	mov bl, BYTE PTR [miDoble + 1]
	mov cl, BYTE PTR [miDoble + 2]
	mov dl, BYTE PTR [miDoble + 3]


	call DumpRegs
exit
main endp
end main