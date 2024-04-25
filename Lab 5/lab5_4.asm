; PROGRAM: lab5_3.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC    

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
start:	mov	ax,val
	mov	bl,vam
	sub	ax,vb
	sbb	bl,0
	sub	ax,vb
	sbb	bl,0
	sub	ax,vc
	sbb	bl,0
	mov	resm,bl
	mov	resl,ax


shi:	mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT  
vam	db	02h	;MSB of A
val	dw	49F0h	;LSB of A
vb	dw	270Fh	;B
vc	dw	63h	;C
resm	db	?	;msb of result
resl	dw	?	;lsb of result
data	ENDS
        END    
