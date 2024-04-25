; PROGRAM: 9_2.ASM
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
	mov	dx,0

parta:	mov	cx,51
	inc	bx
	cmp	bx,25
	ja	shi
partb:	add	ax,bx
	adc	dx,0
	add	ax,cx
	adc	dx,0
	add	ax,cx
	adc	dx,0
	inc	cx
	cmp	cx,75
	ja	parta
	jbe	partb	

shi:	xchg	al,ah
	xchg	dl,dh
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