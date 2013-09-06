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

    bulletname$ = "bullet";bulletnumber
    bulletnumber = 1
    loadbmp bulletname$, "sprites\bullet1.bmp"

    menu #game, "Options", "Change Background", [changeBackground],  "About", [About]
    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "trapclose [gameQuit]"
    print #game, "addsprite ship ship_up ship_up_on ship_left ship_left_on ship_right ship_right_on ship_down ship_down_on"
    print #game, "spritescale ship 250"
    print #game, "addsprite asteroid asteroid"
    print #game, "addsprite bullet ";bulletname$
    print #game, "addsprite health health(0) health(1) health(2) health(3) health(4)"
    print #game, "when characterInput [userInput]"
    print #game, "when leftButtonDown [shoot]"
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
    dim BulletBMP$(10)
    BulletBMP$(1) = "sprites\bullet1.bmp"
    BulletBMP$(2) = "sprites\bullet2.bmp"
    BulletBMP$(3) = "sprites\bullet3.bmp"
    BulletBMP$(4) = "sprites\bullet4.bmp"
    BulletBMP$(5) = "sprites\bullet5.bmp"
    BulletBMP$(6) = "sprites\bullet6.bmp"
    BulletBMP$(7) = "sprites\bullet7.bmp"
    BulletBMP$(8) = "sprites\bullet8.bmp"
    BulletBMP$(9) = "sprites\bullet9.bmp"
    BulletBMP$(10) = "sprites\bullet10.bmp"
    currentBulletNum = 1
    health = 4
    score = 0

    print #game, "spritexy ship "; shipX; " "; shipY
    print #game, "drawsprites"
    scan
    gosub [loadShip]
    timer 1,  [timeTicked]
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

    [loadShip]
        print #game, "spritexy ship "; shipX; " "; shipY
        print #game, "drawsprites"
        return
        wait

    [loadHealth]
        health = 4
        print #game, "spriteimage health health(4)"
        print #game, "spritescale health 200"
        print #game, "spritexy health 500 0"
        print #game, "drawsprites"
        return

        [AddHealth]
            select health
                case  4
                    print #game, "spriteimage health health(4)"
                    print #game, "drawsprites"

                case  3
                    print #game, "spriteimage health health(3)"
                    print #game, "drawsprites"

                case  2
                    print #game, "spriteimage health health(2)"
                    print #game, "drawsprites"

                case  1
                    print #game, "spriteimage health health(1)"
                    print #game, "drawsprites"

                case  0
                    notice "Game Over!" + Chr$(13) + "Better Luck next time! Your final score is: ";score
                    print #game, "drawsprites"
                    goto 4

            end select

            print #game, "spritescale health 200"
            print #game, "spritexy health 500 0"
            print #game, "drawsprites"

            goto [timeTicked]

    [timeTicked]
        bulletX = shipX
        bulletY = shipY
        if gotHealth = 0 then
            gosub [loadHealth]
        end if

        gosub [loadAsteroids]
        print #game, "spritexy ship "; shipX; " "; shipY
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
        if shot = 1 then
            gosub [loadBullet]
        end if
        wait

    [loadAsteroids]
        print #game, "spriteimage asteroid asteroid"
        print #game, "spritemovexy asteroid "; x+velx; " "; y+vely
        print #game, "drawsprites"
        return
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

    [loadBullet]
        'print BulletBMP$(currentBulletNum)
            if currentBulletNum >= 10 then
                currentBulletNum = 1
            else
                currentBulletNum = currentBulletNum + 1
            end if
                                              'Load up new bullet

              if moving$ = "up" then
            print #game, "spritexy bullet ";bulletX+24; " ";bulletY-10
            print #game, "drawsprites"
        end if

        if moving$ = "left" then
            print #game, "spritexy bullet ";bulletX-5; " ";bulletY+18
            print #game, "drawsprites"
        end if

        if moving$ = "down" then
            print #game, "spritexy bullet ";bulletX+22; " ";bulletY+50
            print #game, "drawsprites"
        end if

        if moving$ = "right" then
                print #game, "spritexy bullet ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
        end if

        if bulletX <= 0 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletX >= 640 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletY <= 0 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletY >= 480 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if shot = 1 then
            bulletname$ = "bullet";bulletnumber
            shot = 0
            return
        end if
        wait

    [shoot]
        shot = 1

        gosub [loadBullet]

        if moving$ = "up" then
                #game, "spritemovexy bullet 0 -5"
                #game, "drawsprites"
        end if

        if moving$ = "left" then

            #game, "spritemovexy bullet -5 0"
            #game, "drawsprites"
        end if

        if moving$ = "down" then
            #game, "spritemovexy bullet 0 5"
            #game, "drawsprites"
        end if

        if moving$ = "right" then
            #game, "spritemovexy bullet 5 0"
            #game, "drawsprites"
        end if
        wait

[About]
    notice "About" + chr$(13) + "SpaceBlast (C)' 2013"
    wait



