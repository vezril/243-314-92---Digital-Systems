; PROGRAM: 9_3.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Looping and Indexing Ops
; 
; 

        ASSUME	cs:code, ds:data

code    SEGMENT
main    PROC   

init:	
	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
	mov	cx,0
	mov	dx,0
	lea	di,mem
	lea	si,mem2

parta:	cmp	di,27h
	ja	partc
	mov	ax,[di]
	cmp	ax,1250
	je	thingy
	cmp	ax,200
	ja	partb
	add	di,2
	jmp	parta

thingy: add	si,2
	add	di,2
	jmp	parta

partb:	mov	bx,[di]
	mov	[si],bx
	add	si,2
	add	di,2
	inc	cl
	jmp	parta


partc:	lea	si,mem2
	mov	ax,0

partd:	cmp	si,47h
	ja	avg
	add	ax,[si]
	adc	dx,0
	add	si,2
	jmp	partd

avg:	mov	bx,cx
	div	cx


shi:	xchg	ah,al
	xchg	dh,dl
	mov	cnt,cl
	mov	rez+2,ax
	mov	rez,dx
	mov	ax,4c00h
	int	21h

main	ENDP
code	ENDS

data	SEGMENT
mem	dw	100,945,1250,167,888,753,951,459,621,741,963,258,147,852,369,200,365,999,440,350
mem2	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
rez	dw	0,0
cnt	db	0
data	ENDS

		END