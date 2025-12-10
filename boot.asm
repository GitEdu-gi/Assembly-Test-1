[BITS 16]
[ORG 0x7C00]

Call setupp
setupp:
    xor ax,ax

    mov ds,ax

    cld
    mov ax,0x13
    int 0x10
    mov si,string
    mov bl,9

    Printstr:
        mov bh,0
    first:
        mov bl,32
    print:
        lodsb
        inc bl
        cmp bl,55
        je first
        cmp al,0
        je setup
        mov ah,0Eh
        int 0x10
        jmp print

string db "Opa galera da github",0
%include "draw.asm"
times 510 - ($-$$) db 0
dw  0AA55h