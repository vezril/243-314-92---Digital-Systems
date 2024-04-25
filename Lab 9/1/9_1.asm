; PROGRAM: 9_1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Looping and Indexing Ops
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
	mov	cx,0044h
	mov	dx,0

stepa:	cmp	cx,30h	;random value
	jb	stepb
	add	ax,cx
	adc	dx,0
	add	cx,2
	adc	bx,0
	jmp	stepa
	
stepb:	cmp	cx,875h
	jae	shi
	add	ax,cx
	adc	dx,bx
	add	cx,2
	jmp	stepb
				
shi:	
	mov	rez+2,ax
	mov	rez,dx
	mov	ax,4c00h
	int	21h

main	ENDP
code	ENDS

data	SEGMENT
rez	dw	0,0
data	ENDS

		END