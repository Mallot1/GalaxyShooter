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
       gosub [menuBackground]
       wait

 [menuBackground]
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
    'buttons and things
    menu #game, "Options", "Change Background", [changeBackground],  "About", [About]
    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "trapclose [gameQuit]"
 1 'this is labeled as line "1". Gives the program somewhere to jump to so it can continue the game.
    gosub [playGame]
    wait

[playGame]
    gosub [gameBackground]  ' load the background

    if shipMade = 0 then
        shipMade = 1
        gosub [makeShip]
    end if

    gosub [loadShip]
    gosub [makeAsteroids]
3  timer 50,  [loadAsteroids]
    wait

[makeShip]
    'load ship sprites
    loadbmp "ship_up", "sprites\ship_up.bmp"
    loadbmp "ship_up_on", "sprites\ship_up_on.bmp"
    loadbmp "ship_left", "sprites\ship_left.bmp"
    loadbmp "ship_left_on", "sprites\ship_left_on.bmp"
    loadbmp "ship_right",  "sprites\ship_right.bmp"
    loadbmp "ship_right_on", "sprites\ship_right_on.bmp"
    loadbmp "ship_down", "sprites\ship_down.bmp"
    loadbmp "ship_down_on", "sprites\ship_down_on.bmp"

    print #game, "addsprite ship ship_up ship_up_on ship_left ship_left_on ship_right ship_right_on ship_down ship_down_on"
    return
    wait

 [loadShip]
    x = WindowWidth/2-100
    y = WindowHeight - 120

    print #game, "spritescale ship 250"
    print #game, "spriteimage ship ship_up"';
    print #game, "spritexy? ship "
    input #game, posX, posY
    print #game, "spritexy ship ";x;" ";y
    return
    wait

[makeAsteroids]
    loadbmp "asteroid", "sprites\asteroid.bmp"
    print #game, "addsprite asteroid asteroid"
    return
    wait

[loadAsteroids]
    print #game, "flush";
    velX = 0.5 ' X-Axis speed
    velY = 0.5 'Y-Axis speed

    if (X > 0) then
        X = velX - X
   end if

     if (Y > 0) then
        Y = velY - Y
    end if

    if ( X and Y < 0 ) then
        X = velX + X 'X distance per frame
        Y = velY + Y 'Y distance per frame
    end if

    print #game, "spriteimage asteroid asteroid"
    print #game, "spritemovexy asteroid X Y"
    print #game, "drawsprites"
    goto 3
    wait

[gameQuit]
    confirm "Do you really want to quit?";quit$
    if ( quit$ = "yes" ) then
            close #game
            end
    end if
        if ( quit$ = "no" ) then
                     goto  1 ' goto line labeled "1"
        end if
wait

[gameBackground]
    if (backgroundChanged$ = "true") then goto 2                'now game will always show the user chosen background
    loadbmp "bg", "media\space.bmp"
    print #game, "background bg"
    print #game, "drawsprites"
    return
    wait

[changeBackground]
    filedialog "Open Bitmap Image", "*.bmp", UserBGimage$
 2 loadbmp "UserBG",  UserBGimage$
    print #game, "background UserBG"
    print #game, "drawsprites"
    backgroundChanged$ = "true"
    return
    wait

[About]
    notice "About" + chr$(13) + "SpaceBlast (C)' 2013"
    wait
