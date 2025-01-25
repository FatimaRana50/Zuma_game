INCLUDE Irvine32.inc
includelib Winmm.lib


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

path_game db '_____________________________________________________________________________________________________________________',13,10
          db '|                                                                                                                    | ',13,10
          db '|                                                                                                                    | ',13,10
          db '|                                                                                                                    | ',13,10
          db '|      ________________________________________________________________________________________________________      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10
          db '|      |                                                                                                      |      | ',13,10

.code
main PROC
 mov dl,10 
    mov dh,10
    mov eax,white
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
    mov eax,green
    call SetTextColor
    mov dh,3
    mov dl,0
    call Gotoxy
    mov edx,offset path_game
    call WriteString






exit
main ENdp
end main