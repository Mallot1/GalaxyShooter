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

    menu #game, "Options", "Change Background", [changeBackground],  "About", [About]
    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "trapclose [gameQuit]"
    print #game, "addsprite ship ship_up ship_up_on ship_left ship_left_on ship_right ship_right_on ship_down ship_down_on"
    print #game, "spritescale ship 250"
    print #game, "addsprite asteroid asteroid"
    print #game, "when characterInput [userInput]"
    print #game, "setfocus"

    'load Background
    if (backgroundChanged$ = "true") then goto 3                'now game will always show the user chosen background
    loadbmp "bg", "media\space.bmp"
    print #game, "background bg"
    print #game, "drawsprites"

   'Variables:
    shipX = WindowWidth/2 - 100 ' ship x-pos
    shipY = WindowHeight - 120  ' ship y-pos
1   velx = 15.5 ' asteroid X-Axis speed
    vely = 15.5 ' asteroid Y-Axis speed
    x = 1 ' asteroid x-pos
    y = 1 ' asteroid y-pos
    print #game, "spritexy ship "; shipX; " "; shipY
    print #game, "drawsprites"
    scan
    gosub [loadShip]
2   timer 50,  [timeTicked]
    wait

    [gameQuit]
        timer 0
        confirm "Do you really want to quit?";quit$
        if quit$ = "yes" then
            close #game
            end
        end if
        if quit$ = "no" then
            goto  1 ' goto line labeled "1"
        end if
        wait

    [loadShip]
        print #game, "spritexy ship "; shipX; " "; shipY
        print #game, "drawsprites"
        return
        wait

    [timeTicked]
        gosub [loadAsteroids]
        print #game, "spritexy ball "; shipX; " "; shipY
        print #game, "spritexy asteroid "; x; " "; y
        print #game, "drawsprites"
        char$ = ""
        wait

    [userInput]
        char$ = Inkey$
        if char$ = "w" then
            shipY = shipY - 10
            print #game, "spriteimage ship ship_up_on"
            print #game, "drawsprites"
            moving$ = "up"
            char$ = ""
        end if

        if char$ = "a" then
            print #game, "spriteimage ship ship_left_on"
            print #game, "drawsprites"
            shipX = shipX - 10
            moving$ = "left"
            char$ = ""
        end if

        if char$ = "s" then
            print #game, "spriteimage ship ship_down_on"
            print #game, "drawsprites"
            shipY = shipY + 10
            moving$ = "down"
            char$ = ""
        end if
        if char$ = "d" then
            print #game, "spriteimage ship ship_right_on"
            print #game, "drawsprites"
            shipX = shipX + 10
            moving$ = "right"
            char$ = ""
        end if

        print "X: ";shipX ;"   Y: ";shipY
        print #game, "spritexy ship "; shipX; " ";shipY
        print #game, "drawsprites"

        if shipX >= 580 then
           shipX = 580
        end if

        if shipX <= 0 then
           shipX = 0
        end if

        if shipY >= 370 then
           shipY = 370
        end if

        if shipY <= 0 then
           shipY = 0
        end if

        if char$ = "" then
            if moving$ = "up" then
                print #game, "spriteimage ship ship_up"
                print #game, "drawsprites"
            end if

            if moving$ = "left" then
                print #game, "spriteimage ship ship_left"
                print #game, "drawsprites"
            end if

            if moving$ = "down" then
                print #game, "spriteimage ship ship_down"
                print #game, "drawsprites"
            end if

            if moving$ = "right" then
                print #game, "spriteimage ship ship_right"
                print #game, "drawsprites"
            end if
        end if
        wait

    [loadAsteroids]
        print #game, "spriteimage asteroid asteroid"
        print #game, "spritemovexy asteroid "; x+velx; " "; y+vely
        print #game, "drawsprites"
        goto 2
        wait

    [changeBackground]

        filedialog "Open Bitmap Image", "*.bmp", UserBGimage$
        if (UserBGimage$ = "") then
            notice "Background change aborted by user."
            goto 1
        end if

        backgroundChanged$ = "true"
3       loadbmp "UserBG",  UserBGimage$
        print #game, "background UserBG"
        print #game, "drawsprites"
        wait

[About]
    notice "About" + chr$(13) + "SpaceBlast (C)' 2013"
    wait


