;=============================================================================
; PROGRAM: LAB3B.ASM
;
; DESCRIPTION: A program which demonstrates the manipulation of data variables
; in memory
;
; AUTHOR: Calvin Ouellet-Ference
;=============================================================================

        Assume cs:code, ds:data
code    SEGMENT
main    PROC
init:
        mov     ax,data ;beinging instructions
        mov     ds,ax   ;data segment

start:
        mov     ax,55aah
        mov     bx,96a5h
        mov     cx,0ffffh

send2mem:

        mov     word1,0CDABh
        mov     word2,096EFh
        mov     word3,5A5Ah
        mov     word4,0bcdch
        mov     word4+1,6543h
        mov     byte1,99h
        mov     byte2,88h
        mov     bytes,55h
        mov     bytes+1,66h
        mov     word4+8,0304h
        mov     word4+10,81ech
        mov     word4+12,84ech
        mov     word4+14,5700h
        mov     word4+16,0e956h
        mov     word4+18,00bch

back2dos:

        mov     ax,4c00h
        int     21h

main    ENDP
code    ENDS
;
; Data Section below
;
;
;
;

data    SEGMENT
word1   DW      9999h   ;marker
word2   DW      0
word3   DW      0
word4   DW      0
        DW      4 DUP (0)
byte1   DB      0
byte2   DB      0
bytes   DB      1,2,3,4
data    ENDS

        END

