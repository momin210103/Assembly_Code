.model small
.stack 100h
.data
msg db "Print A to Z $:"
nl db 10,13,'$'
cr db 0
.code 
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,9
    lea dx,nl
    int 21h
    
    mov bl,'A'
    print:
    mov ah,2
    mov dl,bl
    int 21h
    inc bl
    inc cr
    cmp cr,26
    jl print
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main