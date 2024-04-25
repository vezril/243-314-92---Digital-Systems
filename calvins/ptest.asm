;---------------------------
;Author:        Calvin O. Ference
;description:   parallel port test pgm
;pgm name:      ptest.asm
;Version 1.0
;---------------------------

        ASSUME  cs:code
        LPT     equ     378h

code    SEGMENT
main    PROC
init:   mov     ax,0
        mov     dx,0
        mov     cx,0

tlo:   mov     dx,LPT
        mov     al,0
        out     dx,al
        call    del1ms
thi:    mov     dx,LPT
        mov     al,80h
        out     dx,al
        call    del1ms
             
        
        jmp     tlo

main    ENDP

del1ms  PROC
        mov	cx,0
d0:	mov     bx,0
d1:     nop
        nop
        add     bx,1
        cmp     bx,0ffffh
        jb      d1
	add	cx,1
	cmp	cx,40
	jb	d0
        ret
del1ms   ENDP

code    ENDS
        END
