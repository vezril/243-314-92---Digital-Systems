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
	call	upper
	call	lower
	call	number
	call	nonalp
	call	words
	call	conv
	call	output
	lea	di,msg
	call	newline
	call	outstr
	call	getc
	cmp	al,59h
	je	start
	cmp	al,39h

shi:	mov	ax,4c00h
	int	21h
main	ENDP
;-----------------------------
conv	PROC
	add	up,30h
	add	wds,30h
	add	lowe,30h
	add	nume,30h
	add	nonal,30h
	ret	
conv	ENDP
;-----------------------------
words	PROC
	mov	ax,0
	mov	bx,0
	mov	cx,cnt
	lea	si,stri
pta:	mov	al,[si]
	cmp	al,"A"
	jb	skip
	cmp	al,"Z"
	jb	begin
	cmp	al,"a"
	jb	skip
	cmp	al,"z"
	jb	begin
	inc 	si
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta

begin:	inc	bx
good:	inc	si
	dec	cx
	cmp	cx,0
	je	done
	mov	al,[si]
	cmp	al,"A"
	jb	skip
	cmp	al,"Z"
	jb	good
	cmp	al,"a"
	jb	skip
	cmp	al,"z"
	jb	good
	jmp	skip

skip:	inc	si
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta

done:	mov	wds,bx
	ret
words	ENDP
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
next:	mov	cnt,cx	;saving this value for further usage
	ret
input	ENDP
;------------------------------------
upper	PROC
	lea	si,stri		;pointing for eval
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,"A"
	jb	skip
	cmp	al,"Z"
	ja	skip
	inc	bx		;this is counting  uppercase chars
	dec	cx		;counting counting... yeah
	cmp	cx,0
	je	done
	inc	si
	jmp	pta
skip:	inc	si
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	up,bx
	ret
upper	ENDP
;------------------------------------
lower	PROC
	lea	si,stri		;pointing for eval
	mov	cx,cnt
	mov	bx,0
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,"a"
	jb	skip
	cmp	al,"z"
	ja	skip
	inc	bx		;this is counting  lowercase chars
	dec	cx		;counting counting... yeah	
	cmp	cx,0
	je	done
	inc	si		;next mem location
	jmp	pta
skip:	inc	si
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	lowe,bx
	ret
lower	ENDP
;------------------------------------
number	PROC
	lea	si,stri		;pointing for eval
	mov	cx,cnt
	mov	bx,0
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,"0"
	jb	skip
	cmp	al,"9"
	ja	skip
	inc	bx		;this is counting  numbers
	dec	cx		;counting counting... yeah	
	cmp	cx,0
	je	done
	inc	si		;next mem location
	jmp	pta
skip:	inc	si
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta
done:	mov	nume,bx
	ret
number	ENDP
;------------------------------------
nonalp	PROC
	lea	si,stri		;pointing for eval
	mov	cx,cnt
	mov	bx,0
pta:	mov	ax,0
	mov	al,[si]
	cmp	al,"0"
	ja	check
	inc	si
	inc	bx
	dec	cx
	cmp	cx,0
	je	done
	jmp	pta

check:	cmp	al,"9"
	jb	skip
	cmp	al,"A"
	jb	ok
	cmp	al,"Z"
	jb	skip
	cmp	al,"a"
	jb	ok
	cmp	al,"z"
	jb	skip
	inc	bx
	dec	cx
	inc	si
	cmp	cx,0
	je	done
	jmp	pta

ok:	dec	cx
	inc	bx
	inc	si
	cmp	cx,0
	je	done
	jmp	pta


skip:	dec	cx
	inc	si
	cmp	cx,0
	je	done
	jmp	pta

done:	mov	nonal,bx
	ret
nonalp	ENDP
	
	
;--------------------------------
output	PROC
	lea	di,omsg1
	call	outstr
	call	newline
	lea	di,stri
	call	newline
;	call	outstr		I HAVE REMOVED THIS PART OF THE CODE AS IT CAUSED WEIRD VISUAL PROBLEMS
	call	newline
	lea	di,omsg2
	call	outstr
	call	newline
	lea	di,omsg7
	call	outstr
	mov	ax,wds
	call	outc
	call	newline
	lea	di,omsg3
	call	outstr
	mov	ax,up
	call	outc
	call	newline
	lea	di,omsg4
	call	outstr
	mov	ax,lowe
	call	outc
	call	newline
	lea	di,omsg5
	call	outstr
	mov	ax,nume
	call	outc
	call	newline
	lea	di,omsg6
	call	outstr
	mov	ax,nonal
	call	outc
	call	newline
	ret
output	ENDP

code	ENDS

data	SEGMENT
stri	db	1024 dup (0)
cnt	dw	0
up	dw	0
lowe	dw	0
nume	dw	0
nonal	dw	0
wds	dw	0
imsg1	db	"String Analyzer 1.0",04
imsg2	db	"by Calvin O. Ference",04
imsg3	db	"Enter a line of input",04
omsg1	db	"Entered string: ",04
omsg2	db	"Contains: ",04h
omsg3	db	"# of Uppercase characters = ",04
omsg4	db	"# of Lowercase characters = ",04
omsg5	db	"# of Numeric characters = ",04
omsg6	db	"# of Non-alphanumeric characters = ",04
omsg7	db	"# of Words = ",04
msg	db	"Do you wish to evalutate another string? (Y or N) >> ",04
data	ENDS

stak	SEGMENT	STACK
	dw	256 dup (0)
stak	ENDS

		END