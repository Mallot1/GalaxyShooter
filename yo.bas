'SpaceBlast v1.0a
'By: Mallot1
'(C) 2013

NOMAINWIN

       WindowWidth = DisplayWidth
       WindowHeight = DisplayHeight

 [MainMenu]
   'buttons and things
    button #main.play, "Play Game", [Game], UL, DisplayWidth/2-100, 200, 200, 50
    button #main.about, "About", [About], UL, DisplayWidth/2-100, 250, 200, 50
    'create window
    open "Main Menu" for graphics_nsb_nf as #main
    print #main, "trapclose [quit]"
    'setup window
    print #main, "flush";
    if ( backgroundLoaded$ = "") then
        loadbmp "menuBG", "media\menuBG.bmp"
        print #main, "background menuBG"
    end if

    print #main, "drawsprites"
    backgroundLoaded$ = "true"
    wait

    [quit]
        close #main
        end


 [Game]
    close #main
    WindowWidth = 640
    WindowHeight = 480
    'sprites
    loadbmp "ship_up", "sprites\ship_up.bmp"
    loadbmp "ship_up_on", "sprites\ship_up_on.bmp"
    loadbmp "ship_left", "sprites\ship_left.bmp"
    loadbmp "ship_left_on", "sprites\ship_left_on.bmp"
    loadbmp "ship_right",  "sprites\ship_right.bmp"
    loadbmp "ship_right_on", "sprites\ship_right_on.bmp"
    loadbmp "ship_down", "sprites\ship_down.bmp"
    loadbmp "ship_down_on", "sprites\ship_down_on.bmp"
    loadbmp "asteroid", "sprites\asteroid.bmp"
    loadbmp "health(0)", "sprites\lives00.bmp"
    loadbmp "health(1)", "sprites\lives01.bmp"
    loadbmp "health(2)", "sprites\lives02.bmp"
    loadbmp "health(3)", "sprites\lives03.bmp"
    loadbmp "health(4)", "sprites\lives04.bmp"

    menu #game, "Options", "Change Background", [changeBackground],  "About", [About]
    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "trapclose [gameQuit]"
    wait


    [gameQuit]
        timer 0
        confirm "Do you really want to quit?";quit$
        if quit$ = "yes" then
   4        close #game   'if your out of health you come here and the game ends
            end
        end if
        if quit$ = "no" then
            goto  1 ' goto line labeled "1"
        end if
        wait
