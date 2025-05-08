.model small
.stack 100h
.data 
msg1 db "Enter a number or word:$"
msg2 db 10,13,"It is a palindrome$"
msg3 db 10,13,"It is not a palindrome$" 
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
    
    mov si, offset buffer+2
    mov di,si
    mov cl,[buffer+1]
    mov ch,0
    add di,cx
    dec di
    
    check:
    mov al,[si]
    mov bl,[di]
    
    cmp al,bl
    jne not_pal
    
    inc si
    dec di
    loop check
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    
    not_pal:
    mov ah,9
    lea dx,msg3
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main