bits 16
org 0x7c00

_start:
    mov     ax, 0x13
    int     0x10

    mov     ax, 0xa000
    mov     es, ax

    xor     di, di
    xor     ax, ax

    xor     bx, bx

.b:
    mov     cx, 320 * 200
.a:
    mov     byte [es:di], al
    inc     ax
    inc     di
    loop    .a

    mov     ax, 0x8600
    mov     dx, 100
    mov     cx, 0 
    int     0x15

    inc     bx
    mov     ax, bx
    add     ax, 2

    jnz     .b

    hlt
times 510 - ($ - $$) db 0
db 0x55, 0xaa
