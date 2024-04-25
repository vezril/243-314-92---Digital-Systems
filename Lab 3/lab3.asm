;=============================================================================
; PROGRAM: LAB3.ASM
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

        mov     word2,ax
        mov     word3,bx
        mov     word4+4,cx      ;adds 4 to word4
        mov     byte1,ah
        mov     byte2,al
        mov     bytes,bl
        mov     bytes+1,bh      ;adds 1 to bytes

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

