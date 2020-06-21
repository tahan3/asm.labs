.model small
.stack 100h   

.data     

enter_1 db 'Enter first number: ','$'
enter_2 db 'Enter second number: ','$'
too_big db 'Error! Number too big','$'
corrupt_symbols db 'Error! Incorrect symbols','$'  
correct_message db 'The numbers are correct. Processing...',0ah,0dh,'$' 
and_message db 'AND result: ','$'
or_message db 'OR result: ','$' 
xor_message db 'XOR result: ','$' 
not1_message db 'NOT 1 result: ','$'
not2_message db 'NOT 2 result: ','$'
end_message db 'Succesfully executed binary operations.',0ah,0dh,'$'  
newline db 0ah,0dh,'$'
buffer db 20 dup ('$')
number_of_characters dw 0 
1_number dw 0
2_number dw 0 
buffer_number dw 0
correct dw 1
show_string db 4 dup ('0'),'$'
        
.code 

proc enter_numbers
    mov ah,9  
    entering_first:
    call renew_buffer
    mov dx,offset enter_1
    int 21h
    mov dx,offset newline
    int 21h  
    
    mov dx,offset buffer
    mov ah,0ah
    int 21h  
    mov ah,9 
    mov dx,offset newline
    int 21h    
    
    call count_number_of_characters 
    cmp number_of_characters,5
    jna check_if_1_correct 
    call big_error
    jmp entering_first
    check_if_1_correct: 
    
    call check_buffer 
    cmp correct,1
    je first_correct
    call corrupt_error
    jmp entering_first
    first_correct:  
    
    call convert_buffer_into_number
    mov bx,buffer_number
    mov 1_number,bx
    mov buffer_number,0
    
    mov ah,9
    entering_second:
    call renew_buffer
    mov dx,offset enter_2
    int 21h
    mov dx,offset newline
    int 21h
    
    mov dx,offset buffer
    mov ah,0ah
    int 21h  
    mov ah,9 
    mov dx,offset newline
    int 21h    
    
    call count_number_of_characters 
    cmp number_of_characters,5
    jna check_if_2_correct 
    call big_error
    jmp entering_second
    check_if_2_correct:
     
    call check_buffer  
    cmp correct,1
    je second_correct
    call corrupt_error
    jmp entering_second
    second_correct: 
    
    call convert_buffer_into_number
    mov bx,buffer_number
    mov 2_number,bx
    
    mov ah,9
    mov dx,offset correct_message
    int 21h
          
    ret    
enter_numbers endp 
    
proc big_error
    mov ah,9  
    mov dx,offset too_big
    int 21h
    mov dx,offset newline
    int 21h    
    ret    
big_error endp 

proc corrupt_error
    mov ah,9  
    mov dx,offset corrupt_symbols
    int 21h 
    mov dx,offset newline
    int 21h  
    ret    
corrupt_error endp 

proc count_number_of_characters  
    mov number_of_characters,0  
    mov si,2
    counting: 
    cmp buffer[si],'$'
    je stop_counting  
    inc si
    inc number_of_characters 
    jmp counting
    stop_counting:     
    ret  
count_number_of_characters endp

proc renew_buffer
    mov si,0 
    mov cx,20
    renewing: 
    mov buffer[si],'$'
    inc si
    loop renewing      
    ret      
renew_buffer endp     

proc check_buffer   
    mov si,2 
    checking:
    
    cmp buffer[si],0dh
    je stop_checking_good 
    
    cmp buffer[si],57   
    ja letters
    
    cmp buffer[si],48
    jb stop_checking_bad  
    
    inc si
    jmp checking 
    
    letters:
    cmp buffer[si],102
    ja stop_checking_bad
    cmp buffer[si],96
    ja abcdf
    
    cmp buffer[si],70
    ja stop_checking_bad
    cmp buffer[si],64
    ja ABCDFF  
    
    jmp stop_checking_bad
    
    ABCDFF:
    inc si  
    jmp checking
    
    abcdf: 
    inc si  
    jmp checking
    
    stop_checking_bad:
    mov correct,0
    ret
    stop_checking_good:
    mov correct,1
    ret       
   
check_buffer endp
 
proc convert_buffer_into_number 
    mov buffer_number,0
    mov si,2
    converting:
    cmp buffer[si], 0dh
    je stop_converting 
    mov ax,16
    mul buffer_number
    mov buffer_number,ax
    xor bx,bx  
    mov bl,buffer[si] 
    add buffer_number,bx
    sub buffer_number,'0'
    cmp buffer[si],'a'
    jae ahigher 
    cmp buffer[si],'A'
    jae AAhigher
    inc si   
    jmp converting
    ahigher:  
    sub  buffer_number,39
    inc si   
    jmp converting
    AAhigher:
    sub  buffer_number,27
    inc si   
    jmp converting
    stop_converting:
    xor bx,bx
    ret
convert_buffer_into_number endp 

proc execute_operations
    mov buffer_number,0
     
    operation_and:    
    
    mov ah,9
    mov dx,offset and_message
    int 21h
     
    mov ax,1_number
    mov bx,2_number
    and ax,bx
    call show_number_in_16 
    
    operation_or: 
    
    mov ah,9
    mov dx,offset or_message
    int 21h 
    
    mov ax,1_number
    mov bx,2_number
    or ax,bx
    call show_number_in_16 
    
    operation_xor:
    
    mov ah,9
    mov dx,offset xor_message
    int 21h 
      
    mov ax,1_number
    mov bx,2_number
    xor ax,bx
    call show_number_in_16
    
    operation_not:
    
    mov ah,9
    mov dx,offset not1_message
    int 21h 
    
    mov bx,1_number
    mov buffer_number,bx 
    not buffer_number  
    mov ax,buffer_number   
    call show_number_in_16
    
    mov ah,9
    mov dx,offset not2_message
    int 21h
    
    mov bx,2_number
    mov buffer_number,bx 
    not buffer_number  
    mov ax,buffer_number
    call show_number_in_16
    
    ret   
execute_operations endp    


show_number_in_16 proc    
    
        mov     bx,     16      ;divider (base of counting system)
        mov     cx,     0       ;amount of entering numbers
divide:
        xor     dx,     dx      ;divide (dx:ax) on bx
        div     bx                                              
        add     dl,     '0'     ;convert remainer of dividing 
        cmp dl,58
        jb nota  
        add dl,7
        nota:
        push    dx              ;save in stack
        inc     cx              ;inc counter of numbers
        test    ax,     ax      ;if we still have numbers
        jnz     divide          ;repeat  
        
show:
        mov     ah,     02h     ;show number
        pop     dx              
        int     21h             
        loop    show  
        
        mov ah,9
        mov dx,offset newline
        int 21h
                
        ret
show_number_in_16 endp  
    
start:    
    mov ax, @data                   
    mov ds, ax  
    
    call enter_numbers 
    call execute_operations    
    
    mov ah,9
    mov dx,offset end_message
    int 21h
    
    mov ax, 4C00h 
    int 21h    
end start