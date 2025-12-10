
[BITS    16]
[ORG 0x7C00]



call setup
call pattern

setup:

        push 0xA000
        pop es


        mov ah, 0x0C
        xor al, al 
        xor bx, bx
        xor cx, cx
        xor dx, dx
        
		jmp reset
	ret	


reset:
        xor cx, cx
        mov dx,10




        pattern:
            inc word [aaaa]
            xor al,[aaaa]
            jmp color

            setpixel:
                inc al
                cmp cx, 320
                jae nextline

                cmp dx, 200
                jae reset


                int 0x10

                inc cx


                jmp pattern
                ret
		



color:

        cmp al, 55
        ja subcolor

        cmp al, 32
        jb addcolor

        jmp setpixel
		
subcolor:
        sub al, 16
        jmp color
		
addcolor:
        add al, 32
        jmp color

		
nextline:
        xor cx, cx
        inc dx

        jmp pattern

aaaa dw 0
		

