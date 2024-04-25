; PROGRAM: 10_1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Looping, Indexing  and I/O
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	lea	di,temp

hajime:	cmp	di,28
	je	shi
	mov	al,[di]
	cmp	al,0
	jg	warm
	jl	cold
	inc	di
	jmp	hajime

cold:	cmp	al,froid
	jl	cold2
	inc	di
	jmp	hajime
cold2:	mov	froid,al
	inc	di
	jmp	hajime

warm:	cmp	al,wrm
	ja	warm2
	inc	di
	jmp	hajime
warm2:	mov	wrm,al
	inc	di
	jmp	hajime
	
				
shi:
	mov	ax,4c00h
	int	21h

main	ENDP
code	ENDS

data	SEGMENT
temp	db	11,12,7,5,2,2,-1,-3,-5,-9,-1,0,2,1,2,3,22,15,10,9,7,-10,-19,-22,1,2,4,3	
froid	db	0
wrm	db	0
data	ENDS

		END