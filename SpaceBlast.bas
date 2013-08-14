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
    gosub [makeAsteroids]
3    timer 250,  [LoadAsteroids]
    wait

[makeAsteroids]
    loadbmp "asteroid", "sprites\asteroid.bmp"
    print #game, "addsprite asteroid asteroid"
    return
    wait

[LoadAsteroids]
    print #game, "flush";
    velX = 0.5 ' X-Axis speed
    velY = 0.5 'Y-Axis speed
    X = velX + X + 0.5 'X distance per frame
    Y = velY + Y 'Y distance per frame
    print #game, "spriteimage asteroid asteroid"
    print #game, "spritexy asteroid X Y"
    print #game, "drawsprites"
   X = X + 1
   Y = Y + 1
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
