.data
valR   SDWORD ?
valX   SDWORD 26
valY   SDWORD 30
valZ   SDWORD 40
.code
main PROC
     mov   ax,1000h
     inc   ax
     dec   ax                      
     mov   eax,valX
     neg   eax                     
     mov   ebx,valY
     sub   ebx,valZ
     add   eax,ebx
     mov   valR,eax                
     mov   cx,1
     sub   cx,1                    ; ZF = 
     mov   ax,0FFFFh
     inc   ax                      ; ZF = 
     mov   cx,0
     sub   cx,1                    ; SF = 
     mov   ax,7FFFh
     add   ax,2                    ; SF = 
     mov   al,0FFh
     add   al,1                    ; CF = ,  AL = 
     mov   al,+127
     add   al,1                    ; OF = 1
     mov   al,-128
     sub   al,1                    ; OF = 1
     exit
main ENDP
END main