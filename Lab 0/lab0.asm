; PROGRAM: LAB1.ASM
;
; AUTHOR: <your_name_here>
;
; DESCRIPTION:
; This program adds two unsigned numbers (2+2) and leaves the result
; in the register.
;

        ASSUME  cs:code

code    SEGMENT
main    PROC    FAR

; uP instructions

start:  
   	mov     ax,2   	;initialize reg. ax with a value of 2
        add     ax,2   	;add 2 to the same register
			;result is left in reg ax
fini:
	mov	ax,4c00h   ;these two inst.'s have to be here
	int	21h	   ;or the computer will blow up! :)

main    ENDP
code    ENDS

        END
