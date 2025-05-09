.model small
.stack 100h
.data
a db "Enter Three Numbers:$"
b db 10,13,"Largest Value:$"
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,1
    int 21h
    mov cl,al 
    
    cmp bl,bh
    jg lev1
    jmp lev2
    
    lev1:
    cmp bl,cl
    jg lev3
    jmp lev4
    
    lev2:
    cmp bh,cl
    jg lev5
    jmp lev6
    
    
    lev3:
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    lev4:
    cmp cl,bh
    jg lev6
    jmp lev5   
    
    lev5: 
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit   
    
    lev6:
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    