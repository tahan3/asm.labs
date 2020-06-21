.model small
.stack 100h 

.data                             
    newline db 0dh, 0ah, '$'
    base_number dw 0  
    cx_buf dw 0
    ten db 10
    position dw 0
    random_number dw 0 
    player_position dw 881
    token_position dw 884
    1_monster_position dw 41
    2_monster_position dw 78
    3_monster_position dw 918
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;; 
    player_direction db 'w'
    player_skin db 18h,0Eh
    token_skin db 6Fh,03h
    monster_skin db 02h,0Ch
    wall db ' ', 1Fh
    red_wall db ' ', 47h
    space db ' ', 0Fh
    g_space db ' ', 00h
    c_space db ' ', 07h
    black db 0Fh 
    info_line db 'S',0Fh,'c',0Fh,'o',0Fh,'r',0Fh,'e',0Fh,':',0Fh,' ',0Fh,'0',0Fh, 32 dup (' ',0Fh)
    score dw 0
    score_for_operations dw 0
    one_digit_of_score dw 0
    digits_of_score dw 0
    map db 40 dup ('w')
    db 'w', 9 dup ('s'),'w', 18 dup ('s'),'w', 9 dup ('s'),'w'
    db 'w','s',7 dup ('w'),'s','w','s','w','s',4 dup('w'),'s',2 dup('w'),'s',4 dup('w'),'s','w','s','w','s',7 dup ('w'),'s','w'
    db 'w', 9 dup ('s'),'w','s','w',4 dup ('s'),'w','s',2 dup ('w'),'s','w',4 dup ('s'),'w','s','w',9 dup ('s'),'w'  
    db 'w','s',3 dup ('w'),'s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',2 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s',3 dup ('w'),'s','w'
    db 'w',3 dup ('s'),'w',3 dup ('s'),'w','s','w',18 dup ('s'),'w','s','w',3 dup ('s'),'w',3 dup ('s'),'w'
    db 3 dup ('w'),'s',3 dup ('w'),'s','w','s',3 dup ('w'),'s','w','s',8 dup ('w'),'s','w','s',3 dup ('w'),'s','w','s',3 dup ('w'),'s',3 dup ('w')
    db 'w', 5 dup ('s'),'w',7 dup ('s'),'w', 10 dup ('s'),'w',7 dup ('s'),'w', 5 dup ('s'),'w'
    db 'w','s',3 dup ('w'),'s','w','s',5 dup ('w'),'s',2 dup ('w'),'s','w','s',2 dup ('w'),'s','w','s',2 dup ('w'),'s',5 dup ('w'),'s','w','s',3 dup ('w'),'s','w'
    db 'w','s',3 dup ('w'),'s','w',10 dup ('s'),'w','s',2 dup ('w'),'s','w',10 dup ('s'),'w','s',3 dup ('w'),'s','w'
    db 'w','s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s',2 dup ('w'),'s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s','w'
    db 'w','s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s','w','s','w','s',2 dup ('w'),'s','w','s','w','s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s','w'
    ;db 'w',12 dup ('s'),'w',5 dup ('s'),2 dup ('w'),5 dup ('s'),'w',12 dup ('s'),'w'
    ;db 5 dup ('w'),'s',3 dup ('w'),'s',4 dup ('w'),'s',10 dup ('w'),'s',4 dup ('w'),'s',3 dup ('w'),'s',5 dup ('w')
    ;db 'w',12 dup ('s'),'w',5 dup ('s'),2 dup ('w'),5 dup ('s'),'w',12 dup ('s'),'w'
    db 'w',7 dup ('s'),4 dup ('w'),'s','w',5 dup ('s'),2 dup ('w'),5 dup ('s'),'w','s',4 dup ('w'),7 dup ('s'),'w'
    db 'w','s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s',2 dup ('w'),'s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s','w' 
    db 'w','s',3 dup ('w'),'s','w',10 dup ('s'),'w','s',2 dup ('w'),'s','w',10 dup ('s'),'w','s',3 dup ('w'),'s','w'
    db 'w','s',3 dup ('w'),'s','w','s',5 dup ('w'),'s',2 dup ('w'),'s','w','s',2 dup ('w'),'s','w','s',2 dup ('w'),'s',5 dup ('w'),'s','w','s',3 dup ('w'),'s','w'
    db 'w', 5 dup ('s'),'w',7 dup ('s'),'w', 10 dup ('s'),'w',7 dup ('s'),'w', 5 dup ('s'),'w' 
    db 3 dup ('w'),'s',3 dup ('w'),'s','w','s',3 dup ('w'),'s','w','s',8 dup ('w'),'s','w','s',3 dup ('w'),'s','w','s',3 dup ('w'),'s',3 dup ('w')
    db 'w',3 dup ('s'),'w',3 dup ('s'),'w','s','w',18 dup ('s'),'w','s','w',3 dup ('s'),'w',3 dup ('s'),'w'
    db 'w','s',3 dup ('w'),'s',3 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',2 dup ('w'),'s','w','s',4 dup ('w'),'s','w','s',3 dup ('w'),'s',3 dup ('w'),'s','w'
    db 'w', 9 dup ('s'),'w','s','w',4 dup ('s'),'w','s',2 dup ('w'),'s','w',4 dup ('s'),'w','s','w',9 dup ('s'),'w' 
    db 'w','s',7 dup ('w'),'s','w','s','w','s',4 dup('w'),'s',2 dup('w'),'s',4 dup('w'),'s','w','s','w','s',7 dup ('w'),'s','w'
    db 'w', 9 dup ('s'),'w', 18 dup ('s'),'w', 9 dup ('s'),'w'
    db 40 dup ('w') 
    death_screen db 400 dup ('s')
    db 3 dup ('s'),3 dup ('w'),2 dup ('s'),2 dup ('w'),2 dup ('s'),'w',3 dup ('s'),'w','s',3 dup ('w'),2 dup ('s'),3 dup ('w'),'s','w','s','w','s',3 dup ('w'),'s',3 dup ('w'),2 dup ('s')
    db 2 dup ('s'),'w',4 dup ('s'),'w',2 dup ('s'),'w','s',2 dup ('w'),'s',2 dup ('w'),'s','w',4 dup ('s'),'w','s','w','s','w','s','w','s','w',3 dup ('s'),'w','s','w',2 dup ('s')
    db 2 dup ('s'),'w','s',2 dup ('w'),'s','w',2 dup ('s'),'w','s','w','s','w','s','w','s',3 dup ('w'),2 dup ('s'),'w','s','w','s','w','s','w','s',3 dup ('w'),'s',2 dup ('w'),3 dup ('s')
    db 2 dup ('s'),'w',2 dup ('s'),'w','s',4 dup ('w'),'s','w',3 dup ('s'),'w','s','w',4 dup ('s'),'w','s','w',2 dup ('s'),'w',2 dup ('s'),'w',3 dup ('s'),'w','s','w',2 dup ('s')
    db 3 dup ('s'),3 dup ('w'),'s','w',2 dup ('s'),'w','s','w',3 dup ('s'),'w','s',3 dup ('w'),2 dup ('s'),3 dup ('w'),2 dup ('s'),'w', 2 dup ('s'),3 dup ('w'),'s','w','s','w',2 dup ('s')
    db 400 dup ('s')   
    output_line_size equ 40     
   
.code       

proc set_field 
    mov cx,25
    mov bx,0
    setting_rows:    
        mov cx_buf, cx 
        mov cx, output_line_size
        mov di, position
        add di,di
        setting_cols:       
            push 0B800h
            pop es
            cmp map[bx],'w'
            jne skip1                           
            mov si,offset wall      
            movsb
            movsb
            jmp skip2:
            skip1:
            inc si 
            inc si
            inc di
            inc di
            skip2:
            inc position
            inc bx
        loop setting_cols
        mov cx,cx_buf    
    loop setting_rows
    mov position,0 
    ret     
set_field endp

proc set_death_screen
mov cx,24
    mov bx,0
    setting_death_rows:    
        mov cx_buf, cx 
        mov cx, output_line_size
        mov di, position
        add di,di
        setting_death_cols:       
            push 0B800h
            pop es 
            cmp death_screen[bx],'w'
            jne skip1_death                           
            mov si,offset red_wall      
            movsb
            movsb
            jmp skip2_death:
            skip1_death:
            mov si,offset g_space      
            movsb
            movsb
            skip2_death:
            inc position
            inc bx
        loop setting_death_cols
        mov cx,cx_buf    
    loop setting_death_rows
    mov position,0 
    ret         
set_death_screen endp 

proc set_clear_screen 
 mov cx,25
    mov bx,0  
    mov cx_buf, cx 
    setting_rows_clear:         
        mov cx, output_line_size
        mov di, position
        add di,di
        setting_cols_clear:       
            push 0B800h
            pop es                       
            mov si,offset c_space      
            movsb
            movsb
            inc position
            inc bx
        loop setting_cols_clear           
    loop setting_rows_clear 
    mov cx,cx_buf
    mov position,0       
    ret
set_clear_screen endp 

proc set_info 
    mov cx_buf, cx     
        mov cx, output_line_size
        add cx, cx
        push 0B800h
        pop es                               
        mov si,offset info_line
        mov di,1920             
        rep movsb        
    mov cx,cx_buf
    ret     
set_info endp

proc set_player_and_monsters 
    mov cx_buf, cx     
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset player_skin
        mov di,player_position
        add di,di             
        rep movsb   
        
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 1_monster_position 
        add di,di            
        rep movsb 
       
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 2_monster_position
        add di,di              
        rep movsb 
          
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 3_monster_position 
        add di,di             
        rep movsb
         
         
    mov cx,cx_buf
    ret     
set_player_and_monsters endp 

proc set_player
    mov cx_buf, cx
    mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset player_skin
        mov di,player_position
        add di,di             
        rep movsb 
    mov cx,cx_buf
    ret 
set_player endp

proc set_monsters
    mov cx_buf, cx 
    mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 1_monster_position 
        add di,di            
        rep movsb 
       
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 2_monster_position
        add di,di              
        rep movsb 
          
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset monster_skin
        mov di, 3_monster_position 
        add di,di             
        rep movsb
    mov cx,cx_buf
    ret     
set_monsters endp


proc clear_place
    mov cx_buf, cx     
        push 0B800h
        pop es                               
        mov si,offset space
        mov di,player_position
        add di,di             
        movsb
    mov cx,cx_buf
    ret            
clear_place endp

proc clear_place_universal
    mov cx_buf, cx     
        push 0B800h
        pop es                               
        mov si,offset space
        mov di,bx
        add di,di             
        movsb
    mov cx,cx_buf
    ret            
clear_place_universal endp

proc set_token
   mov cx_buf, cx     
        mov cx, 2
        push 0B800h
        pop es                               
        mov si,offset token_skin
        mov di,token_position
        add di,di             
        rep movsb
    mov cx,cx_buf
    ret      
set_token endp 


proc randomize_token
     mov cx_buf, cx  
     randomizing_till_good:
        mov cx,0
        mov token_position,0
                 
        call generate_random_number
        cmp dx,961
        jae randomizing_till_good
        mov token_position,dx
                
        mov bx,token_position
        cmp map[bx],'w'
     je randomizing_till_good
     mov cx,cx_buf
     ret
randomize_token endp 

proc generate_random_number
    mov ax, 25173          ; LCG Multiplier
    mul base_number     ; DX:AX = LCG multiplier * seed
    add ax, 13849          ; Add LCG increment value
    ; Modulo 65536, AX = (multiplier*seed+increment) mod 65536
    mov base_number, ax          ; Update seed = return value 
    xor dx, dx
    mov cx, 1000    
    div cx
    ret
generate_random_number endp 

proc increase_score  
    inc score
    ret  
increase_score endp 

proc set_score 
    mov cx_buf,cx
      
    mov bx, score
    mov score_for_operations,bx
    mov digits_of_score,0 
     
    mov ax, score_for_operations
    mul ten
    mov score_for_operations, ax 
    
    setting_digits_of_score:
    
        inc digits_of_score
        
        mov ax, score_for_operations
        div ten 
        xor ah,ah
        mov score_for_operations, ax 
    
    cmp score_for_operations,10

    jae setting_digits_of_score
     
    mov di,1932
    add di,digits_of_score
    add di,digits_of_score 

    mov ax,score
    mov score_for_operations,ax
    
    writing_score:
        
        mov ax,score_for_operations
        div ten 
        
        mov bx,ax
        xor bh,bh
        mov score_for_operations,bx
                
        mov al,ah
        xor ah,ah
         
        mov one_digit_of_score,ax
        add one_digit_of_score,48 
        
        dec digits_of_score 
        push 0B800h
        pop es                                
        mov si,offset one_digit_of_score              
        movsb
        sub di,3 
        
    cmp digits_of_score,0
    jne writing_score 
    
   ;; cmp score,100
   ;; jne return_from_set_score  
    ;;;    mov score,0 
     ;;   mov cx,4
     ;;  push 0B800h
      ;;  pop es  
     ;;   mov di,1934
     ;;   mov si,offset space
     ;;   rep movsb  
  ;;  return_from_set_score:
    
    mov cx,cx_buf
    ret
set_score endp 

proc direct_monsters   
    directing_first_monster:
    mov bx,1_monster_position
    call clear_place_universal
    call generate_random_number
    cmp dx,750 
    jae try_going_w_1
    cmp dx,500
    jae try_going_a_1
    cmp dx,250
    jae try_going_s_1
        add bx,1
        cmp map[bx],'w'
        je directing_first_monster
        jmp directed_1
    try_going_w_1:
        sub bx,40
        cmp map[bx],'w'
        je directing_first_monster
        jmp directed_1
    try_going_a_1:
        sub bx,1
        cmp map[bx],'w'
        je directing_first_monster
        jmp directed_1 
    try_going_s_1:
        add bx,40
        cmp map[bx],'w'
        je directing_first_monster
        jmp directed_1
    directed_1:
    mov 1_monster_position,bx 
    
    directing_second_monster:
    mov bx,2_monster_position
    call clear_place_universal
    call generate_random_number
    cmp dx,750 
    jae try_going_w_2
    cmp dx,500
    jae try_going_a_2
    cmp dx,250
    jae try_going_s_2
        add bx,1
        cmp map[bx],'w'
        je directing_second_monster
        jmp directed_2
    try_going_w_2:
        sub bx,40
        cmp map[bx],'w'
        je directing_second_monster
        jmp directed_2
    try_going_a_2:
        sub bx,1
        cmp map[bx],'w'
        je directing_second_monster
        jmp directed_2 
    try_going_s_2:
        add bx,40
        cmp map[bx],'w'
        je directing_second_monster
        jmp directed_2
    directed_2:
    mov 2_monster_position,bx 
    
    directing_third_monster:
    mov bx,3_monster_position
    call clear_place_universal
    call generate_random_number
    cmp dx,750 
    jae try_going_w_3
    cmp dx,500
    jae try_going_a_3
    cmp dx,250
    jae try_going_s_3
        add bx,1
        cmp map[bx],'w'
        je directing_third_monster
        jmp directed_3
    try_going_w_3:
        sub bx,40
        cmp map[bx],'w'
        je directing_third_monster
        jmp directed_3
    try_going_a_3:
        sub bx,1
        cmp map[bx],'w'
        je directing_third_monster
        jmp directed_3 
    try_going_s_3:
        add bx,40
        cmp map[bx],'w'
        je directing_third_monster
        jmp directed_3
    directed_3:
    mov 3_monster_position,bx
    ret
direct_monsters endp


start:        
    mov ax,@data
    mov ds,ax
    mov es,ax 
    xor si,si 
    xor di,di  
    
    ;
    mov     ah, 00h   ; interrupt to get system timer in CX:DX 
    int     1ah
    mov     base_number, dx 
    ;
    
    mov ah,00  
    mov al,01  
    int 10h 
    
    mov ah,01 
    mov cx,2607h 
    int 10h
    
    call set_field
    call set_info
    call set_player_and_monsters
    call set_token
     
    main_cycle:
        mov cx,0
        mov dx,65535  
            
        mov ah,86h              
        int 15h            
        int 15h
        int 15h            
        int 15h           
        int 15h 
            
        mov dx,1_monster_position
        cmp player_position,dx
        je death 
        
        mov dx,2_monster_position
        cmp player_position,dx
        je death 
        
        mov dx,3_monster_position
        cmp player_position,dx
        je death 
        
        mov dx,token_position 
        cmp player_position,dx
        jne skip_randomizing_token
        call randomize_token
        call increase_score 
        call set_token
        call set_score
        skip_randomizing_token:
        
        ;; 
        call direct_monsters
        call set_player_and_monsters
 
        ;;
        mov ah,1          
        int 16h
        jz no_key_pressed 
    
        mov ah,00h               
        int 16h                 
        
        cmp ah,11h               
        jne not_w_key_pressed:
        mov player_skin,18h
        mov player_direction,'w'
        jmp no_key_pressed
        not_w_key_pressed:
        
        cmp ah,1Eh               
        jne not_a_key_pressed:
        mov player_skin,1Bh
        mov player_direction,'a'
        jmp no_key_pressed
        not_a_key_pressed:
        
        cmp ah,1Fh               
        jne not_s_key_pressed:
        mov player_skin,19h
        mov player_direction,'s'
        jmp no_key_pressed
        not_s_key_pressed: 
        
        cmp ah,20h               
        jne not_d_key_pressed:
        mov player_skin,1Ah
        mov player_direction,'d'
        jmp no_key_pressed
        not_d_key_pressed:
        
        no_key_pressed: 
          
        
        cmp player_direction, 'w'               
        je w_key
        cmp player_direction, 'a'               
        je a_key 
        cmp player_direction, 's'               
        je s_key
        cmp player_direction, 'd'               
        je d_key
            
        jmp main_cycle
    w_key:  
        mov si,player_position
        sub si,40
        cmp map[si],'w'
        je wall_w
        call clear_place 
        sub player_position,40 
        wall_w:
        call set_player_and_monsters
        jmp main_cycle
    a_key: 
        mov si,player_position
        sub si,1
        cmp map[si],'w'
        je wall_a 
        call clear_place
        sub player_position,1
        wall_a:
        call set_player_and_monsters
        jmp main_cycle
    s_key:
        mov si,player_position 
        add si,40
        cmp map[si],'w'
        je wall_s 
        call clear_place
        add player_position,40
        wall_s:
        call set_player_and_monsters
        jmp main_cycle
    d_key:
        mov si,player_position 
        add si,1
        cmp map[si],'w'
        je wall_d
        call clear_place
        add player_position,1
        wall_d:
        call set_player_and_monsters
        jmp main_cycle 
        
      death:
      call set_death_screen
      
    ;mov dx,65535      
    ;mov ah,86h              
    ;mov cx,100
    waiting_game_over:
     ;  int 15h
    jmp waiting_game_over 
     
    ;call set_clear_screen     
    mov ax,4c00h
    int 21h
    
end start
