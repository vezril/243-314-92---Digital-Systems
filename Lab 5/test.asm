; PROGRAM: lab6_1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC    

init:	mov	ax,vara
	add	ax,varb
	mov	varc,ax


shi:	mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT
mkr1	dw	0FFFFh	;start marker   
vara	dw	1111h
varb	dw	2222h
varc	dw	?
data	ENDS
        END    
