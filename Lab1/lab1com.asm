.model tine
.code
org 100h
start: mov ah,9
       mov dx, offset message
       int 21h
       ret
message db "1 2 3 4 5",0Dh,0Ah,'$'
       end start       