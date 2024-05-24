TITLE suma y resta

INCLUDE Irvine32.inc

.code
main PROC


	mov ax, 0000h;
	movsx bx, al;


	call DumpRegs;

exit
main ENDP
END main