; PROGRAM: mylab2.ASM
;
; AUTHOR:  Calvin O. Ference
;
; DESCRIPTION:  This program adds certain HEX values to
;               the general registers


        ASSUME	cs:code

code    SEGMENT
main    PROC    FAR
hajime:
        mov     ah,0FDh
        mov     al,8Eh
        mov     bh,96h
        mov     bl,66h
        mov     ch,0A5h
        mov     cl,0AAh
        mov     dh,18h
        mov     dl,9Bh
ate:
        mov     ax,4C00h
        int     21h

main    ENDP
code    ENDS

        END    
