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
	mov	cx,0
	mov	dx,0
	lea	di,mem

parta:	add	ax,[di]
	adc	dx,0
	add	di,2
	cmp	di,39
	ja	partb
	jmp	parta

partb:	mov	bx,20
	div	bx

shi:	xchg	ah,al
	xchg	dh,dl
	mov	rez+2,ax
	mov	rez,dx
	mov	ax,4c00h
	int	21h

main	ENDP
code	ENDS

data	SEGMENT
mem	dw	100,945,1250,167,888,753,951,459,621,741,963,258,147,852,369,200,365,999,440,350
rez	dw	0,0
data	ENDS

		END