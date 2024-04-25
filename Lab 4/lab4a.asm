;==============================================================
; PROGRAM: LAB4A.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  This program does basic arithmetic operations.
;============================================================== 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC
  
init:	mov	ax,data
	mov	ds,ax
      
start:	mov	al,vara	;moves the first variable
	add	al,20h	;adds the 20h as a constant to vara
	sub	al,varb	;subtracts from al varb
	mov	varc,al ;wax off [C=(A+20h)-B]       

fini:   mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT
	mrk1	dw	0ffffh
	vara	db	20h
	varb	db	40h
	varc	db	?
	mrk2	dw	0ffffh
data	ENDS
        END    
