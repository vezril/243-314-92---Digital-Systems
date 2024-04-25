; PROGRAM: bitcnt.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Bit Counter
; 
; Version:	1.0	
	
	PUBLIC	bitcnt
        ASSUME	cs:code, ss:stak
	EXTRN	outstr:FAR, getbyte:FAR, getword:FAR, outbyte:FAR, outword:FAR, newline:FAR
	EXTRN	getc:FAR

code	SEGMENT
main	PROC
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	call	getword
	call	newline
	call	bitcnt
	call	outword
shi:	mov	ax,4c00h
	int	21h
main	ENDP

bitcnt	PROC	
init:	push	bx
	push	cx	;gonna use this for my counter
	mov	cl,15
	mov	bx,ax

start: 	and	bx,1
	cmp	bx,1	;evals if there's a 1 or not
	je	yup
	rol	bx,1
	dec	cl	;this is the loop cnt
	cmp	cl,0
	je	next
	jmp	start
	

yup:	inc	ch	;this is my 1 cnt
	rol	bx,1	;rdy's for the next eval
	dec	cl
	cmp	cl,0	;checks if the loop is done
	je	next
	jmp	start

next:	cmp	cl,8
	jae	ones
	jmp	zeros

ones:	or	ax,8000h
	jmp	done

zeros:	and	ax,7FFFh
	jmp	done

done:	pop	cx
	pop	bx
	ret
bitcnt	ENDP
code	ENDS


data	SEGMENT
val	db	0
data	ENDS

stak	SEGMENT	STACK
	dw	1024 dup (0)
stak	ENDS
	END

