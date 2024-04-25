; PROGRAM: 5.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Program to test the ascii2word
; 
; Version:	1.0

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR, ascii2word:FAR

code    SEGMENT
main    PROC   
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
	mov	cx,0
	mov	dx,0		
	lea	di,msg1
	lea	si,val

start:	call	outstr
	call	getc
	mov	[si],al
	inc	si
	call	getc
	mov	[si],al
	inc	si
	call	getc
	mov	[si],al	
	inc	si
	call	getc
	mov	[si],al
	inc	si
	call	getc
	mov	[si],al
	lea	si,val
	call	newline
	call	ascii2word
	lea	di,msg2
	call	outstr
	call	outword
	
shi:	mov	ax,4c00h
	int	21h
main	ENDP
code	ENDS

	
data	SEGMENT
msg1	db	"Please enter a 5 digit value to convert >> ",04h
msg2	db	"The converted value is >> ",04
val	db	5 dup (0)
data	ENDS


stak	SEGMENT	STACK
	dw	1024 dup (0)
stak	ENDS

		END