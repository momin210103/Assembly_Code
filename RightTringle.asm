.model small
.stack 100h
.data
r db 5
st db 1
spc db 4 
nl db 10,13,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ch,0
    
    outer:
    mov cl,spc
    cmp cl,0
    jle stars 
    
    
    spc_loop:
    mov ah,2
    mov dl,' '
    int 21h
    loop spc_loop
    

    
    
    stars: 
    mov cl,st 
    st_loop:
    mov ah,2
    mov dl,"*" 
    
    
    int 21h
    loop st_loop  
    
    
    
    
    
    
    mov ah,9
    lea dx,nl
    int 21h
    
    dec spc
    inc st
    dec r
    jnz outer
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main

    