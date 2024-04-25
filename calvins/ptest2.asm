;---------------------------
;Author:        Calvin O. Ference
;description:   parallel test pgm
;pgm name:      ptest2.asm
;Version 1.0
;---------------------------

        ASSUME  cs:code
        LPT     equ     378h

code    SEGMENT
main    PROC
init:   mov     ax,0
        mov     dx,0
        mov     cx,0

a:   mov     dx,LPT
        mov     al,20h
        out     dx,al
        call    delay
b:    mov     dx,LPT
        mov     al,0d0h
        out     dx,al
        call    delay
c1:      mov     dx,LPT
        mov     al,0ach
        out     dx,al
        call    delay
d:      mov     dx,LPT
        mov     al,2ah
        out     dx,al
        call    delay
e:      mov     dx,LPT
        mov     al,41h
        out     dx,al
        call    delay
f:      mov     dx,LPT
        mov     al,0B0h
        out     dx,al
        call    delay
        jmp     a
        
       

main    ENDP

delay   PROC
        mov     bx,0
d1:     nop
        nop
        add     bx,1
        cmp     bx,0ffffh
        jb      d1
        ret
delay   ENDP

code    ENDS
        END
