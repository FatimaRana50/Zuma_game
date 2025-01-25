include Irvine32.inc
include macros.inc
;;new ones 

includelib winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD
.data

    zuma_art       db '           __________                             ___        ___       ____    ',13,10
               db '                     |_________|        ----        ----   |   \      /   |     /    \   ',13,10
               db '                             |          |  |        |  |   |    \    /    |    /      \  ',13,10
               db '                           |            |  |        |  |   |     \  /     |   /________\ ',13,10
               db '                          |             |  |        |  |   |      \/      |  / ________ \ ',13,10
               db '                         |__________    \  \_______/   |   |              | /            \ ' ,13,10
               db '                        |___________|    \____________/    |              |/              \  ',13,10,0
               db '                ',13,10,0


                                                              
              


msg1 db "enter your name ",0
name1 db 20 dup (32)
gamestart         DB '                                               ___ ___ ___ ___ ___   ',13,10
                  DB '                                              / __|_ _| . | . |_ _|  ',13,10
                  DB '                                              \__ \| ||   |   /| |   ',13,10
                  DB '                                              <___/|_||_|_|_\_\|_|   ',13,10
                  DB 0   

game_ins        DB '                                     _ _ _ ___ ___ ___ _ _ ___ ___ _ ___ _ _ ___ ',13,10
                DB '                                    | | \ / __|_ _| . | | |  _|_ _| | . | \ / __>',13,10
                DB '                                    | |   \__ \| ||   |   | <__| || | | |   \__ \',13,10
                DB '                                    |_|_\_<___/|_||_\_`___`___/|_||_`___|_\_<___/',13,10
                DB 0
            
gamexit          DB '                                                  _____  _ _ ___   ',13,10
                 DB '                                                 | __\ \/ | |_ _|  ',13,10
                 DB '                                                 | _> \ \ | || |   ',13,10
                 DB '                                                 |____/\_\|_||_|   ',13,10
                 DB 0
menuchoice db 0
mypointer            DB'  <<<<<<<<<<<<<<<<   ',13,10
                     DB 0

Instructionstr db 'Controls:                                                                                        ',13,10
                     db '                                                                                                 ',13,10
                     db ' 1-Use the (Arrow Keys) to aim and shoot balls from the frog.                                     ',13,10
                     db ' 2-Press the Spacebar to switch between the current and next ball.                               ',13,10
                     db '                                                                                                 ',13,10
                     db 'Gameplay:                                                                                       ',13,10
                     db '                                                                                                 ',13,10
                     db ' 1-Match three or more balls of the same color to eliminate them from the chain.                 ',13,10
                     db ' 2-Prevent the chain of balls from reaching the skull at the end of the path.                    ',13,10
                     db ' 3-Eliminate the entire chain to advance to the next level.                                      ',13,10
                     db '                                                                                                 ',13,10
                     db 'Power-ups:                                                                                      ',13,10
                     db '                                                                                                 ',13,10
                     db ' 1-Special balls may appear (e.g., Bombs, Slow, Reverse) to help clear the chain.                ',13,10
                     db ' 2-Shoot these power-ups to activate their effects.                                              ',13,10
                     db '                                                                                                 ',13,10
                     db 'Scoring:                                                                                        ',13,10
                     db '                                                                                                 ',13,10
                     db ' 1-Eliminating balls earns points.                                                               ',13,10
                     db ' 2-Bigger combos and chain reactions grant bonus points.                                         ',13,10
                     db ' 3-Clearing levels quickly adds time-based bonuses.                                              ',13,10
                     db '                                                                                                 ',13,10
                     db 'Game Over:                                                                                      ',13,10
                     db '                                                                                                 ',13,10
                     db ' 1-If the chain reaches the skull, the game is over.                                             ',13,10
                     db ' 2-Complete all levels to win the game.                                                          ',13,10
                     db 0


                     pauseScreen         db'                 $$$$$$$\  $$$$$$$$\  $$$$$$\  $$\   $$\ $$\      $$\ $$$$$$$$\ ',13,10
                    db'                 $$  __$$\ $$  _____|$$  __$$\ $$ |  $$ |$$$\    $$$ |$$  _____|',13,10
                    db'                 $$ |  $$ |$$ |      $$ /  \__|$$ |  $$ |$$$$\  $$$$ |$$ |      ',13,10
                    db'                 $$$$$$$  |$$$$$\    \$$$$$$\  $$ |  $$ |$$\$$\$$ $$ |$$$$$\    ',13,10
                    db'                 $$  __$$< $$  __|    \____$$\ $$ |  $$ |$$ \$$$  $$ |$$  __|   ',13,10
                    db'                 $$ |  $$ |$$ |      $$\   $$ |$$ |  $$ |$$ |\$  /$$ |$$ |      ',13,10
                    db'                 $$ |  $$ |$$$$$$$$\ \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$$$$$$$\ ',13,10
                    db'                 \__|  \__|\________| \______/  \______/ \__|     \__|\________|',13,10
                    db'                                                                                ',13,10
                    db 0


 gameOverScreen   db'                    ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0     

    ; Level layout

    walls BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0



 walls2   BYTE " _____________________________________________________________________________  ", 0
          BYTE "|                                                                             |", 0
          BYTE "|    _________________________________________________________________        |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                 ---                                     |", 0
          BYTE "|   |                                |   |                                    |", 0
          BYTE "|   |                                |   |                                    |", 0
          BYTE "|   |                                |   |                                    |", 0
          BYTE "|   |                                 ---                                     |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |_________________________________________________________________________|", 0

          walls21  BYTE " ______________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|    _________________________________________________________________        |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                ---                                      |", 0
          BYTE "|   |                               |   |                                     |", 0
          BYTE "|   |                               |   |                                     |", 0
          BYTE "|   |                               |   |                                     |", 0
          BYTE "|   |                                ---                                      |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |                                                                         |", 0
          BYTE "|   |_________________________________________________________________________|", 0

          walls3 BYTE "                                     /\                                        ", 0
            BYTE "                                    /  \                                       ", 0
            BYTE "                                   /    \                                      ", 0
            BYTE "                                  /      \                                     ", 0
            BYTE "                                 /        \                                    ", 0
            BYTE "                                /          \                                   ", 0
            BYTE "                               /            \                                  ", 0
            BYTE "                              /              \                                 ", 0
            BYTE "                             /                \                                ", 0
            BYTE "                            /         3        \                               ", 0
            BYTE "                           /         ---        \                              ", 0
            BYTE "                          /         |   |        \                             ", 0
            BYTE "                         /          |   |         \                            ", 0
            BYTE "                        /           |   |          \                           ", 0
            BYTE "                       /             ---            \                          ", 0
            BYTE "                      /                              \                         ", 0
            BYTE "                     /                                \                        ", 0
            BYTE "                    /                                  \                       ", 0
            BYTE "                   /                                    \                      ", 0
            BYTE "                  /                                      \                     ", 0
            BYTE "                 /                                        \                    ", 0
            BYTE "                /                                          \                   ", 0
            BYTE "               /                                            \                  ", 0
            BYTE "              /                                              \                 ", 0
            BYTE "              -------------------------------------------------                ", 0
    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

    ; Player's starting position (center)
    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)

    xDir db 0
    yDir db 0

    ; Default character (initial direction)
    inputChar db 0
    direction db "d"

    ; Colors for the emitter and player
    color_red db 4       ; Red
    color_green db 2     ; Green
    color_yellow db 14   ; Yellow (for fire symbol)

    current_color db 4   ; Default player color (red)

    emitter_color1 db 2  ; Green
    emitter_color2 db 4  ; Red

    fire_color db 14     ; Fire symbol color (Yellow)

    ; Emitter properties
    emitter_symbol db "#"
    emitter_row db 0    ; Two rows above player (fixed row for emitter)
    emitter_col db 1    ; Starting column of the emitter

    ; Fire symbol properties (fired from player)
    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic

    ; Interface variables
    score dd 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0
    ;ball sprites
    ball db 'O',0
    initialbally db 28
    MAX_BALLS EQU 100 
    ;ball structs 
    Ball1 STRUCT
    x_cor dw ?     
    y_cor dw ?      
    color db ?        
    Ball1 ENDS
    balls Ball1 MAX_BALLS DUP(< >)
    ballCount WORD 0 
    ball_ka_y db 150 dup(0)
    ball_ka_x db 150 dup(0)
    ball_color db 150 dup(0)
    activeballs db 150 dup (-1)
    bcount db 0
    ;collision logic
    matchedindex dd 0
    matches db 0
     soundFile db "shapeofyou.wav", 0 
     sound2 db "espresso.wav",0
     sound3 db "Apt.wav",0
     spaces db ' '

     ;level2;;;;;;;;;;;;;;

     ball_ka_y_l2 db 200 dup(0)
     ball_ka_x_l2 db 200 dup(0)
     ball_colorl2 db 200 dup (0)
     activeballs2 db 200 dup(-1)
     bcount2 db 0
  
  ;;level3 vaoables///////////

  ball_ka_y_l3 db 200 dup(0)
  ball_ka_x_l3 db 200 dup (0)
  ball_colorl3 db 200 dup (0)
  activeballs3 db 200 dup(-1)
  bcount3 db 0
  gamerunning db 1
  ;filehandling
  filename    db 'score.txt', 0

  fileHandle dd 0 
BUFSIZE = 5000
buffer BYTE BUFSIZE DUP(?)
bytesRead DWORD  0
nameLabel db "Name: ", 0
scoreLabel db "Score: ", 0
levelLabel db "Level: ", 0
newline db 13, 10, 0 
buffer2 BYTE BUFSIZE DUP(?)
errorMessageWrite db 'Error: Failed to write to the file.', 0
filename2 db "score1.txt"

buffer_score db 3 dup(?)
buffer_level db 3 dup(?)
buffer_level1 db "one",0
buffer_level2 db "two",0
buffer_level3 db "three",0
;sound 
SND_ALIAS    DWORD 00010000h
    SND_RESOURCE DWORD 00040005h
    SND_SYNC       EQU 0000h       ; Play sound synchronously
    SND_ASYNC      EQU 0001h       ; Play sound asynchronously
    SND_FILENAME   EQU 20000h      ; Play sound from file
.code
; Add a new ball to the array
addball_l1 PROC

movzx esi,bcount
mov ball_ka_y[esi],28
mov ball_ka_x[esi],17

mov eax, 2                    ; Upper bound for random range (2 colors)
    call RandomRange              ; Generate random number (0 or 1)
    cmp eax, 0
    je set_red
    mov ball_color[esi], 14       ; Yellow color (14)
    jmp set_active

set_red:
    mov ball_color[esi], 4        ; Red color (4)

set_active:
    mov activeballs[esi], 1      

;mov ball_color[esi],4
;mov activeballs[esi],1
inc bcount

ret
addball_l1 ENDP

addball_l2 PROC
movzx esi,bcount2

mov ball_ka_y_l2[esi],28
mov ball_ka_x_l2[esi],17

mov eax, 3                    ; Upper bound for random range (3 colors)
call RandomRange              ; Generate random number (0, 1, or 2)
cmp eax, 0
je set_purple                 ; If 0, set the color to purple
cmp eax, 1
je set_light_blue             ; If 1, set the color to light blue
cmp eax, 2
je set_light_green            ; If 2, set the color to light green

set_purple:
    mov ball_colorl2[esi], 13   ; Purple color (13)
    jmp set_active

set_light_blue:
    mov ball_colorl2[esi], 9    ; Light blue color (9)
    jmp set_active

set_light_green:
    mov ball_colorl2[esi], 11   ; Light green color (10)  cyan 
    jmp set_active

set_active:
    mov activeballs2[esi], 1   ; Mark the ball as active

inc bcount2
ret
addball_l2 ENDP

addball_l3 PROC
movzx esi,bcount3

mov ball_ka_y_l3[esi],3
mov ball_ka_x_l3[esi],57

mov eax,5
call RandomRange

cmp eax,0
je setpur
cmp eax,1
je setaq
cmp eax,2
je setgrey
cmp eax,3
je setgreen

cmp eax,4
je setbw

setpur:
mov ball_colorl3[esi],13  ;lightpurple
jmp set_active

setaq:

mov ball_colorl3[esi],3  ;aqua
jmp set_active

setgrey:
mov ball_colorl3[esi],8  ;grey
jmp set_active

setgreen:
mov ball_colorl3[esi],2  ;green
jmp set_active

setbw:
mov ball_colorl3[esi],10  ;birghtwhite
jmp set_active

set_active:
    mov activeballs3[esi], 1   ; Mark the ball as active

inc bcount3





ret
addball_l3 ENDP

drawb_l1 PROC
movzx ecx,bcount
mov esi,0
L2:

movzx eax,ball_color[esi]
call setTextColor
mov bl,ball_ka_y[esi]
mov dh,bl
;mov dh,initialbally
mov bl,ball_ka_x[esi]
mov dl,bl

 call GoToXY
 mov al, activeballs[esi]
 cmp al,1
 jne skipdraw
mov edx,offset ball
call WriteString
jmp too
skipdraw:
 mWrite " "

too:
    inc esi
    loop L2


ret

drawb_l1 ENDP

drawb_l2 PROC

movzx ecx,bcount2
mov esi,0
L2:

movzx eax,ball_colorl2[esi]
call setTextColor
mov bl,ball_ka_y_l2[esi]
mov dh,bl
;mov dh,initialbally
mov bl,ball_ka_x_l2[esi]
mov dl,bl

 call GoToXY
 mov al, activeballs2[esi]
 cmp al,1
 jne skipdraw
mov edx,offset ball
call WriteString
jmp too
skipdraw:
 mWrite " "

too:
    inc esi
    loop L2


ret
drawb_l2 ENDP

drawb_l3 PROC

movzx ecx,bcount3
mov esi,0
L2:

movzx eax,ball_colorl3[esi]
call setTextColor
mov bl,ball_ka_y_l3[esi]
mov dh,bl
;mov dh,initialbally
mov bl,ball_ka_x_l3[esi]
mov dl,bl

 call GoToXY
 mov al, activeballs3[esi]
 cmp al,1
 jne skipdraw
mov edx,offset ball
call WriteString
jmp too
skipdraw:
 mWrite " "

too:
    inc esi
    loop L2


ret
drawb_l3 ENDP
 

 
movball_l1 PROC

movzx ecx,bcount
mov esi,0
loop2:
mov dl,ball_ka_x[esi]  ;top riht se bottom down
cmp dl,99
jz L5

mov dl,ball_ka_y[esi]  ;top right movement 
cmp dl,4
jz L3

mov dl,ball_ka_x[esi]
cmp dl,17
jg L6
sub ball_ka_y[esi],1   ;staright up movemenet 
jmp L4
L3:

add ball_ka_x[esi],2
jmp L4
L5:
mov dl,ball_ka_y[esi]
cmp dl,29
jz L6
add ball_ka_y[esi],1
jmp L4
L6:
sub ball_ka_x[esi],2
L4:
inc esi
LOOP loop2

ret

movball_l1 ENDP


movball_l2 PROC

movzx ecx,bcount2
mov esi,0
loop2:

;;top up mpvement

mov dl,ball_ka_x_l2[esi]  ;top riht se bottom down
cmp dl,99
jz L5

mov dl,ball_ka_y_l2[esi]  ;top right movement 
cmp dl,5
jnz L12
mov dl,ball_ka_x_l2[esi]
cmp dl,21
jge L3

L12:
mov dl,ball_ka_y_l2[esi]  ;top right movement 
cmp dl,4
jz L3





mov dl,ball_ka_x_l2[esi]
cmp dl,21
jg L6
sub ball_ka_y_l2[esi],1   ;staright up movemenet 
jmp L4
L3:

add ball_ka_x_l2[esi],2
jmp L4
L5:
mov dl,ball_ka_y_l2[esi]
cmp dl,29
jz L6
add ball_ka_y_l2[esi],1
jmp L4
L6:
sub ball_ka_x_l2[esi],2
jmp L4
L4:
inc esi
LOOP loop2

ret
movball_l2 ENDP

movball_l3 PROC
movzx ecx,bcount3
mov esi,0

loop3:
mov dl,ball_ka_x_l3[esi]
cmp dl,57
jge L2
jl L3
L2:
mov dl,ball_ka_y_l3[esi]
cmp dl,29
je L4
;simple downright
add ball_ka_x_l3[esi],1
add ball_ka_y_l3[esi],1
jmp akhir
L3:
mov dl,ball_ka_x_l3[esi]
 cmp dl,31
jnz L4



;simple upright
add ball_ka_x_l3[esi],1
sub ball_ka_y_l3[esi],1
jmp akhir

L4:  ;simple left movement

mov dl,ball_ka_y_l3[esi]
cmp dl,29
jnz L5

sub ball_ka_x_l3[esi],2
jmp akhir
L5:
add ball_ka_x_l3[esi],1
sub ball_ka_y_l3[esi],1



akhir:
inc esi
LOOP loop3

ret
movball_l3 ENDP

addBall PROC
    mov ax, ballCount          ; Load the current number of balls
    cmp ax, MAX_BALLS          ; Check if we can add more balls
    jae endAddBall             ; If full, exit

    ; Calculate the address of the new ball
    mov bx, ax                 ; Ball index
    imul ebx, TYPE Ball1         ; Multiply index by size of Ball
    mov edi, OFFSET balls       ; Base address of the balls array
    add edi, ebx                 ; Add offset for the current ball

    ; Assign X-coordinate (starting position)
   mov [edi + Ball1.x_cor], 17   ; Start at the beginning of the track

    ; Assign Y-coordinate (track row)
    mov [edi + Ball1.y_cor], 28  ; Assume row 10 for now

    ; Assign random color
    call random                ; Generate random number
    and al, 7                  ; Limit to color range (0-7)
    mov [edi + Ball1.color], al  ; Set color

    ; Update ball count
    inc ballCount

endAddBall:
    ret
addBall ENDP
random proc
mov al, 5  
ret
random ENDP
movetheball PROC
  movzx ecx, ballCount


ret
movetheball ENDP

drawingball Proc
movzx ecx,ballCount
L2:
mov esi,0
mov eax,red
call setTextColor
mov dh,byte ptr [esi+Ball1.y_cor]
;mov dh,initialbally

mov dl,byte ptr[esi+Ball1.x_cor]

 call GoToXY
mov edx,offset ball
call WriteString
    add esi, TYPE Ball1
    loop L2




ret
drawingball ENDP
comment @
InsertBall PROC
    ; Inputs:
    ;   fire_col, fire_row -> Position of the fireball
    ;   fire_color -> Color of the fireball
    ; Updates:
    ;   Inserts the fireball into ball arrays at the correct position.

    ; Find the correct insertion point
    xor esi, esi                     ; Start with the first ball
find_insertion_point:
    cmp si, ballCount              ; Check if we've iterated through all balls
    jge insert_at_end              ; If no position matches, insert at the end

    mov al, [ball_ka_x + si]       ; Load ball's X position
    cmp al, fire_col
    jne next_ball

    mov al, [ball_ka_y + si]       ; Load ball's Y position
    cmp al, fire_row
    jl insert_here                 ; Insert if fireball is before current ball

next_ball:
    inc si
    jmp find_insertion_point

insert_here:
    ; Shift all balls after `si` to make room for the new ball
    mov cx, ballCount              ; Load current ball count
    dec cx
shift_balls:
    cmp cx, si
    jl do_insertion                ; Stop shifting when all balls are moved

    mov al, [ball_ka_x + cx]       ; Shift X position
    mov [ball_ka_x + cx + 1], al

    mov al, [ball_ka_y + cx]       ; Shift Y position
    mov [ball_ka_y + cx + 1], al

    mov al, [ball_color + cx]      ; Shift color
    mov [ball_color + cx + 1], al

    dec cx
    jmp shift_balls

do_insertion:
    ; Insert fireball at `si`
    mov al, fire_col               ; Insert X position
    mov [ball_ka_x + si], al

    mov al, fire_row               ; Insert Y position
    mov [ball_ka_y + si], al

    mov al, fire_color             ; Insert color
    mov [ball_color + si], al

    inc ballCount                  ; Increment the total ball count
    ret

insert_at_end:
    ; Insert the fireball at the end of the list
    mov al, fire_col               ; Insert X position
    mov [ball_ka_x + ballCount], al

    mov al, fire_row               ; Insert Y position
    mov [ball_ka_y + ballCount], al

    mov al, fire_color             ; Insert color
    mov [ball_color + ballCount], al

    inc ballCount                  ; Increment the total ball count
    ret
InsertBall ENDP
@
;colors wala func
colorwalafunc PROC
 ;mov fire_color,32
    mov esi,0
    movzx ecx,bcount

      mov al, direction
      cmp al,"w"
      je colorloop_updown
      mov al, direction
      cmp al,"x"
      je colorloop_ddown
         mov al, direction
      cmp al,"a"
      je colorloop

        mov al, direction
      cmp al,"d"
      je colorloop

      mov al, direction
      cmp al,"q"
      je extra
       mov al, direction
       cmp al,"e"
       je extra
              mov al, direction
       cmp al,"z"
       je colorloop_downleft

              mov al, direction
       cmp al,"c"
       je colorloop_downright
       
       colorloop_updown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_ballup           ; If X doesn't match, skip this ball

    mov al, ball_ka_y[esi] 
    add al,1
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_ballup           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_color[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_ballup:
    inc esi                 ; Move to the next ball
    loop colorloop_updown    ; Repeat for all balls
    jmp akhir 

    colorloop_ddown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_balld           ; If X doesn't match, skip this ball

    mov al, ball_ka_y[esi] 
    sub al,2
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_balld           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_color[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_balld:
    inc esi                 ; Move to the next ball
    loop colorloop_ddown    ; Repeat for all balls
    jmp akhir 



    colorloop:
    mov al,ball_ka_x[esi]
    cmp al,dl
    jne temp
   

    mov bl,fire_color
    mov ball_color[esi],bl
    temp:
    mov al,ball_ka_y[esi]
    cmp al,dh
     jne temp2
      mov bl,fire_color
    mov ball_color[esi],bl
    mov matchedindex,esi
   jmp akhir
    temp2:

    ;checling both x and y 


    inc esi
    LOOP colorloop
    jmp akhir
    ;;;extra loop
    extra:
 

colorloop1:
    ; Load the current ball's X position and check range for diagonal collisions
    mov al, ball_ka_x[esi]
    mov ah, dl         ; Store fireball's X position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball X - 1)
    cmp al, ah
    jl next_ball       ; If ball X < lower bound, skip to next ball

    mov ah, dl         ; Reset AH to fireball's X position
    add ah, 1          ; Calculate upper bound (fireball X + 1)
    cmp al, ah
    jg next_ball       ; If ball X > upper bound, skip to next ball

    ; Load the current ball's Y position and check range for diagonal collisions
    mov al, ball_ka_y[esi]
    mov ah, dh         ; Store fireball's Y position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball Y - 1)
    cmp al, ah
    jl next_ball       ; If ball Y < lower bound, skip to next ball

    mov ah, dh         ; Reset AH to fireball's Y position
    add ah, 1          ; Calculate upper bound (fireball Y + 1)
    cmp al, ah
    jg next_ball       ; If ball Y > upper bound, skip to next ball

    ; If X and Y are within range, update color
    mov bl, fire_color
    mov ball_color[esi], bl
    mov matchedindex,esi
    jmp akhir

next_ball:
    inc esi
    LOOP colorloop1
    jmp akhir
  
  colorloop_downright:
    ; Check if fireball is within range of any ball (diagonal down-right)
    mov al, ball_ka_x[esi]
    mov ah, dl                     ; Fireball X position
    add ah, 1                      ; Fireball X + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    mov al, ball_ka_y[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_color[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downright:
    inc esi
    LOOP colorloop_downright
    jmp akhir 

    colorloop_downleft:
    ; Check if fireball is within range of any ball (diagonal down-left)
    mov al, ball_ka_x[esi]
    mov ah, dl                     ; Fireball X position
    sub ah, 1                      ; Fireball X - 1 for down-left
    cmp al, ah
    jne next_ball_downleft

    mov al, ball_ka_y[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 2 for down-left
    cmp al, ah
    jne next_ball_downleft

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_color[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downleft:
    inc esi
    LOOP colorloop_downleft





    ;lets try drawig ball here 
     ;call GoToXY
    ;mov edx,offset ball
;call WriteString
akhir:
        mov dx, 0
        call GoToXY

call collisionfunc


call drawb_l1

    ; Step 2: Add a delay to observe spaces
    mov eax,1000
    call Delay

    ; Step 3: Shift balls to compact active ones
    call shift_balls

    ; Step 4: Redraw again after shifting
    call drawb_l1


ret
colorwalafunc ENDP

colorwalafunc_level2 PROC
 ;mov fire_color,32
    mov esi,0
    movzx ecx,bcount2

      mov al, direction
      cmp al,"w"
      je colorloop_updown
      mov al, direction
      cmp al,"x"
      je colorloop_ddown
         mov al, direction
      cmp al,"a"
      je colorloop

        mov al, direction
      cmp al,"d"
      je colorloop

      mov al, direction
      cmp al,"q"
      je extra
       mov al, direction
       cmp al,"e"
       je extra
              mov al, direction
       cmp al,"z"
       je colorloop_downleft

              mov al, direction
       cmp al,"c"
       je colorloop_downright
       
       colorloop_updown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x_l2[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_ballup           ; If X doesn't match, skip this ball

    mov al, ball_ka_y_l2[esi] 
    add al,3
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_ballup           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_colorl2[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_ballup:
    inc esi                 ; Move to the next ball
    loop colorloop_updown    ; Repeat for all balls
    jmp akhir 

    colorloop_ddown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x_l2[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_balld           ; If X doesn't match, skip this ball

    mov al, ball_ka_y_l2[esi] 
    sub al,2
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_balld           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_colorl2[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_balld:
    inc esi                 ; Move to the next ball
    loop colorloop_ddown    ; Repeat for all balls
    jmp akhir 



    colorloop:
    mov al,ball_ka_x_l2[esi]
    cmp al,dl
    jne temp
   

    mov bl,fire_color
    mov ball_colorl2[esi],bl
    temp:
    mov al,ball_ka_y_l2[esi]
    cmp al,dh
     jne temp2
      mov bl,fire_color
    mov ball_colorl2[esi],bl
    mov matchedindex,esi
   jmp akhir
    temp2:

    ;checling both x and y 


    inc esi
    LOOP colorloop
    jmp akhir
    ;;;extra loop
    extra:
 

colorloop1:
    ; Load the current ball's X position and check range for diagonal collisions
    mov al, ball_ka_x_l2[esi]
    mov ah, dl         ; Store fireball's X position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball X - 1)
    cmp al, ah
    jl next_ball       ; If ball X < lower bound, skip to next ball

    mov ah, dl         ; Reset AH to fireball's X position
    add ah, 1          ; Calculate upper bound (fireball X + 1)
    cmp al, ah
    jg next_ball       ; If ball X > upper bound, skip to next ball

    ; Load the current ball's Y position and check range for diagonal collisions
    mov al, ball_ka_y_l2[esi]
    mov ah, dh         ; Store fireball's Y position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball Y - 1)
    cmp al, ah
    jl next_ball       ; If ball Y < lower bound, skip to next ball

    mov ah, dh         ; Reset AH to fireball's Y position
    add ah, 1          ; Calculate upper bound (fireball Y + 1)
    cmp al, ah
    jg next_ball       ; If ball Y > upper bound, skip to next ball

    ; If X and Y are within range, update color
    mov bl, fire_color
    mov ball_colorl2[esi], bl
    mov matchedindex,esi
    jmp akhir

next_ball:
    inc esi
    LOOP colorloop1
    jmp akhir
  
  colorloop_downright:
    ; Check if fireball is within range of any ball (diagonal down-right)
    mov al, ball_ka_x_l2[esi]
    mov ah, dl                     ; Fireball X position
    add ah, 1                      ; Fireball X + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    mov al, ball_ka_y_l2[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_colorl2[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downright:
    inc esi
    LOOP colorloop_downright
    jmp akhir 

    colorloop_downleft:
    ; Check if fireball is within range of any ball (diagonal down-left)
    mov al, ball_ka_x_l2[esi]
    mov ah, dl                     ; Fireball X position
    sub ah, 1                      ; Fireball X - 1 for down-left
    cmp al, ah
    jne next_ball_downleft

    mov al, ball_ka_y_l2[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 2 for down-left
    cmp al, ah
    jne next_ball_downleft

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_colorl2[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downleft:
    inc esi
    LOOP colorloop_downleft





    ;lets try drawig ball here 
     ;call GoToXY
    ;mov edx,offset ball
;call WriteString
akhir:
        mov dx, 0
        call GoToXY

call collisionfunc_level2

call drawb_l2

    ; Step 2: Add a delay to observe spaces
    mov eax,1000
    call Delay

    ; Step 3: Shift balls to compact active ones
    call shift_balls_level2

    ; Step 4: Redraw again after shifting
    call drawb_l2


ret
colorwalafunc_level2 ENDP

colorwalafunc_level3 PROC
 ;mov fire_color,32
    mov esi,0
    movzx ecx,bcount3

      mov al, direction
      cmp al,"w"
      je colorloop_updown
      mov al, direction
      cmp al,"x"
      je colorloop_ddown
         mov al, direction
      cmp al,"a"
      je colorloop

        mov al, direction
      cmp al,"d"
      je colorloop

      mov al, direction
      cmp al,"q"
      je extra
       mov al, direction
       cmp al,"e"
       je colorloopd
              mov al, direction
       cmp al,"z"
       je colorloop_downleft

              mov al, direction
       cmp al,"c"
       je colorloop_downright
       
       colorloop_updown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x_l3[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_ballup           ; If X doesn't match, skip this ball

    mov al, ball_ka_y_l3[esi] 
    add al,3
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_ballup           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_colorl3[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_ballup:
    inc esi                 ; Move to the next ball
    loop colorloop_updown    ; Repeat for all balls
    jmp akhir 

    colorloop_ddown:
    ; Check both X and Y coordinates simultaneously
    mov al, ball_ka_x_l3[esi]  ; Load ball X coordinate
    cmp al, dl              ; Compare with fireball X coordinate
    jne next_balld           ; If X doesn't match, skip this ball

    mov al, ball_ka_y_l3[esi] 
    sub al,2
    ; Load ball Y coordinate
    cmp al, dh              ; Compare with fireball Y coordinate
    jne next_balld           ; If Y doesn't match, skip this ball

    ; If both X and Y match, update the ball's color
    mov bl, fire_color      ; Load fireball color
    mov ball_colorl3[esi], bl ; Set the ball's color
    mov matchedindex, esi   ; Store the index of the matched ball
    jmp akhir               ; Exit loop

next_balld:
    inc esi                 ; Move to the next ball
    loop colorloop_ddown    ; Repeat for all balls
    jmp akhir 



    colorloop:
    mov al,ball_ka_x_l3[esi]
    cmp al,dl
    jne temp
   

    mov bl,fire_color
    mov ball_colorl3[esi],bl
    temp:
    mov al,ball_ka_y_l3[esi]
    cmp al,dh
     jne temp2
      mov bl,fire_color
    mov ball_colorl3[esi],bl
    mov matchedindex,esi
   jmp akhir
    temp2:

    ;checling both x and y 


    inc esi
    LOOP colorloop
    jmp akhir
    ;;;extra loop
    extra:
 

colorloop1:
    ; Load the current ball's X position and check range for diagonal collisions
    mov al, ball_ka_x_l3[esi]
    mov ah, dl         ; Store fireball's X position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball X - 1)
    cmp al, ah
    jl next_ball       ; If ball X < lower bound, skip to next ball

    mov ah, dl         ; Reset AH to fireball's X position
    add ah, 1          ; Calculate upper bound (fireball X + 1)
    cmp al, ah
    jg next_ball       ; If ball X > upper bound, skip to next ball

    ; Load the current ball's Y position and check range for diagonal collisions
    mov al, ball_ka_y_l3[esi]
    mov ah, dh         ; Store fireball's Y position in AH for range comparison

    sub ah, 1          ; Calculate lower bound (fireball Y - 1)
    cmp al, ah
    jl next_ball       ; If ball Y < lower bound, skip to next ball

    mov ah, dh         ; Reset AH to fireball's Y position
    add ah, 1          ; Calculate upper bound (fireball Y + 1)
    cmp al, ah
    jg next_ball       ; If ball Y > upper bound, skip to next ball

    ; If X and Y are within range, update color
    mov bl, fire_color
    mov ball_colorl3[esi], bl
    mov matchedindex,esi
    jmp akhir

next_ball:
    inc esi
    LOOP colorloop1
    jmp akhir
  

  colorloopd:
    ; Load the current ball's X position and check range for diagonal collisions
    mov al, ball_ka_x_l3[esi]
    mov ah, dl         ; Store fireball's X position in AH for range comparison

    add ah, 1          ; Calculate lower bound (fireball X - 1)
    cmp al, ah
    jl next_balle       ; If ball X < lower bound, skip to next ball

    mov ah, dl         ; Reset AH to fireball's X position
    add ah, 1          ; Calculate upper bound (fireball X + 1)
    cmp al, ah
    jg next_balle       ; If ball X > upper bound, skip to next ball

    ; Load the current ball's Y position and check range for diagonal collisions
    mov al, ball_ka_y_l3[esi]
    mov ah, dh         ; Store fireball's Y position in AH for range comparison

    sub ah, 2          ; Calculate lower bound (fireball Y - 1)
    cmp al, ah
    jl next_balle       ; If ball Y < lower bound, skip to next ball

    mov ah, dh         ; Reset AH to fireball's Y position
    add ah, 1          ; Calculate upper bound (fireball Y + 1)
    cmp al, ah
    jg next_balle       ; If ball Y > upper bound, skip to next ball

    ; If X and Y are within range, update color
    mov bl, fire_color
    mov ball_colorl3[esi], bl
    mov matchedindex,esi
    jmp akhir

next_balle:
    inc esi
    LOOP colorloopd
    jmp akhir
  
  colorloop_downright:
    ; Check if fireball is within range of any ball (diagonal down-right)
    mov al, ball_ka_x_l3[esi]
    mov ah, dl                     ; Fireball X position
    add ah, 1                      ; Fireball X + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    mov al, ball_ka_y_l3[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 1 for down-right
    cmp al, ah
    jne next_ball_downright

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_colorl3[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downright:
    inc esi
    LOOP colorloop_downright
    jmp akhir 

    colorloop_downleft:
    ; Check if fireball is within range of any ball (diagonal down-left)
    mov al, ball_ka_x_l3[esi]
    mov ah, dl                     ; Fireball X position
    sub ah, 1                      ; Fireball X - 1 for down-left
    cmp al, ah
    jne next_ball_downleft

    mov al, ball_ka_y_l3[esi]
    mov ah, dh                     ; Fireball Y position
    add ah, 2                      ; Fireball Y + 2 for down-left
    cmp al, ah
    jne next_ball_downleft

    ; If both X and Y match, update color
    mov bl, fire_color
    mov ball_colorl3[esi], bl
    mov matchedindex,esi
    jmp akhir                      ; Exit once color is updated

next_ball_downleft:
    inc esi
    LOOP colorloop_downleft





    ;lets try drawig ball here 
     ;call GoToXY
    ;mov edx,offset ball
;call WriteString
akhir:
        mov dx, 0
        call GoToXY

call collisionfunc_level3

call drawb_l3

    ; Step 2: Add a delay to observe spaces
    mov eax,1000
    call Delay

    ; Step 3: Shift balls to compact active ones
    call shift_balls_level3

    ; Step 4: Redraw again after shifting
    call drawb_l3


ret
colorwalafunc_level3 ENDP




;shifting func
shift_balls PROC
    mov esi, 0                  ; Original index
    mov edi, 0                  ; New index after shifting

shift_loop:
    mov eax,esi
    cmp al, bcount             ; Check if we’ve processed all balls
    jae end_shift               ; Exit if all balls are processed

    ; Check if the current ball is active
    mov al, activeballs[esi]
    cmp al, 1
    je copy_ball                ; If active, copy it to the new position

    ; If inactive, skip it
    inc esi
    jmp shift_loop

copy_ball:
    ; Copy X, Y, and color to the new position
    mov al, ball_ka_x[esi]
    mov ball_ka_x[edi], al
    mov al, ball_ka_y[esi]
    mov ball_ka_y[edi], al
    mov al, ball_color[esi]
    mov ball_color[edi], al

    ; Mark as active in the new position
    mov activeballs[edi], 1

    ; Increment both indices
    inc esi
    inc edi
    jmp shift_loop

end_shift:
    ; Update the ball count after shifting
    mov eax,0
   mov eax,edi

    mov bcount, al
    ret
shift_balls ENDP

shift_balls_level2 PROC
    mov esi, 0                  ; Original index
    mov edi, 0                  ; New index after shifting

shift_loop:
    mov eax,esi
    mov bl,bcount2
    cmp al, bl             ; Check if we’ve processed all balls
    jae end_shift               ; Exit if all balls are processed

    ; Check if the current ball is active
    mov al, activeballs2[esi]
    cmp al, 1
    je copy_ball                ; If active, copy it to the new position

    ; If inactive, skip it
    inc esi
    jmp shift_loop

copy_ball:
    ; Copy X, Y, and color to the new position
    mov al, ball_ka_x_l2[esi]
    mov ball_ka_x_l2[edi], al
    mov al, ball_ka_y_l2[esi]
    mov ball_ka_y_l2[edi], al
    mov al, ball_colorl2[esi]
    mov ball_colorl2[edi], al

    ; Mark as active in the new position
    mov activeballs2[edi], 1

    ; Increment both indices
    inc esi
    inc edi
    jmp shift_loop

end_shift:
    ; Update the ball count after shifting
    mov eax,0
   mov eax,edi

    mov bcount2, al
    ret
shift_balls_level2 ENDP

shift_balls_level3 PROC
    mov esi, 0                  ; Original index
    mov edi, 0                  ; New index after shifting

shift_loop:
    mov eax,esi
    mov bl,bcount3
    cmp al, bl             ; Check if we’ve processed all balls
    jae end_shift               ; Exit if all balls are processed

    ; Check if the current ball is active
    mov al, activeballs3[esi]
    cmp al, 1
    je copy_ball                ; If active, copy it to the new position

    ; If inactive, skip it
    inc esi
    jmp shift_loop

copy_ball:
    ; Copy X, Y, and color to the new position
    mov al, ball_ka_x_l3[esi]
    mov ball_ka_x_l3[edi], al
    mov al, ball_ka_y_l3[esi]
    mov ball_ka_y_l3[edi], al
    mov al, ball_colorl3[esi]
    mov ball_colorl3[edi], al

    ; Mark as active in the new position
    mov activeballs3[edi], 1

    ; Increment both indices
    inc esi
    inc edi
    jmp shift_loop

end_shift:
    ; Update the ball count after shifting
    mov eax,0
   mov eax,edi

    mov bcount3, al
    ret
shift_balls_level3 ENDP


collisionfunc PROC

check_match:
    movzx ecx, bcount             
    mov esi, matchedindex 
    mov bl, fire_color         
    mov matches, 1              

    ; Check left
check_left:
    dec esi                     
    jl end_check_left          
    mov al, ball_color[esi]    
    cmp al, bl
    jne end_check_left         
    inc matches                
    jmp check_left

end_check_left:
    mov esi, matchedindex 

    ; Check right
check_right:
    inc esi                    
    cmp esi, ecx
    jge end_check_right         
    mov al, ball_color[esi]    
    cmp al, bl
    jne end_check_right       
    inc matches                
    jmp check_right

end_check_right:
    ; Check if enough matches
    cmp matches, 3
    jl no_pop
      movzx eax, matches             ; Load the number of matches
    imul eax, 10                 ; Multiply by 10 (points per ball)
    add score, eax
    call updatescore
    jmp pop_balls

    pop_balls:
    ; Initialize index for popping
    mov esi, matchedindex

    ; Mark left balls as inactive
mark_left:
    dec esi
    jl end_mark_left            
    mov al, ball_color[esi]
    cmp al, bl
    jne end_mark_left            
    mov activeballs[esi], 0      ;
    jmp mark_left

end_mark_left:
    mov esi, matchedindex 

    ; Mark right balls as inactive
mark_right:
    inc esi
    cmp esi, ecx
    jge end_mark_right           
    mov al, ball_color[esi]
    cmp al, bl
    jne end_mark_right         
    mov activeballs[esi], 0     
    jmp mark_right

end_mark_right:
    ; Also mark the current ball as inactive
    mov esi, matchedindex
    mov activeballs[esi], 0     
    ;jmp shift_balls
   
no_pop:

ret
collisionfunc ENDP  

collisionfunc_level2 PROC

check_match:
    movzx ecx, bcount2             
    mov esi, matchedindex 
    mov bl, fire_color         
    mov matches, 1              

    ; Check left
check_left:
    dec esi                     
    jl end_check_left          
    mov al, ball_colorl2[esi]    
    cmp al, bl
    jne end_check_left         
    inc matches                
    jmp check_left

end_check_left:
    mov esi, matchedindex 

    ; Check right
check_right:
    inc esi                    
    cmp esi, ecx
    jge end_check_right         
    mov al, ball_colorl2[esi]    
    cmp al, bl
    jne end_check_right       
    inc matches                
    jmp check_right

end_check_right:
    ; Check if enough matches
    cmp matches, 3
    jl no_pop
      movzx eax, matches             ; Load the number of matches
    imul eax, 10                 ; Multiply by 10 (points per ball)
    add score, eax
    call updatescore
    jmp pop_balls

    pop_balls:
    ; Initialize index for popping
    mov esi, matchedindex

    ; Mark left balls as inactive
mark_left:
    dec esi
    jl end_mark_left            
    mov al, ball_colorl2[esi]
    cmp al, bl
    jne end_mark_left            
    mov activeballs2[esi], 0      ;
    jmp mark_left

end_mark_left:
    mov esi, matchedindex 

    ; Mark right balls as inactive
mark_right:
    inc esi
    cmp esi, ecx
    jge end_mark_right           
    mov al, ball_colorl2[esi]
    cmp al, bl
    jne end_mark_right         
    mov activeballs2[esi], 0     
    jmp mark_right

end_mark_right:
    ; Also mark the current ball as inactive
    mov esi, matchedindex
    mov activeballs2[esi], 0     
    ;jmp shift_balls
   
no_pop:

ret
collisionfunc_level2 ENDP  


collisionfunc_level3 PROC

check_match:
    movzx ecx, bcount3             
    mov esi, matchedindex 
    mov bl, fire_color         
    mov matches, 1              

    ; Check left
check_left:
    dec esi                     
    jl end_check_left          
    mov al, ball_colorl3[esi]    
    cmp al, bl
    jne end_check_left         
    inc matches                
    jmp check_left

end_check_left:
    mov esi, matchedindex 

    ; Check right
check_right:
    inc esi                    
    cmp esi, ecx
    jge end_check_right         
    mov al, ball_colorl3[esi]    
    cmp al, bl
    jne end_check_right       
    inc matches                
    jmp check_right

end_check_right:
    ; Check if enough matches
    cmp matches, 3
    jl no_pop
      movzx eax, matches             ; Load the number of matches
    imul eax, 10                 ; Multiply by 10 (points per ball)
    add score, eax
    call updatescore
    jmp pop_balls

    pop_balls:
    ; Initialize index for popping
    mov esi, matchedindex

    ; Mark left balls as inactive
mark_left:
    dec esi
    jl end_mark_left            
    mov al, ball_colorl3[esi]
    cmp al, bl
    jne end_mark_left            
    mov activeballs3[esi], 0      ;
    jmp mark_left

end_mark_left:
    mov esi, matchedindex 

    ; Mark right balls as inactive
mark_right:
    inc esi
    cmp esi, ecx
    jge end_mark_right           
    mov al, ball_colorl3[esi]
    cmp al, bl
    jne end_mark_right         
    mov activeballs3[esi], 0     
    jmp mark_right

end_mark_right:
    ; Also mark the current ball as inactive
    mov esi, matchedindex
    mov activeballs3[esi], 0     
    ;jmp shift_balls
   
no_pop:

ret
collisionfunc_level3 ENDP 

FireBall PROC
    ; Fire a projectile from the player's current face direction


    
mov eax, 2                    ; Upper bound for random range (2 colors)
    call RandomRange              ; Generate random number (0 or 1)

    and al, 1                    ; Keep only the least significant bit (0 or 1)
    cmp al, 0
    je set_red
    mov fire_color, 14           ; Yellow color (standard color code)
    jmp set_direction

set_red:
    mov fire_color, 4  

   
   set_direction:
   mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 20            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 50
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:

    ;ball is going up i assume


   call colorwalafunc

    ret
FireBall ENDP


FireBall_level2 PROC
    ; Fire a projectile from the player's current face direction


    
mov eax, 3                    ; Upper bound for random range (2 colors)
    call RandomRange              ; Generate random number (0 or 1)

                       ; Keep only the least significant bit (0 or 1)
    cmp eax, 0
    je set_purple
    cmp eax,1
    je setcyan
    cmp eax,2
    je setblue
   

set_purple:
    mov fire_color, 13 
    jmp set_direction

    setcyan:
    mov fire_color, 11
    jmp set_direction

    setblue:
    mov fire_color,9



   
   set_direction:
   mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 25            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 7             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 50
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:

    ;ball is going up i assume


   call colorwalafunc_level2

    ret
FireBall_level2 ENDP


FireBall_level3 PROC
    ; Fire a projectile from the player's current face direction


    



    mov eax,5
call RandomRange

cmp eax,0
je setpur
cmp eax,1
je setaq
cmp eax,2
je setgrey
cmp eax,3
je setgreen

cmp eax,4
je setbw

setpur:
mov fire_color,13  ;lightpurple
 jmp set_direction

setaq:

mov fire_color,3  ;aqua
 jmp set_direction

setgrey:
mov fire_color,8  ;grey
 jmp set_direction
setgreen:
mov fire_color ,2  ;green
 jmp set_direction
setbw:
mov fire_color,10  ;birghtwhite
 jmp set_direction




   
   set_direction:
   mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall

        ;to left diagonal check
        cmp dl,52
        jg neeche
        cmp dh,10
        jz end_fire
        neeche:
        cmp dl, 46            ; Left wall boundary
        jle end_fire

        cmp dl, 68            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ;top right diagonal check
        cmp dl,60
        jge secondcheck
        jmp bahir
        secondcheck:
        cmp dh,11
        jz end_fire
        bahir:
      
        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 50
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:

    ;ball is going up i assume


   call colorwalafunc_level3

    ret
FireBall_level3 ENDP

DrawWall PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov eax, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall ENDP

DrawWall2 PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov eax, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls21

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall2 ENDP


DrawWall3 PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov eax, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls3

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall3 ENDP



PrintPlayer PROC
    mov eax, brown + (black * 16)
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    
ret
PrintPlayer ENDP
update_emitter PROC
    ; Update the emitter symbols to animate the line
    push ax
    push cx
    push dx

    mov cx, 80           ; Number of columns (console width)
    mov dl, emitter_col
    mov dh, emitter_row

    ; Redraw emitter with updated colors
emitter_update_loop:
    ; Alternate emitter colors between green and red
    cmp al, emitter_color1
    jne set_green_color
    mov al, emitter_color2
    jmp draw_symbol

set_green_color:
    mov al, emitter_color1

draw_symbol:
    mov al, emitter_symbol
    call Gotoxy
    call WriteChar

    inc dl               ; Move to the next column
    cmp dl, 80           ; Wrap around at the end of the row
    jne emitter_update_loop
    mov dl, emitter_col  ; Reset column

    pop dx
    pop cx
    pop ax
    ret
update_emitter ENDP

; i have not called this function
draw_emitter PROC
    ; Draw the emitter with alternating colors
    push ax
    push cx
    push dx

    mov cx, 119          ; Number of columns (console width)
    mov dl, emitter_col
    mov dh, emitter_row

emitter_loop:
    ; Alternate emitter colors between green and red
    mov al, emitter_color1
    call SetTextColor

    mov al, emitter_symbol
    call Gotoxy
    call WriteChar

    ; Toggle color for the next symbol
    cmp al, emitter_color1
    jne set_green
    mov al, emitter_color2
    jmp next_symbol

set_green:
    mov al, emitter_color1

next_symbol:

    inc dl               ; Move to the next column
    cmp dl, 119          ; Wrap around at the end of the row
    jne emitter_loop
    mov dl, emitter_col  ; Reset column

    pop dx
    pop cx
    pop ax
    ret
draw_emitter ENDP

updatescore PROC

 mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov eax, score
	call WriteDec

ret
updatescore ENDP

level1 PROC
mov ecx,130
loop1:
push ecx
call MovePlayer

call addball_l1
 call drawb_l1
 mov eax,1000
 call Delay
 call movball_l1
      ;sub initialbally,1
      pop ecx
      mov eax,0
      mov eax,score
      cmp eax,100
      jge gamekhatam


 LOOP loop1

dec lives
mov al,lives
cmp lives,0
je gamekhatam
;we will reset everything
mov ecx,130
mov esi,0
resetloop:
mov ball_ka_x[esi],0
mov ball_ka_y[esi],0
mov ball_color[esi],0
mov activeballs[esi],0

inc esi
LOOP resetloop
mov bcount,0
call Clrscr
 call InitialiseScreen
call level1




gamekhatam:
ret
level1 ENDP

comment @
MovePlayer PROC
      
    
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay
        ;call update_emitter
       
    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; if character is invalid, check for a new keypress
    jmp checkInput

    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    paused:


        ; call your pause menu here... once you make it. for now, this will exit the game.
        ret
        
    shoot:
        call FireBall

    chosen:
        call PrintPlayer
        call MovePlayer

    ret
MovePlayer ENDP
@ 
;new wala 
MovePlayer PROC
    ; Setup for player movement
    mov dx, 0
    call GoToXY

checkInputLoop:
    ; Introduce a slight delay
    mov eax, 5
    call Delay
    ; call update_emitter (optional for visual updates)

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; If no valid input, return control to the main game loop
    ret

move:
    mov al, inputChar
    mov direction, al
    jmp returnToMain

paused:
    ; Pause menu logic (not implemented)
    PauseMenu:
            call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
             call ReadChar
            
             cmp al,'r'
             je resumegame
             cmp al,'t'
             jz endthegame
               jmp returnToMain

             resumegame:
             call Clrscr
             call InitialiseScreen
             call level1
             ret
             endthegame:
             mov gamerunning,0
               jmp returnToMain
             
           
    ret

shoot:
    call FireBall
    jmp returnToMain

returnToMain:
    call PrintPlayer
    ; Instead of calling `MovePlayer` again, return control
    ret

MovePlayer ENDP


MovePlayer_level2 PROC
    ; Setup for player movement
    mov dx, 0
    call GoToXY

checkInputLoop:
    ; Introduce a slight delay
    mov eax, 5
    call Delay
    ; call update_emitter (optional for visual updates)

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; If no valid input, return control to the main game loop
    ret

move:
    mov al, inputChar
    mov direction, al
    jmp returnToMain

paused:
    ; Pause menu logic (not implemented)

     call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
             call ReadChar
            
             cmp al,'r'
             je resumegame
             cmp al,'t'
             jz endthegame
               jmp returnToMain

             resumegame:
            
             call level2
             ret
             endthegame:
             mov gamerunning,0
               jmp returnToMain
    ret

shoot:
    call FireBall_level2
    jmp returnToMain

returnToMain:
    call PrintPlayer
    ; Instead of calling `MovePlayer` again, return control
    ret

MovePlayer_level2 ENDP

MovePlayer_level3 PROC
    ; Setup for player movement
    mov dx, 0
    call GoToXY

checkInputLoop:
    ; Introduce a slight delay
    mov eax, 5
    call Delay
    ; call update_emitter (optional for visual updates)

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; If no valid input, return control to the main game loop
    ret

move:
    mov al, inputChar
    mov direction, al
    jmp returnToMain

paused:
    ; Pause menu logic (not implemented)
     call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
             call ReadChar
            
             cmp al,'r'
             je resumegame
             cmp al,'t'
             jz endthegame
               jmp returnToMain

             resumegame:
            
             call level3
             ret
             endthegame:
             mov gamerunning,0
               jmp returnToMain
    ret

shoot:
    call FireBall_level3
    jmp returnToMain

returnToMain:
    call PrintPlayer
    ; Instead of calling `MovePlayer` again, return control
    ret

MovePlayer_level3 ENDP



InitialiseScreen PROC
    ; Draw the level layout at the start
    call DrawWall
        
   ; call draw_emitter

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen ENDP

InitialiseScreen2 PROC
call DrawWall2
call PrintPlayer

ret
InitialiseScreen2 ENDP

InitializeScreen3 PROC
call DrawWall3
call PrintPlayer

ret
InitializeScreen3 ENDP

level2 PROC
  call InitialiseScreen2
  mov ecx,200
  loop2:
  push ecx
  call MovePlayer_level2
  call addball_l2
  call drawb_l2
  mov eax,500
  call Delay
  call movball_l2
  pop ecx
  mov eax,score
  cmp eax,150

  jae gamekhatam
  LOOP loop2


  dec lives
mov al,lives
cmp lives,0
je gamekhatam
;we will reset everything
mov ecx,200
mov esi,0
resetloop:
mov ball_ka_x_l2[esi],0
mov ball_ka_y_l2[esi],0
mov ball_colorl2[esi],0
mov activeballs2[esi],0

inc esi
LOOP resetloop
mov bcount2,0
call Clrscr
; call InitialiseScreen
call level2

gamekhatam:
ret
level2 ENDP

level3 PROC
call InitializeScreen3

mov ecx,100
loop3:

push ecx
call MovePlayer_level3
call addball_l3
call drawb_l3
mov eax,1000
call Delay
call movball_l3


pop ecx
mov eax,score
  cmp eax,50

  jae gamekhatam
LOOP loop3

dec lives
mov al,lives
cmp lives,0
je gamekhatam
;we will reset everything
mov ecx,100
mov esi,0
resetloop:
mov ball_ka_x_l3[esi],0
mov ball_ka_y_l3[esi],0
mov ball_colorl3[esi],0
mov activeballs3[esi],0
inc esi
LOOP resetloop
mov bcount3,0
call Clrscr
; call InitialiseScreen
call level3
gamekhatam:
ret
level3 ENDP

AppendString PROC
    ; Append a null-terminated string from ESI to the buffer
    mov edi, OFFSET buffer2        ; Load the buffer address (EDI points to the buffer)
   add edi,ebx                    ; Initialize counter to 0
AppendLoop:
    lodsb                           ; Load byte from ESI into AL (source string)
    or al, al                       ; Check if the byte is null (end of string)
    jz AppendStringEnd              ; If null, jump to end of procedure
    add edi, ebx                    ; Move to the current position in the buffer
    stosb                           ; Store byte in buffer
    inc ebx                         ; Increment the counter (position in buffer)
    jmp AppendLoop                  ; Repeat for next byte
AppendStringEnd:
    ret
AppendString ENDP

AppendNewline PROC
    ; Append a newline (CR + LF) to the buffer
    mov edi, OFFSET buffer2        ; Load the buffer address (EDI points to the buffer)
   add edi,ebx                    ; Initialize counter to 0
AppendNewlineLoop:
    add edi, ebx                    ; Move to the current position in the buffer
    mov al, 13                      ; Carriage return (ASCII 13)
    stosb                           ; Store CR in buffer
    inc ebx                         ; Increment the counter (position in buffer)
    mov al, 10                      ; Line feed (ASCII 10)
    stosb                           ; Store LF in buffer
    inc ebx                         ; Increment the counter (position in buffer)
    ret
AppendNewline ENDP

; Function: ConvertIntegerToString
; Converts a 32-bit integer (in eax) to a null-terminated string and stores it in the provided buffer.
; Arguments:
;   - eax: The integer to be converted to a string.
;   - ecx: The address of the buffer where the string will be stored.
; Returns:
;   - The length of the string (excluding the null terminator) in eax.
ConvertIntegerToString PROC
    ; Input: eax = integer value to convert
    ; Output: edi = pointer to the string (null-terminated)
    ; The caller must ensure edi points to a valid buffer before calling.

    mov ecx, 10              ; Set the divisor for division (base 10)
    add edi, 3              ; Move edi to the end of the buffer (reserve space for null terminator)
    mov byte ptr [edi], 0    ; Null-terminate the string
    dec edi                  ; Move one byte back for the first digit
    
convert_loop:
    xor edx, edx             ; Clear edx for division
    div ecx                  ; Divide eax by 10, quotient in eax, remainder in edx
    add dl, '0'              ; Convert the remainder to ASCII character
    mov [edi], dl            ; Store the character in the buffer
    dec edi                  ; Move the buffer pointer back for the next character
    test eax, eax            ; Check if the quotient is zero
    jnz convert_loop         ; If not zero, continue dividing

    inc edi                  ; Move edi to the first character
    ret                      ; Return with edi pointing to the string
ConvertIntegerToString ENDP

main PROC
    ; Initialize screen and emitter


     mov dl,10 
    mov dh,10
    mov eax,red
    call settextcolor
    call gotoxy
    mov edx,offset zuma_art
    call writestring
     call waitmsg
    call clrscr
    ;taking name as input
    mov dh,0
    mov dl,0
    call gotoxy
    mov edx,offset msg1
    mov ecx,lengthof msg1
    call writestring
    mov edx,offset name1
    mov ecx,20
    call readstring
    call clrscr
    ;the 3 menus

     lab_1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov edx,offset mypointer
        call writestring
        mov menuchoice,1
    jmp start_tab

    lab_2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov edx,offset mypointer
        call writestring
        mov menuchoice,2
    jmp start_tab

    lab_3:
        mov dl,70
        mov dh,22
        call gotoxy
        mov edx,offset mypointer
        call writestring
        mov menuchoice,3
        jmp veryend
    jmp start_tab


    start_tab:
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset gamestart
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset game_ins
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset gamexit
    call writestring
    
    
    call readchar
    call clrscr
    cmp al,'1'
    je lab_1
    cmp al,'2'
    je lab_2
    cmp al,'3'
    je lab_3
    cmp al,13
   
     je selectedchoice

    selectedchoice:
    cmp menuchoice,2
    je instructionsc
    cmp menuchoice,1
    je gameloop

    instructionsc:
    mov dl,0 
    mov dh,0
    call gotoxy
    mov edx,offset Instructionstr
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je lab_2
    jmp instructionsc

     gameloop:
  INVOKE PlaySound, OFFSET sound2, NULL, SND_FILENAME OR SND_ASYNC
    call InitialiseScreen
    call level1
   
    cmp score,100
    jl over
    call Clrscr
    mov score,0
    mov matchedindex,0
    add levelInfo,1
     invoke PlaySound, NULL, NULL, 0
 INVOKE PlaySound, OFFSET soundFile, NULL, SND_FILENAME OR SND_ASYNC
    call level2
   
    cmp score,150
    jl over
     call Clrscr
    mov score,0
    mov matchedindex,0
     add levelInfo,1
       invoke PlaySound, NULL, NULL, 0
INVOKE PlaySound, OFFSET sound3, NULL, SND_FILENAME OR SND_ASYNC
    call level3
 
    ; Call Player Cannon movement function(this function is recursive, and will repeat until the game is either won or lost)
   ; call MovePlayer
  
  


 over:

 ;first lets get the score and leels info 

 mov eax, score              ; Load the score into eax
mov edi, OFFSET buffer_score ; Provide the buffer address
call ConvertIntegerToString  ; Call the conversion function

; Now buffer_score contains the string representation of the score
; You can write this string to the file as needed

; Convert the levelInfo (in ebx) to a string
movzx eax, levelInfo          ; Load the levelInfo into ebx
mov edi, OFFSET buffer_level ; Provide the buffer address
call ConvertIntegerToString  ; 

;filehandling
    mov edx, OFFSET filename
    call OpenInputFile
    mov filehandle, eax
    ;cmp eax, INVALID_HANDLE_VALUE
       mov eax, filehandle
    mov edx, OFFSET buffer
    mov ecx, BUFSIZE
    call ReadFromFile

     mov bytesRead, eax
    mov eax, bytesRead
    cmp eax, 0
   


   
  

    mov ebx,0
    mov edi,0
   

    ;we will write inbuffer2
    mov ecx,lengthof nameLabel
    mov esi,0
    loop1:
    mov al,nameLabel[esi]
    mov buffer2[esi],al
    inc esi
    LOOP loop1
    
    mov ecx,lengthof name1
    mov ebx,0
    loop2:
    mov al,name1[ebx]
    mov buffer2[esi],al
    inc esi
    inc ebx
    LOOP loop2

   mov buffer2[esi],13
   inc esi
   mov buffer2[esi],10
   inc esi
   
  mov ecx,lengthof scoreLabel
  mov ebx,0
  loop3:
  mov al,scoreLabel[ebx]
    mov buffer2[esi],al
    inc esi
    inc ebx
    LOOP loop3

    
    mov ecx,lengthof buffer_score
    mov ebx,0
    loop4:
    mov al,buffer_score[ebx]
    mov buffer2[esi],al
    inc esi
    inc ebx
    LOOP loop4

  
   
      mov buffer2[esi],13
   inc esi
   mov buffer2[esi],10
   inc esi

   
mov ecx,lengthof levelLabel
mov ebx,0
  loop5:
  mov al,levelLabel[ebx]
    mov buffer2[esi],al
    inc esi
    inc ebx
    LOOP loop5
 
   mov ecx,lengthof buffer_level
   mov ebx,0
   loop6:
   mov al,buffer_level[ebx]
    mov buffer2[esi],al
    inc esi
    inc ebx
    LOOP loop6

    mov buffer2[esi],13
   inc esi
   mov buffer2[esi],10
   inc esi
   
   append:
  ;now appnding
  ;firstfindtotal bytes
  add edi,esi
  add edi,bytesRead
  mov ecx,esi
  mov ebx,0
 ;add esi,bytesRead
 mov esi,bytesRead
  finaloop:
  mov al,buffer2[ebx]
  mov buffer[esi],al
  inc esi
  inc ebx
  loop finaloop
   mov eax,fileHandle
mov edx, OFFSET filename2
   call CreateOutputFile                
    mov filehandle, eax        
        
    
    mov edx, OFFSET buffer                
    mov ecx, edi
    call WriteToFile     
      


  
    call CloseFile 
   veryend: 
  ;INVOKE PlaySound, OFFSET gameOvertrack, NULL, 1
  call Clrscr
 mov eax,4
 call setTextColor
 mov edx,offset  gameOverScreen
 call WriteString

    exit
main ENDP
END main

; This segment was written inside the main procedure in the original skeleton code. i do not know what these functions do, as i did not understand the "emitter" variable.
Temp PROC
    ; Main loop for player movement and updates
    main_loop:
        call check_for_key_press
        call update_emitter
        call fire    ; Call the fire procedure
        jmp main_loop

    ret
Temp ENDP

; ---------------------------------------------------------------------------------------------------------------------------------
; i have not called these functions. try to understand them before implementing them. these functions are untouched by me(i think).
