.model small
.stack 100h
.data
cr db 0 
.code 
main proc
    mov ax,@data
    mov ds,ax 
    
    
    mov bl,'0'
    
    print:
    mov ah,2
    mov dl,bl
    int 21h
    
    inc bl
    inc cr
    
    cmp cr,10
    jl print 
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main