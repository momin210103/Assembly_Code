.model small
.stack 100h
.data
msg db "Enter the (1-9)$:"
nl db 13,10,'$'
st db "*$"
eq db "=$"
num db ?
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov num,al
    
    mov ah,9
    lea dx,nl
    int 21h
    
    mov cl,1 
    
    table:
    mov ah,2
    mov dl,num
    add dl,48
    int 21h
    
    mov ah,9
    lea dx,st
    int 21h
    
    mov ah,2
    mov dl,cl
    add dl,48
    int 21h
    
    mov ah,9
    lea dx,eq
    int 21h
    
    mov al,num
    mul cl
    aam
    
    mov bx,ax
    
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h  
    
    mov ah,9
    lea dx,nl
    int 21h
    
    
    inc cl
    cmp cl,10
    jbe table
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    