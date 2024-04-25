; PROGRAM: 2.ASM
;
; AUTHOR: Calvin O. Ference
;
; DESCRIPTION:  Subroutines thingy
; 
; 

        ASSUME	cs:code, ds:data, ss:stak
	EXTRN	outword:FAR, outstr:FAR, getc:FAR, outc:FAR, newline:FAR
	
code    SEGMENT
main	PROC
init:	mov	ax,data
	mov	ds,ax
	mov	ax,0
	mov	bx,0
	mov	cx,0
	mov	dx,0

start:	call	input
	mov	cnt,cx		;saving this value for further usage
	call	upper
	mov	cx,cnt		;resseting my cnt for next part
	call	lower
	mov	cx,cnt		;again as above
	call	numeric
	mov	cx,cnt		;again
	call	nonalpha
	call	output
main	ENDP
;-----------------------------
input	PROC
	lea	si,stri		;this is where i'll write my string into
	lea	di,imsg1
	call	outstr
	call	newline
	lea	di,imsg2
	call	outstr
	call	newline
	call	newline
	lea	di,imsg3
	call	outstr
	call	newline
inp:	call	getc
	cmp	al,0dh
	je	next		;this is the break thingy
	mov	[si],al
	inc	si
	inc	cx		;my counter
	jmp	inp
next:	ret
input	ENDP
;------------------------------------
upper	PROC
	lea	si,stri		;pointing for eval
	mov	bx,0ah
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,41h
	jb	skip
	cmp	al,5ah
	ja	skip
	inc	bx		;this is counting  uppercase chars
	dec	cx		;counting counting... yeah
	cmp	cx,0
	je	done
	jmp	pta
skip:	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	up,bx
	ret
upper	ENDP
;------------------------------------
lower	PROC
	lea	si,stri		;pointing for eval
	mov	bx,0
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,61h
	jb	skip
	cmp	al,7ah
	ja	skip
	inc	bx		;this is counting  lowercase chars
	dec	cx		;counting counting... yeah
	cmp	cx,0
	je	done
	jmp	pta
skip:	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	lowe,bx
	ret
lower	ENDP
;-------------------------------------
numeric	PROC
	lea	si,stri		;pointing for eval
	mov	bx,0
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,30h
	jb	skip
	cmp	al,39h
	ja	skip
	inc	bx		;this is counting  numerics chars
	dec	cx		;counting counting... yeah
	cmp	cx,0
	je	done
	jmp	pta
skip:	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	nume,bx
	ret
numeric	ENDP
;------------------------------------
nonalpha	PROC
	lea	si,stri		;pointing for eval
	mov	bx,0
pta:	cmp	cx,0
	je	done
	mov	ax,0
	mov	al,[si]
	cmp	al,30h
	jb	safe
	cmp	al,39h
	jb	skip
	cmp	al,41h
	jb	safe
	cmp	al,5bh
	jb	skip
	cmp	al,61h
	jb	safe
	cmp	al,7bh
	jb	skip
	inc	bx
	dec	cx
	jmp	pta
safe:	dec	cx
	inc	bx
	jmp	pta

skip:	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	nonal,bx
	ret
nonalpha	ENDP
;------------------------------------
output	PROC
	lea	di,omsg1
	call	outstr
	call	newline
	;need to add entered string here thingy
	lea	di,omsg2
	call	outstr
	mov	ax,up
	call	outword
	call	newline
	lea	di,omsg3
	call	outstr
	mov	ax,lowe
	call	outword
	call	newline
	lea	di,omsg4
	call	outstr
	mov	ax,nume
	call	outword
	call	newline
	lea	di,omsg5
	call	outstr
	mov	ax,nonal
	call	outword
	call	newline

shi:	mov	ax,4c00h
	int	21h
output	ENDP

code	ENDS



data	SEGMENT
stri	db	1024 dup (0)
cnt	dw	0
up	dw	0
lowe	dw	0
nume	dw	0
nonal	dw	0
imsg1	db	"String Analyzer 1.0",04
imsg2	db	"by Calvin O. Ference",04
imsg3	db	"Enter a line of input",04
omsg1	db	"Entered string: ",04
omsg2	db	"Contains: ",04h
omsg3	db	"# of Uppercase characters = ",04
omsg4	db	"# of Lowercase characters = ",04
omsg5	db	"# of Numeric characters = ",04
omsg6	db	"# of Non-alphabetic characters = ",04
data	ENDS

stak	SEGMENT	STACK
	dw	256 dup (0)
stak	ENDS

		END