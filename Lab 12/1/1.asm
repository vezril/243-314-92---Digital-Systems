; PROGRAM: 1.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Bit CNT using EXTRN Sbr
; 
; Version:	1.0

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR, bitcnt:FAR, retry:FAR

code    SEGMENT
main    PROC   
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	cx,0

start:	call	inputs
	call	newline
	call	eval
	call	outputs

shi:	mov	ax,4c00h
	int	21h
		
main	ENDP
;-------------------
eval	PROC
init:	lea	si,vals
	mov	cl,16

start:	mov	ax,[si]
	call	bitcnt
	mov	[si],ax
	add	si,2
	dec	cl
	cmp	cl,0
	je	done
	jmp	start

done:	ret
eval	ENDP
;--------------------
inputs	PROC
init:	mov	cl,16
	lea	si,vals
	lea	di,imsg1
	call	outstr
	call	newline

start:	call	getword
	mov	[si],ax
	call	newline
	add	si,2	;next memory location
	dec	cl
	cmp	cl,0	;checks if counter is done
	je	done
	jmp	start

done:	ret
inputs	ENDP
;----------------------
outputs	PROC
init:	mov	cl,16
	lea	si,vals
	lea	di,imsg2
	call	outstr
	call	newline

start:	mov	ax,[si]
	call	outword
	call	newline
	add	si,2
	dec	cl
	cmp	cl,0
	je	done
	jmp	start

done:	ret
outputs	ENDP

code	ENDS

	
data	SEGMENT
vals	dw	16 dup (0)
imsg1	db	"Please Enter 16 Words",04
imsg2	db	"Here are the Results",04
data	ENDS


stak	SEGMENT	STACK
	dw	1024 dup (0)
stak	ENDS

		END