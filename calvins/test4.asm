;---------------------------
;Author:        Calvin O. Ference
;description:   parallel test pgm
;pgm name:      ptest2.asm
;Version 4.0
;---------------------------

        ASSUME  cs:code, ss:stak
        LPT     equ     378h

code    SEGMENT
main    PROC
init:   mov     ax,0
        mov     dx,0
        mov     cx,0

a:	mov	dx,LPT
	mov	al,0d0h
	out	dx,al
	call	delay
	mov	al,0ach
	out	dx,al
	call	delay
	mov	al,2ah
	out	dx,al
	call	delay
	mov	al,41h
	out	dx,al
	call	delay
	jmp	a
main    ENDP


delay   PROC
        mov	cx,0
d0:	mov     bx,0
d1:     nop
        nop
        add     bx,1
        cmp     bx,0ffffh
        jb      d1
	add	cx,1
	cmp	cx,20
	jb	d0
        ret
delay   ENDP

code    ENDS

stak	SEGMENT	stack
	db	1024 dup (0)
stak	ENDS
        END

