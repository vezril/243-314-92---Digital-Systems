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

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0

mult:	mov	al,varb+1
	mov	ah,varb
	add	al,varb+1
	adc	ah,0
	add	ah,varb
	adc	bl,0		;this multiplies B with itself
adda:	add	al,vara+2	;adding A
	adc	ah,0
	add	ah,vara+1
	adc	bl,0
	add	bl,vara
	adc	bh,0		; just in case
addc:	add	al,varc		;adding C
	adc	ah,0
	adc	bl,0		
	adc	bh,0		; just in case also
waxoff:	mov	resm,bl
	mov	resl1,ah
	mov	resl2,al

shi:	mov	ax,4c00h
        int	21h

main    ENDP
code    ENDS

data	SEGMENT
mkr1	dw	0FFFFh	;start marker   
vara	db	0h,0h,01h
varb	db	0h,1h
varc	db	1h
resm	db	?	;msb for answer
resl1	db	?	;middle part of answer
resl2	db	?	;lsb for answer
mkr2	dw	0FFFFh	;end marker
data	ENDS
        END    
