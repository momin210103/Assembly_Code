.model small
.stack 100h
.data
msg1 db "Enter a number or word:$"
msg2 db 13,10,"Reversed:$"
buffer db 50
    db ?
    db 50 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
           
           
    mov ah,0Ah
    lea dx,buffer
    int 21h
    
    mov si,offset buffer+2
    mov cl,[buffer+1]
    mov ch,0
    
    
    mov bx,0
    _push:
    mov al,[si]
    push ax
    inc si
    inc bx
    loop _push 
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    mov cx,bx
    _pop:
    pop dx
    mov ah,2
    int 21h
    loop _pop
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    