; PROGRAM: EX1.ASM
;
; AUTHOR: <your_name_here>
;
; DESCRIPTION:  This program simply initializes the General Purpose
; registers with an arbitrary set of values.
; 

        ASSUME	cs:code

code    SEGMENT
main    PROC    FAR
        
start:
        mov     ax,1234
        mov     bx,1234h
        mov     cx,0001001000110100b
        mov     dx,0abcdh

        mov     al,0
	mov     ah,al
        mov     bh,12h
        mov     bl,34h
        mov     cl,bh
	mov     ch,cl
        mov     dl,al
        mov     dh,bl

fini:   mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

        END    
