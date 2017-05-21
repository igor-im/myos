;
; A simple boot sector that prints a message to the screen using a BIOS routine.
;
; where you expect the code to be in memory
[org 0x7c00]

mov ah, 0x0e 	; int 10/ah = 0eh -> scrolling teletype BIOS routine

mov al , [ the_secret ]
int 0x10 
the_secret :
    db "Booting OS",0
;
; Padding and magic BIOS number.
;

  times 510-($-$$) db 0 ; Pad the boot sector out with zeros
  
  dw 0xaa55             ; Last two bytes form the magic number,
                        ; so BIOS knows we are a boot sector.