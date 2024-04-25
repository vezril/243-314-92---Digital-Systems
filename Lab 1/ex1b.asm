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
        mov     ax,01
        add     ax,06
        mov     bx,02
	add 	bx,ax
        mov     cx,04
        mov     dx,08
	add	cx,dx
	
fini:   mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

        END    
