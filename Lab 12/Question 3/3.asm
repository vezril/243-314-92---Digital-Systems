; PROGRAM: 3.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Program to test the hex2dec
; 
; Version:	1.0

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR, hex2dec:FAR

code    SEGMENT
main    PROC   
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
	mov	cx,0
	mov	dx,0		
	lea	di,msg1

start:	call	outstr
	call	getbyte
	call	hex2dec
	push	ax
	lea	di,msg2
	call	newline
	call	outstr
	pop	ax
	call	outword

	
shi:	mov	ax,4c00h
	int	21h
main	ENDP
code	ENDS

	
data	SEGMENT
msg1	db	"Please enter an byte in hexadecimal to convert >> ",04h
msg2	db	"The converted hex value in decimal is >> ",04
data	ENDS


stak	SEGMENT	STACK
	dw	1024 dup (0)
stak	ENDS

		END