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
mult:	mov	ax,vb
	add	ax,vb	;no need for carry, max is C350h
arith:	add	ax,vc	;no need for carry, max is c3f5h
	add	ax,val
	adc	bl,0
	add	bl,vam
waxoff:	mov	resm,bl
	mov	resl,ax

shi:	mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT  
vam	db	02h	;MSB of A
val	dw	49F0h	;LSB of A
vb	dw	61A8h	;B
vc	dw	0AFh	;C
resm	db	?	;msb of result
resl	dw	?	;lsb of result
data	ENDS
        END    
