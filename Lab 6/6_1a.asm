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

start:	mov al,5
		mov	bl,7
		mul	bl
		add	al,1
shi:	mov	ax,4c00h
		int	21h
main	ENDP
code	ENDS
		
		END