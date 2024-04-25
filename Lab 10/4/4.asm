; PROGRAM: 4.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Virus
; 
; 

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	getword:FAR, newline:FAR, outstr:FAR, outword:FAR, getbyte:FAR

code    SEGMENT
main    PROC   

init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	dx,0
	mov	bx,0
	mov	cx,0
	lea	di,msg1
pta:	mov	cx,00ffh
ptb:	nop
	nop
	nop
	nop
	call	outstr
		


		
shi:	mov	ax,4c00h
	int	21h

	
main	ENDP
code	ENDS

data	SEGMENT
vals	dw	25 dup (0)
msg1	db	"<< THIS IS NOT A VIRUS >> ",04h
rez1	dw	0,0
rez2	dw	0,0
maxi	dw	0
mini	dw	0ffffh
data	ENDS

stak	SEGMENT	STACK
	dw	256 dup (0)
stak	ends

		END