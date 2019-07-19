;  note name: e6,	frequency: 1318.51 Hz,	duration 0.1500 s
;  note name: e6,	frequency: 1318.51 Hz,	duration 0.1500 s
;  note name: pause,	frequency:    0.00 Hz,	duration 0.0750 s
;  note name: e6,	frequency: 1318.51 Hz,	duration 0.3000 s
;  note name: c6,	frequency: 1046.50 Hz,	duration 0.1500 s
;  note name: e6,	frequency: 1318.51 Hz,	duration 0.3000 s
;  note name: g6,	frequency: 1567.98 Hz,	duration 0.3000 s
;  note name: pause,	frequency:    0.00 Hz,	duration 0.3000 s
;  note name: g5,	frequency:  783.99 Hz,	duration 0.3000 s
;  note name: pause,	frequency:    0.00 Hz,	duration 0.3000 s

bits 16
org 0x7c00

%define notes 9

_start:
        xor     ax, ax
        mov     ds, ax

        mov     al, 0xb6        ; Prepare the speaker for the
        out     0x43, al        ;  note.

        mov     si, _snd
        mov     cx, notes

.play:
        lodsw

        out     0x42, al        ; Output low byte.
        shr     ax, 8
        out     0x42, al
        in      al, 0x61        ; Turn on note (get value from
        or      al, 3
        out     0x61, al        ; Send new value.

        add     si, notes * 2
        sub     si, 2
        mov     ax, word [si]
        sub     si, notes * 2
        call    .sl

        in      al, 0x61
        and     al, 0xfc
        out     0x61, al

        mov     dx, 4        
.x      mov     ax, -1
.z:     dec     ax
        jnz     .z
        dec     dx
        jnz     .x
        
        loop    .play


        hlt
        ret
.sl:
        push    cx
        mov     cx, ax
        shl     cx, 1
        xor     dx, dx
        mov     ax, 0x8600
        int     0x15
        pop     cx
        ret


_snd:    dw  3619, 3619,  1, 3619, 4560, 3619, 3043, 1, 6087, 
         dw     2,    2,  1,    4,    2,    4,    4, 4,    4, 

times 510 - ($ - $$) db 0
db 0x55, 0xaa
