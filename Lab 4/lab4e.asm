;==============================================================
; PROGRAM: LAB4E.ASM
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
      
start:	mov	ax,vara	;wax on
	add	ax,2000h;adds 2000h to vara
	sub	ax,varb	;subtracts varb from vara
	mov	ax,varc	;wax off
	
fini:   mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT
	mrk1	dw	0ffffh
	vara	dw	2000h
	varb	dw	4000h
	varc	dw	?
	mrk2	dw	0ffffh
data	ENDS
        END    
