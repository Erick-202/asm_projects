Include irvine32.inc
.data
.code
main PROC
	mov eax,7
	call DumpRegs
exit
main endp
end main