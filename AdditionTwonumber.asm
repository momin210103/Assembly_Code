.model small
.stack 100h
.data
msg1 db "Enter Two Numbers:$"
num1 db ?
num2 db ?
nl db 10,13,"Sum is:$"
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov num1,al
    
    mov ah,1
    int 21h
    mov num2,al
    
    mov bl,num1
    mov cl,num2
    add bl,cl
    
    mov al,bl
    mov ah,0
    aaa
    
    mov bx,ax
    add bh,48
    add bl,48
    
    mov ah,9
    lea dx,nl
    int 21h  
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main