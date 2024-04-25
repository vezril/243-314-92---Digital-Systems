; PROGRAM: mylab2C.ASM
;
; AUTHOR:  Calvin O. Ference
;
; DESCRIPTION:  This program adds certain HEX values to
;               the general registers, then moves them around.


        ASSUME	cs:code

code    SEGMENT
main    PROC    FAR
hajime:
        mov     ax,0FD8Eh
        mov     bx,9666h
        mov     cx,0A5AAh
        mov     dx,189Bh
kaze:
        mov     ch,al
        mov     al,dl
        mov     dl,cl
        mov     cl,bh
        mov     bh,dl
shi:
        mov     ax,4C00h
        int     21h

main    ENDP
code    ENDS

        END    
