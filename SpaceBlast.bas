'SpaceBlast v1.0a
'By: Mallot1
'(C) 2013

NOMAINWIN

       WindowWidth = DisplayWidth
       WindowHeight = DisplayHeight

 [MainMenu]
    'if gameLaunched = 1 then
     '  gameLaunched = 2
    'end if

    'if mainMenuButttonClicked = 1 then
     '   paused = 1
     '   goto [pause]
    'end if

   'buttons and things
    button #main.play, "Play Game", [Game], UL, DisplayWidth/2-100, 200, 200, 50
    button #main.about, "About", [About], UL, DisplayWidth/2-100, 250, 200, 50
    button #main.background, "Change Background", [changeMenuBackground], UL, DisplayWidth/2-100,300, 200, 50
    'create window
    open "Main Menu" for graphics_nsb_nf as #main
    loadbmp "cursor1", "sprites\ship_up_on.bmp"
    print #main, "addsprite cursor cursor1"
    print #main, "when mouseMove [mouseMotion]"
    print #main, "trapclose [quit]"
    'setup window
6   print #main, "flush";

    if ( MenuBackgroundLoaded$ = "") then
        loadbmp "menuBG", "backgrounds\menuBG.bmp"
        print #main, "background menuBG"
        print #main, "drawsprites"
        MenuBackgroundLoaded$ = "true"
    end if

    print #main, "background menuBG"
    print #main, "drawsprites"
    wait

    [quit]
        close #main
        end

 [Game]
    close #main

    if gameLaunched = 2 then
        close #game
    end if

    if SavedGame = 1 then
        notice "would you like to continue your previous game, or start over?" + chr$(13) + "Start Over" + chr$(13) + "Continue";askcontinue$
        start = 1
            if askcontinue$ = "Start Over" then
                goto [timeTicked]
            end if

            if askcontinue$ = "Continue" then
                goto [Load]
            end if
    end if

    'sprites
    loadbmp "ship_up", "sprites\ship_up.bmp"
    loadbmp "ship_up_damage_1", "sprites\ship_up_damage_1.bmp"
    loadbmp "ship_up_damage_2", "sprites\ship_up_damage_2.bmp"
    loadbmp "ship_up_damage_3", "sprites\ship_up_damage_3.bmp"
    loadbmp "ship_up_damage_4", "sprites\ship_up_damage_4.bmp"
    loadbmp "ship_up_on", "sprites\ship_up_on.bmp"
    loadbmp "ship_up_on_damage_1", "sprites\ship_up_on_damage_1.bmp"
    loadbmp "ship_up_on_damage_2", "sprites\ship_up_on_damage_2.bmp"
    loadbmp "ship_up_on_damage_3", "sprites\ship_up_on_damage_3.bmp"
    loadbmp "ship_up_on_damage_4", "sprites\ship_up_on_damage_4.bmp"

    loadbmp "ship_left", "sprites\ship_left.bmp"
    loadbmp "ship_left_damage_1", "sprites\ship_left_damage_1.bmp"
    loadbmp "ship_left_damage_2", "sprites\ship_left_damage_2.bmp"
    loadbmp "ship_left_damage_3", "sprites\ship_left_damage_3.bmp"
    loadbmp "ship_left_damage_4", "sprites\ship_left_damage_4.bmp"
    loadbmp "ship_left_on", "sprites\ship_left_on.bmp"
    loadbmp "ship_left_on_damage_1", "sprites\ship_left_on_damage_1.bmp"
    loadbmp "ship_left_on_damage_2", "sprites\ship_left_on_damage_2.bmp"
    loadbmp "ship_left_on_damage_3", "sprites\ship_left_on_damage_3.bmp"
    loadbmp "ship_left_on_damage_4", "sprites\ship_left_on_damage_4.bmp"

    loadbmp "ship_right",  "sprites\ship_right.bmp"
    loadbmp "ship_right_damage_1", "sprites\ship_right_damage_1.bmp"
    loadbmp "ship_right_damage_2", "sprites\ship_right_damage_2.bmp"
    loadbmp "ship_right_damage_3", "sprites\ship_right_damage_3.bmp"
    loadbmp "ship_right_damage_4", "sprites\ship_right_damage_4.bmp"
    loadbmp "ship_right_on", "sprites\ship_right_on.bmp"
    loadbmp "ship_right_on_damage_1", "sprites\ship_right_on_damage_1.bmp"
    loadbmp "ship_right_on_damage_2", "sprites\ship_right_on_damage_2.bmp"
    loadbmp "ship_right_on_damage_3", "sprites\ship_right_on_damage_3.bmp"
    loadbmp "ship_right_on_damage_4", "sprites\ship_right_on_damage_4.bmp"

    loadbmp "ship_down", "sprites\ship_down.bmp"
    loadbmp "ship_down_damage_1", "sprites\ship_down_damage_1.bmp"
    loadbmp "ship_down_damage_2", "sprites\ship_down_damage_2.bmp"
    loadbmp "ship_down_damage_3", "sprites\ship_down_damage_3.bmp"
    loadbmp "ship_down_damage_4", "sprites\ship_down_damage_4.bmp"
    loadbmp "ship_down_on", "sprites\ship_down_on.bmp"
    loadbmp "ship_down_on_damage_1", "sprites\ship_down_on_damage_1.bmp"
    loadbmp "ship_down_on_damage_2", "sprites\ship_down_on_damage_2.bmp"
    loadbmp "ship_down_on_damage_3", "sprites\ship_down_on_damage_3.bmp"
    loadbmp "ship_down_on_damage_4", "sprites\ship_down_on_damage_4.bmp"

    loadbmp "asteroid", "sprites\asteroid.bmp"
    loadbmp "health(0)", "sprites\lives00.bmp"
    loadbmp "health(1)", "sprites\lives01.bmp"
    loadbmp "health(2)", "sprites\lives02.bmp"
    loadbmp "health(3)", "sprites\lives03.bmp"
    loadbmp "health(4)", "sprites\lives04.bmp"
    loadbmp "health(5)", "sprites\lives05.bmp"
    loadbmp "paused", "screens\pausescreen.bmp"
    loadbmp "start", "screens\startscreen.bmp"
    loadbmp "countdown1", "screens\startcountdown1.bmp"
    loadbmp "countdown2", "screens\startcountdown2.bmp"
    loadbmp "countdown3", "screens\startcountdown3.bmp"
    loadbmp "countdown4", "screens\startcountdown4.bmp"
    loadbmp "countdown5", "screens\startcountdown5.bmp"
    loadbmp "countdown6", "screens\startcountdown6.bmp"
    loadbmp "countdown7", "screens\startcountdown7.bmp"
    loadbmp "countdown8", "screens\startcountdown8.bmp"
    loadbmp "countdown9", "screens\startcountdown9.bmp"
    loadbmp "countdown10", "screens\startcountdown10.bmp"
    loadbmp "countdowntrans1", "screens\startcountdowntrans1.bmp"
    loadbmp "countdowntrans2", "screens\startcountdowntrans2.bmp"
    loadbmp "countdowntrans3", "screens\startcountdowntrans3.bmp"
    loadbmp "gameover", "screens\gameoverscreen.bmp"

    loadbmp "ship_boost_left", "sprites\ship_boost_left.bmp"
    loadbmp "ship_boost_left_damage_1", "sprites\ship_boost_left_damage_1.bmp"
    loadbmp "ship_boost_left_damage_2", "sprites\ship_boost_left_damage_2.bmp"
    loadbmp "ship_boost_left_damage_3", "sprites\ship_boost_left_damage_3.bmp"
    loadbmp "ship_boost_left_damage_4", "sprites\ship_boost_left_damage_4.bmp"

    loadbmp "ship_boost_right", "sprites\ship_boost_right.bmp"
    loadbmp "ship_boost_right_damage_1", "sprites\ship_boost_right_damage_1.bmp"
    loadbmp "ship_boost_right_damage_2", "sprites\ship_boost_right_damage_2.bmp"
    loadbmp "ship_boost_right_damage_3", "sprites\ship_boost_right_damage_3.bmp"
    loadbmp "ship_boost_right_damage_4", "sprites\ship_boost_right_damage_4.bmp"

    loadbmp "ship_boost_down", "sprites\ship_boost_down.bmp"
    loadbmp "ship_boost_up", "sprites\ship_boost_up.bmp"

    loadbmp "boost25", "sprites\boost_25.bmp"
    loadbmp "boost24", "sprites\boost_24.bmp"
    loadbmp "boost23", "sprites\boost_23.bmp"
    loadbmp "boost22", "sprites\boost_22.bmp"
    loadbmp "boost21", "sprites\boost_21.bmp"
    loadbmp "boost20", "sprites\boost_20.bmp"
    loadbmp "boost19", "sprites\boost_19.bmp"
    loadbmp "boost18", "sprites\boost_18.bmp"
    loadbmp "boost17", "sprites\boost_17.bmp"
    loadbmp "boost16", "sprites\boost_16.bmp"
    loadbmp "boost15", "sprites\boost_15.bmp"
    loadbmp "boost14", "sprites\boost_14.bmp"
    loadbmp "boost13", "sprites\boost_13.bmp"
    loadbmp "boost12", "sprites\boost_12.bmp"
    loadbmp "boost11", "sprites\boost_11.bmp"
    loadbmp "boost10", "sprites\boost_10.bmp"
    loadbmp "boost09", "sprites\boost_09.bmp"
    loadbmp "boost08", "sprites\boost_08.bmp"
    loadbmp "boost07", "sprites\boost_07.bmp"
    loadbmp "boost06", "sprites\boost_06.bmp"
    loadbmp "boost05", "sprites\boost_05.bmp"
    loadbmp "boost04", "sprites\boost_04.bmp"
    loadbmp "boost03", "sprites\boost_03.bmp"
    loadbmp "boost02", "sprites\boost_02.bmp"
    loadbmp "boost01", "sprites\boost_01.bmp"
    loadbmp "boost00", "sprites\boost_00.bmp"


    bulletname$ = "bullet";bulletnumber
    bulletnumber = 1
    loadbmp bulletname$, "sprites\bullet1.bmp"

    menu #game, "&Options", "Change Background", [changeBackground],  "About", [About], "Menu", [mainMenuButtonClicked]
    menu #game, "&Change Background", "Change Background", [changeBackground]
    menu #game, "&About", "About", [About]
    menu #game, "&Menu", "Menu", [mainMenuButtonClicked]

    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "trapclose [gameQuit]"

    'start game?
    print #game, "background start"
    print #game, "drawsprites"
    notice "Ready to start?"
    gosub [Start]

    print #game, "addsprite ship ship_up ship_up_damage_1 ship_up_damage_2 ship_up_damage_3 ship_up_damage_4 ship_up_on ship_up_on_damage_1 ship_up_on_damage_2 ship_up_on_damage_3 ship_up_on_damage_4 ship_left ship_left_damage_1 ship_left_damage_2 ship_left_damage_3 ship_left_damage_4 ship_left_on ship_left_on_damage_1 ship_left_on_damage_2 ship_left_on_damage_3 ship_left_on_damage_4 ship_right ship_right_damage_1 ship_right_damage_2 ship_right_damage_3 ship_right_damage_4 ship_right_on ship_right_on_damage_1 ship_right_on_damage_2 ship_right_on_damage_3 ship_right_on_damage_4 ship_down ship_down_on ship_down_on_damage_1 ship_down_on_damage_2 ship_down_on_damage_3 ship_down_on_damage_4 ship_boost_left ship_boost_left_damage_1 ship_boost_left_damage_2 ship_boost_left_damage_3 ship_boost_left_damage_4 ship_boost_right ship_boost_right_damage_1 ship_boost_right_damage_2 ship_boost_right_damage_3 ship_boost_right_damage_4 ship_boost_down ship_boost_up"
    print #game, "spritescale ship 250"
    print #game, "addsprite asteroid asteroid"
    print #game, "addsprite bullet ";bulletname$
    print #game, "addsprite health health(0) health(1) health(2) health(3) health(4) health(5)"
    print #game, "addsprite boostbar boost25 boost24 boost23 boost22 boost21 boost20 boost19 boost18 boost17 boost16 boost15 boost14 boost13 boost12 boost11 boost10 boost09 boost08 boost07 boost06 boost05 boost04 boost03 boost02 boost01 boost00"
    print #game, "spritescale health 500"
    print #game, "spritexy health 1200 0"
    print #game, "when characterInput [userInput]"
    print #game, "when leftButtonDown [shoot]"
   ' print #game, "setfocus"

    'load Background
    if (backgroundChanged$ = "true") then goto 3                'now game will always show the user chosen background
    loadbmp "bg", "backgrounds\space.bmp"
    print #game, "background bg"
    print #game, "drawsprites"

   'Variables:
    start = 1
    shipX = WindowWidth/2 - 100 ' ship x-pos
    shipY = WindowHeight - 120  ' ship y-pos
1   paused = 0
    velx = 15.5 ' asteroid X-Axis speed
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
    health = 5
    score = 0

    print #game, "spritexy ship "; shipX; " "; shipY
    print #game, "drawsprites"
    scan
    gosub [loadShip]
    timer 56,  [timeTicked]
    wait

    [gameQuit]
        timer 0
        confirm "Do you really want to quit?";quit$
        if quit$ = "yes" then
            start = 0
4           close #game   'if your out of health you come here and the game ends
            end
        end if
        if quit$ = "no" then
            goto  1 ' goto line labeled "1"
        end if
        wait

    [quitToMenu]
     confirm "Are you sure you want to leave? Y/N?";GTMenu$
     if GTMenu$ = "yes" then
        start = 0
        confirm "Would you like to save your game?( you can currently only resume while the game is open ) Y/N?";asksave$
            if asksave$ = "yes" then
                goto [Save]
            end if

            if asksave$ = "no" then
                notice "Leaving to menu..."
            end if
5       close #game
        goto [MainMenu]
     end if

     if GTMenu$ = "no" then
        goto 1
     end if
     wait

    [Start]
        'game start countdown
        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown10"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown9"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown8"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown7"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown6"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown5"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown4"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown3"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown2"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"

        print #game, "background countdowntrans1"
        print #game, "drawsprites"
        print #game, "background countdowntrans2"
        print #game, "drawsprites"
        print #game, "background countdown1"
        print #game, "drawsprites"
        print #game, "background countdowntrans3"
        print #game, "drawsprites"
    return

    [loadShip]
        print #game, "spritexy ship "; shipX; " "; shipY
        print #game, "drawsprites"
        return
        wait

    [loadHealth]
        health = 5
        gotHealth = 1
        print #game, "spriteimage health health("; health; ")"
        print #game, "spritescale health 500"
        print #game, "spritexy health 1200 0"
        print #game, "drawsprites"
        firdtAddedHealth = 1
        goto [Health]

        [Health]
            if health < 0 then
                health = 0
            end if

            select health
                case 5
                    print #game, "spriteimage health health(5)"
                    print #game, "spritescale health 500"
                    print #game, "spritexy health 1200 0"
                    print #game, "drawsprites"

                case  4
                    print #game, "spriteimage health health(4)"
                    print #game, "spritescale health 500"
                    print #game, "spritexy health 1200 0"
                    print #game, "drawsprites"

                case  3
                    print #game, "spriteimage health health(3)"
                    print #game, "spritescale health 500"
                    print #game, "spritexy health 1200 0"
                    print #game, "drawsprites"

                case  2
                    print #game, "spriteimage health health(2)"
                    print #game, "spritescale health 500"
                    print #game, "spritexy health 1200 0"
                    print #game, "drawsprites"

                case  1
                    print #game, "spriteimage health health(1)"
                    print #game, "spritescale health 500"
                    print #game, "spritexy health 1200 0"
                    print #game, "drawsprites"

                case  0
                    print #game, "background gameover"
                    print #game, "drawsprites"
                    notice "Game Over!" + Chr$(13) + "Better Luck next time! Your final score is: ";score
                    print #game, "drawsprites"
                    goto 4

            end select
            if firstAddedHealth = 1 then
                goto [timeTicked]
                firstAddedHealth = 0
            else
                return
            end if

    [timeTicked]
    if paused = 0 then
        bulletX = shipX
        bulletY = shipY
        if gotHealth = 0 then
            gosub [loadHealth]
        end if
        gosub [Health]
        gosub [loadAsteroids]
        print #game, "spritexy ship "; shipX; " "; shipY
        print #game, "drawsprites"
        char$ = ""
        wait

    end if

    [userInput]
        char$ = Inkey$

        'un-pause the game
        if char$ = "r" then
            if paused = 1 then
                goto [endPause]
            end if
        end if

        if char$ = "R" then
            if paused = 1 then
                goto [endPause]
            end if
        end if


    if paused = 0 then
        if char$ = "b" then
            gosub [Boost]
        end if

        if char$ = "B" then
            gosub [Boost]
        end if

        if char$ = "w" then
            shipY = shipY - 10
                if health = 5 then
                    print #game, "spriteimage ship ship_up_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_up_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_up_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_up_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_up_on_damage_4"
                    print #game, "drawsprites"
                end if
            moving$ = "up"
            char$ = ""
        end if

         if char$ = "W" then                                    'if Caps Lock is on
             shipY = shipY - 10
                if health = 5 then
                    print #game, "spriteimage ship ship_up_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_up_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_up_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_up_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_up_on_damage_4"
                    print #game, "drawsprites"
                end if
             moving$ = "up"
             char$ = ""
         end if

        if char$ = "a" then
                if health = 5 then
                    print #game, "spriteimage ship ship_left_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_left_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_left_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_left_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_left_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipX = shipX - 10
            moving$ = "left"
            char$ = ""
        end if

        if char$ = "A" then                                    'if Caps Lock is on
                if health = 5 then
                    print #game, "spriteimage ship ship_left_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_left_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_left_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_left_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_left_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipX = shipX - 10
            moving$ = "left"
            char$ = ""
        end if

        if char$ = "s" then
                if health = 5 then
                    print #game, "spriteimage ship ship_down_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_down_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_down_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_down_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_down_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipY = shipY + 10
            moving$ = "down"
            char$ = ""
        end if


        if char$ = "S" then                                    'if Caps Lock is on
                if health = 5 then
                    print #game, "spriteimage ship ship_down_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_down_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_down_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_down_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_down_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipY = shipY + 10
            moving$ = "down"
            char$ = ""
        end if

        if char$ = "d" then
                if health = 5 then
                    print #game, "spriteimage ship ship_right_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_right_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_right_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_right_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_right_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipX = shipX + 10
            moving$ = "right"
            char$ = ""
        end if

        if char$ = "D" then                                    'if Caps Lock is on
                if health = 5 then
                    print #game, "spriteimage ship ship_right_on"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_right_on_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_right_on_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_right_on_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_right_on_damage_4"
                    print #game, "drawsprites"
                end if
            shipX = shipX + 10
            moving$ = "right"
            char$ = ""
        end if

        if char$ = "p" then
            goto [Pause]
        end if

        if char$ = "P" then
            goto [Pause]
        end if


        print "X: ";shipX ;"   Y: ";shipY
        print #game, "spritexy ship "; shipX; " ";shipY
        print #game, "drawsprites"

        if shipX >= 1293 then
           shipX = 1291
        end if

        if shipX <= 0 then
           shipX = 2
        end if

        if shipY >= 632 then
           shipY = 630
        end if

        if shipY <= 0 then
           shipY = 2
        end if

        if char$ = "" then
            if moving$ = "up" then
                if health = 5 then
                    print #game, "spriteimage ship ship_up"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_up_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_up_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_up_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_up_damage_4"
                    print #game, "drawsprites"
                end if
            end if

            if moving$ = "left" then
                if health = 5 then
                    print #game, "spriteimage ship ship_left"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_left_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_left_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_left_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_left_damage_4"
                    print #game, "drawsprites"
                end if
            end if

            if moving$ = "down" then
                if health = 5 then
                    print #game, "spriteimage ship ship_down"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_down_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_down_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_down_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_down_damage_4"
                    print #game, "drawsprites"
                end if
            end if

            if moving$ = "right" then
                if health = 5 then
                    print #game, "spriteimage ship ship_right"
                    print #game, "drawsprites"
                end if

                if health = 4 then
                    print #game, "spriteimage ship ship_right_damage_1"
                    print #game, "drawsprites"
                end if

                if health = 3 then
                    print #game, "spriteimage ship ship_right_damage_2"
                    print #game, "drawsprites"
                end if

                if health = 2 then
                    print #game, "spriteimage ship ship_right_damage_3"
                    print #game, "drawsprites"
                end if

                if health = 1 then
                    print #game, "spriteimage ship ship_right_damage_4"
                    print #game, "drawsprites"
                end if
            end if
        end if

        if shot = 1 then
            gosub [loadBullet]
        end if
    end if ' pause = 0 end if

        wait

    [Boost]
        if boostLoaded = 0 then
            print #game, "spritexy boostbar 1000 0"
            print #game, "spritescale boostbar 500 0"
            print #game, "drawsprites"
            boost = 10 ' 10 boost 25 max
            boostLoaded = 1
        end if

        if boost <> 0 then
            if boost = 25 then
                print #game, "spriteimage boostbar boost25"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 24 then
                print #game, "spriteimage boostbar boost24"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 23 then
                print #game, "spriteimage boostbar boost23"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 22 then
                print #game, "spriteimage boostbar boost22"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 21 then
                print #game, "spriteimage boostbar boost21"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 20 then
                print #game, "spriteimage boostbar boost20"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 19 then
                print #game, "spriteimage boostbar boost19"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if
            if boost = 18 then
                print #game, "spriteimage boostbar boost18"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 17 then
                print #game, "spriteimage boostbar boost17"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 16 then
                print #game, "spriteimage boostbar boost16"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 15 then
                print #game, "spriteimage boostbar boost15"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 14 then
                print #game, "spriteimage boostbar boost14"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 13 then
                print #game, "spriteimage boostbar boost13"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 12 then
                print #game, "spriteimage boostbar boost12"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 11 then
                print #game, "spriteimage boostbar boost11"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if


            if boost = 10 then
                print #game, "spriteimage boostbar boost10"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 9 then
                print #game, "spriteimage boostbar boost09"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 8 then
                print #game, "spriteimage boostbar boost08"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 7 then
                print #game, "spriteimage boostbar boost07"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 6 then
                print #game, "spriteimage boostbar boost06"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 5 then
                print #game, "spriteimage boostbar boost05"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 4 then
                print #game, "spriteimage boostbar boost04"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 3 then
                print #game, "spriteimage boostbar boost03"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 2 then
                print #game, "spriteimage boostbar boost02"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

            if boost = 1 then

                print #game, "spriteimage boostbar boost01"
                print #game, "drawsprites"
                boostIsAtOne$ = "true"
                boost = boost - 2 ' to get less than 0 to be reset to 0
                goto 7
            end if

        if boost < 0 then
            print #game, "spriteimage boostbar boost00"
            print #game, "drawsprites"
            boost = 0
            goto 7
        end if

7           if boost > -1 then
                if moving$ = "left" then
                    select health
                        case 5
                            print #game, "spriteimage ship ship_boost_left"
                            print #game, "drawsprites"
                        case 4
                            print #game, "spriteimage ship ship_boost_left_damage_1"
                            print #game, "drawsprites"
                        case 3
                            print #game, "spriteimage ship ship_boost_left_damage_2"
                            print #game, "drawsprites"
                        case 2
                            print #game, "spriteimage ship ship_boost_left_damage_3"
                            print #game, "drawsprites"
                        case 1
                            print #game, "spriteimage ship ship_boost_left_damage_4"
                            print #game, "drawsprites"
                    end select
                  shipX = shipX - 100
                end if

                if moving$ = "right" then
                    select health
                        case 5
                            print #game, "spriteimage ship ship_boost_right"
                            print #game, "drawsprites"
                        case 4
                            print #game, "spriteimage ship ship_boost_right_damage_1"
                            print #game, "drawsprites"
                        case 3
                            print #game, "spriteimage ship ship_boost_right_damage_2"
                            print #game, "drawsprites"
                        case 2
                            print #game, "spriteimage ship ship_boost_right_damage_3"
                            print #game, "drawsprites"
                        case 1
                            print #game, "spriteimage ship ship_boost_right_damage_4"
                            print #game, "drawsprites"
                    end select
                    shipX = shipX + 100
                end if

                if moving$ = "up" then
                    print #game, "spriteimage ship ship_boost_up"
                    print #game, "drawsprites"
                    shipY = shipY - 100
                end if

                if moving$ = "down" then
                    print #game, "spriteimage ship ship_boost_down"
                    print #game, "drawsprites"
                    shipY = shipY + 100
                end if
            end if
        end if
        return

    [loadAsteroids]
        print #game, "spriteimage asteroid asteroid"
        print #game, "spritemovexy asteroid "; x+velx; " "; y+vely
        print #game, "drawsprites"
        return
        wait

    [changeMenuBackground]
        filedialog "Open Bitmap Image", "*.bmp", UserBGimage$
        if (UserBGimage$ = "") then
            notice "Background change aborted by user."
            goto 6
        end if
        MenuBackgroundLoaded$ = UserBGimage$
        MenuBackgroundChanged$ = "true"
        loadbmp "UserBG",  UserBGimage$
        print #main, "background UserBG"
        print #main, "drawsprites"
        wait

    [changeBackground]

        filedialog "Open Bitmap Image", "backgrounds/*.bmp", UserBGimage$
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

        if bulletX <= 18 then '18
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletX >= 1293 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletY <= 2 then
            print #game, "removesprite bullet"
            print #game, "drawsprites"
        end if

        if bulletY >= 648 then
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

    [mainMenuButtonClicked]

        mainMenuButtonClicked = 1
        goto [quitToMenu]
        wait


[Pause]
    paused = 1

    print #game, "background paused"
    print #game, "drawsprites"

    if mainMenuButtonClicked = 1 then
        mainMenuButtonClicked = 0
    end if
    if noticeGiven = 0 then
        notice "Game paused, press "+ "r" + " to resume the game."
    end if

    'Store data in temporary variables
    TempshipX = shipX
    TempshipY = shipY
    TempbulletX = bulletX
    TempbulletY = bulletY
    Tempvelx = velx
    Tempvely = vely
    Tempx = x
    Tempy = y

    'Stop motion
    shipX = shipX
    shipY = shipY
    bulletX = bulletX
    bulletY = bulletY
    velx = velx
    vely = vely
    x = x
    y = y


    'preserve the location of all sprites and everything going on in the game
    wait

[endPause]

    'reload the variables
    shipX = TempshipX
    shipY = TempshipY
    bulletX = TempbulletX
    bulletY = TempbulletY
    velx = Tempvelx
    vely = Tempvely
    x = Tempx
    y = Tempy

    'reset temporary variables
    TempshipX = 0
    TempshipY = 0
    TempbulletX = 0
    TempbulletY = 0
    Tempvelx = 0
    Tempvely = 0
    Tempx = 0
    Tempy = 0
    paused = 0

    print #game, "background bg"
    print #game, "drawsprites"

    wait


[About]

    notice "About" + chr$(13) + "SpaceBlast (C)' 2013"
    wait

[Save]
    TempshipX = shipX
    TempshipY = shipY
    TempbulletX = bulletX
    TempbulletY = bulletY
    Tempvelx = velx
    Tempvely = vely
    Tempx = x
    Tempy = y
    SavedGame = 1
    notice "Save successful!"
    goto 5
    wait


[Load]
    if paused = 1 then
        shipX = TempshipX
        shipY = TempshipY
        bulletX = TempbulletX
        bulletY = TempbulletY
        velx = Tempvelx
        vely = Tempvely
        x = Tempx
        y = Tempy
    end if
    wait

[mouseMotion]
    shipX = MouseX
    shipY = MouseY
    print #main, "spritexy cursor ";shipX; " ";shipY
    print #main, "drawsprites"
    wait
