; PROGRAM: 6_1a.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Multiplication program
; 
; 

        ASSUME	cs:code

code    SEGMENT
main    PROC    

start:	mov ax,300h
		mov	bx,201h
		mul	bx
		sub	ax,1
shi:	mov	ax,4c00h
		int	21h
main	ENDP
code	ENDS
		
		END