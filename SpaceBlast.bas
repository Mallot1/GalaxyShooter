'SpaceBlast v1.0a
'By: Mallot1
'(C) 2013

'Verison 1: Finished 12/15/13 1:05 AM

NOMAINWIN

global score
global cursor$
global cursordir$
global width
global height
global shipSpeed
savingMode$ = "Off"
codenum = 1

WindowWidth = DisplayWidth
WindowHeight = DisplayHeight

 [MainMenu]
    if running$ = "true" then
        stopmidi
        moving$ = ""
        close #game
    end if
    MouseMotion$ = "On"
   'buttons and things
    button #main.play, "Play Game", [Game], UL, DisplayWidth/3, 100, 500, 100
    button #main.about, "About", [About], UL, DisplayWidth/3, 200, 500, 100
    button #main.background, "Change Background", [changeMenuBackground], UL, DisplayWidth/3, 300, 500, 100
    button #main.cheatcode, "Enter Cheat Code", [startCheatCodeValidator], UL, DisplayWidth/3, 400, 500, 100
    button #main.quit, "Quit", [Quit], UL, DisplayWidth/3, 500, 500, 100
    button #main.reset, "Reset", [resetMainMenu], LL, 10, 10, 200, 50

    loadbmp "cursor", "sprites\ship_up_on.bmp"
    open "Main Menu" for graphics_nsb_nf as #main
8   print #main, "addsprite cursor cursor"
    print #main, "when mouseMove [mouseMotion]"
    print #main, "down"
    print #main, "trapclose [Quit]"
    'setup window
6   print #main, "flush"

    if ( MenuBackgroundLoaded$ = "") then
        loadbmp "menuBG", "backgrounds\menuBG.bmp"
        print #main, "background menuBG"
        print #main, "drawsprites"
        MenuBackgroundLoaded$ = "true"
    end if

    print #main, "background menuBG"
    print #main, "drawsprites"

    wait

    [Quit]
        fromMenu = 0
        playwave ""
        stopmidi
        timer 0
        close #main : end

    [resetMainMenu]
        shipX = MouseX
        shipY = MouseY
        goto 8
        wait

 [Game]
    close #main
    MouseMotion$ = "Off"
    useGameLabel = 1
    if music$ <> "" then
        playwave music$, loop
    else
        playmidi "SFX\music.mid", length
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

    loadbmp "ship_destroyed", "sprites\ship_destroyed.bmp"

    loadbmp "boost25+", "sprites\boost_25+.bmp"
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
    loadbmp "bulletone", "sprites\bullet1.bmp"
    loadbmp "bullettwo", "sprites\bullet2.bmp"
    loadbmp "bulletthree", "sprites\bullet3.bmp"
    loadbmp "bulletfour", "sprites\bullet4.bmp"
    loadbmp "bulletfive", "sprites\bullet5.bmp"
    loadbmp "bulletsix", "sprites\bullet6.bmp"
    loadbmp "bulletseven", "sprites\bullet7.bmp"
    loadbmp "bulleteight", "sprites\bullet8.bmp"
    loadbmp "bulletnine", "sprites\bullet9.bmp"
    loadbmp "bulletten","sprites\bullet10.bmp"
    menu #game, "&Options", "Change Background", [changeBackground],  "About", [About], "Menu", [mainMenuButtonClicked], "Change Music", [Music]
    menu #game, "&Change Background", "Change Background", [changeBackground]
    menu #game, "&About", "About", [About]
    menu #game, "&Menu", "Menu", [quitToMenu] 'mainMenuButtonClicked
    menu #game, "&Change Music", "Change Music", [Music]
    textbox #game.scorebox, 0, 0, 100, 50
    fromMenu = 0
    fromGame = 1
    statictext #game.score, "Score: ", 1, 0, 100, 50

    open "SpaceBlast v1.0a" for graphics_nsb_nf as #game
    print #game, "down"
    print #game, "font times_new_roman 12"
    gosub [Score]
    print #game, "trapclose [gameQuit]"
    running$ = "true"

    'start game?
    print #game, "background start"
    print #game, "drawsprites"
    notice "Ready to start?"
    gosub [Start]

    print #game, "addsprite ship ship_up ship_up_damage_1 ship_up_damage_2 ship_up_damage_3 ship_up_damage_4 ship_up_on ship_up_on_damage_1 ship_up_on_damage_2 ship_up_on_damage_3 ship_up_on_damage_4 ship_left ship_left_damage_1 ship_left_damage_2 ship_left_damage_3 ship_left_damage_4 ship_left_on ship_left_on_damage_1 ship_left_on_damage_2 ship_left_on_damage_3 ship_left_on_damage_4 ship_right ship_right_damage_1 ship_right_damage_2 ship_right_damage_3 ship_right_damage_4 ship_right_on ship_right_on_damage_1 ship_right_on_damage_2 ship_right_on_damage_3 ship_right_on_damage_4 ship_down ship_down_on ship_down_on_damage_1 ship_down_on_damage_2 ship_down_on_damage_3 ship_down_on_damage_4 ship_boost_left ship_boost_left_damage_1 ship_boost_left_damage_2 ship_boost_left_damage_3 ship_boost_left_damage_4 ship_boost_right ship_boost_right_damage_1 ship_boost_right_damage_2 ship_boost_right_damage_3 ship_boost_right_damage_4 ship_boost_down ship_boost_up ship_destroyed"
    print #game, "spritescale ship 250"
    print #game, "addsprite asteroid asteroid"
    print #game, "addsprite health health(0) health(1) health(2) health(3) health(4) health(5)"
    print #game, "addsprite boostbar boost25+ boost25 boost24 boost23 boost22 boost21 boost20 boost19 boost18 boost17 boost16 boost15 boost14 boost13 boost12 boost11 boost10 boost09 boost08 boost07 boost06 boost05 boost04 boost03 boost02 boost01 boost00"
    print newsprite$("bullet1", "bulletone")
    print newsprite$("bullet2", "bullettwo")
    print newsprite$("bullet3", "bulletthree")
    print newsprite$("bullet4", "bulletfour")
    print newsprite$("bullet5", "bulletfive")
    print newsprite$("bullet6", "bulletsix")
    print newsprite$("bullet7", "bulletseven")
    print newsprite$("bullet8", "bulleteight")
    print newsprite$("bullet9", "bulletnine")
    print newsprite$("bullet10", "bulletten")
    print #game, "spritescale health 500"
    print #game, "spritexy health "; DisplayWidth-150 ;" -40"
    print #game, "when characterInput [userInput]"
    print #game, "when leftButtonDown [shoot]"

    'load Background
    if (backgroundChanged$ = "true") then goto 3                'now game will always show the user chosen background
    loadbmp "bg", "backgrounds\space.bmp"
    print #game, "background bg"
    print #game, "drawsprites"

   'Variables:
    sprite$ = "bulletone"
    nextsprite = 1
    start = 1
    shipX = WindowWidth/2 - 100 ' ship x-pos
    shipY = WindowHeight - 120  ' ship y-pos
    shipSpeed = 50 'The ships speed
1   paused = 0
    velx = 0 ' asteroid X-Axis speed was 15.5 then was 7.5
    vely = 0 ' asteroid Y-Axis speed was 15.5 then was 7.5
    x = 100 ' asteroid x-pos was 1
    y = 40 ' asteroid y-pos was 1
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
    fromGame = 0

    print #game, "spritexy ship "; shipX; " "; shipY
    print #game, "drawsprites"
    scan
    gosub [loadShip]
    if resized = 1 then
        WindowWidth = width
        WindowHeight = height
    end if
    timer 100,  [timeTicked] 'was at 56
    wait

    [gameQuit]

        timer 0
        confirm "Do you really want to quit?";quit$
        if quit$ = "yes" then
            start = 0
            fromGame = 0
            notice "Game Over!" + Chr$(13) + " Your final score is: ";score
            playwave ""
            stopmidi
4           close #game : end  'if your out of health you come here and the game ends
        end if
        if quit$ = "no" then
            goto  1 ' goto line labeled "1"
        end if
        wait

    [quitToMenu]
    if paused = 1 then
        if savingMode$ = "On" then
            confirm "Are you sure you want to leave? Y/N?";GTMenu$
            if GTMenu$ = "yes" then
                start = 0
                fromGame = 0
                confirm "Would you like to save your game?( you can currently only resume while the game is open ) Y/N?";asksave$
                if asksave$ = "yes" then
                    goto [Save]
                end if
            end if

            if asksave$ = "no" then
                notice "Leaving to menu..."
                goto [MainMenu]
            end if

            if GTMenu$ = "no" then
                goto 1
            end if

        else
            notice "Leaving to menu..."
            goto [MainMenu]
        end if
    else
        BEEP
        notice "Pause the game first!"
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
        healthposX = DisplayWidth - 150
        health = 5
        if useGameLabel = 1 then
            print #game, "spriteimage health health("; health; ")"
            print #game, "spritescale health 500"
            print #game, "spritexy health ";healthposX; " -40"
            print #game, "drawsprites"
            gotHealth = 1
            firstAddedHealth = 1
        end if
        goto [Health]

        [Health]
            if useGameLabel = 1 then
                print #game, "spriteimage health health("; health; ")"
                print #game, "spritescale health 500"
                print #game, "spritexy health ";healthposX; " -40"
                print #game, "drawsprites"
            end if

           if health <= 0 then
                health = 0
                if useGameLabel = 1 then
                    playwave, "SFX\explode.wav", async
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "background gameover"
                    print #game, "drawsprites"
                    notice "Game Over!" + Chr$(13) + "Better Luck next time! Your final score is: ";score
                    print #game, "drawsprites"
                    goto 4
                end if
           end if

            if firstAddedHealth = 1 then
                firstAddedHealth = 0
                goto [timeTicked]
            else
                return
            end if

    [timeTicked]
        if WindowWidth = 0 then WindowWidth = width
        if WindowHeight = 0 then WindowHeight = height

        if WindowWidth = 0 then WindowWidth = DisplayWidth
        if WindowHeight = 0 then WindowHeight = DisplayHeight

        if paused = 0 then
            bulletX = shipX
            bulletY = shipY
            if gotHealth = 0 then
                gosub [loadHealth]
            end if
            if useGameLabel = 1 then
                gosub [Health] 'Refresh health bar
                gosub [Score] 'Refresh score bar
                gosub [loadAsteroids] 'Refresh asteroids
                gosub [loadBullet] 'Refresh and render bullets
                gosub [CollisionDetection] 'check for collision detection
            else
                useGameLabel = 1
                goto [Game]
            end if

           char$ = ""
        end if
    wait

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
            shipY = shipY - shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_up_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "up"
            char$ = ""
        end if

         if char$ = "W" then                                    'if Caps Lock is on
             shipY = shipY - shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

             moving$ = "up"
             char$ = ""
         end if

        if char$ = "a" then
                shipX = shipX - shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if
            moving$ = "left"
            char$ = ""
        end if

        if char$ = "A" then
                shipX = shipX - shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "left"
            char$ = ""
        end if

        if char$ = "s" then
                shipY = shipY + shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "down"
            char$ = ""
        end if


        if char$ = "S" then
                shipY = shipY + shipSpeed                              'if Caps Lock is on
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "down"
            char$ = ""
        end if

        if char$ = "d" then
                shipX = shipX + shipSpeed
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "right"
            char$ = ""
        end if

        if char$ = "D" then
                shipX = shipX + shipSpeed                         'if Caps Lock is on
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

                if health <= 0 then
                    print #game, "spriteimage ship ship_destroyed"
                    print #game, "drawsprites"
                end if

            moving$ = "right"
            char$ = ""
        end if

        if char$ = "p" then
            goto [Pause]
        end if

        if char$ = "P" then
            goto [Pause]
        end if

        if char$ = "m" then
            goto [toggleMusic]
        end if

        if char$ = "M" then
            goto [toggleMusic]
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
            boost = boost + 10 ' 10 boost 25 max is the most with a personal sprite

            boostLoaded = 1
        end if

        if boost <> 0 then

            if boost > 25 then
                print #game, "spriteimage boostbar boost25+"
                print #game, "drawsprites"
                boost = boost - 1
                goto 7
            end if

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
        x = int(rnd(1)* DisplayWidth-70)
        y = int(rnd(1)* DisplayHeight-70)
        if loadedAsteroid$<>"true" then
            print #game, "spritevisible asteroid on"
            print #game, "spriteimage asteroid asteroid"
            print #game, "spritexy asteroid ";x;" ";y
            print #game, "drawsprites"
            loadedAsteroid$ = "true"
            direction = int(rnd(1) * 4) ' 1=up 2=left 3=right 4=down
        end if
        if loadedAsteroid$ = "true" then
            if direction = 1 then
                print #game, "spriteimage asteroid asteroid"
                print #game, "spritemovexy asteroid 0 -5"  'was"; x+velx; " "; y+vely
                print #game, "drawsprites"
                print "direction: up"
            end if

            if direction = 2 then
                print #game, "spriteimage asteroid asteroid"
                print #game, "spritemovexy asteroid -5 0"
                print #game, "drawsprites"
                print "direction: left"
            end if

            if direction = 3 then
                print #game, "spriteimage asteroid asteroid"
                print #game, "spritemovexy asteroid 0 5"
                print #game, "drawsprites"
                print "direction: down"
            end if

            if direction = 4 then
                print #game, "spriteimage asteroid asteroid"
                print #game, "spritemovexy asteroid 5 0"
                print #game, "drawsprites"
                print "direction: right"
            end if

        end if

        print "AsteroidX: ";x ;" AsteroidY: ";y
        print "ShipX: ";shipX ;" ShipY: ";shipY
        print ""

        print #game, "spritexy? asteroid asteroidx asteroidy"
        if asteroidx > DisplayWidth then
            loadedAsteroid$ = "false"
        end if

        if asteroidx < 0 then
            loadedAsteroid$ = "false"
        end if

        if asteroidy > DisplayHeight then
            loadedAsteroid$ = "false"
        end if

        if asteroidy < 0 then
            loadedAsteroid$ = "false"
        end if
        print #game, "drawsprites"
        return

    [changeMenuBackground]
        filedialog "Open Bitmap Image", "backgrounds/*.bmp", UserMenuBGimage$
        if (UserMenuBGimage$ = "") then
            notice "Background change aborted by user."
            goto 6
        end if
        MenuBackgroundLoaded$ = UserMenuBGimage$
        MenuBackgroundChanged$ = "true"
        loadbmp "menuBG",  UserMenuBGimage$
        print #main, "background menuBG"
        print #main, "drawsprites"
        MenuBackgroundChanged$ = "true"
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
    if moving$ = "up" then
        if B1$="loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritemovexy bullet1 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if

        if B2$="loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritemovexy bullet2 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B3$="loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritemovexy bullet3 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B4$="loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritemovexy bullet4 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B5$="loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritemovexy bullet5 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B6$="loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritemovexy bullet6 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B7$="loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritemovexy bullet7 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B8$="loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritemovexy bullet8 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B9$="loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritemovexy bullet9 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B10$="loaded" then
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritemovexy bullet10 0 -5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if
    end if

    if moving$ = "left" then
        if B1$="loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritemovexy bullet1 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if

        if B2$="loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritemovexy bullet2 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B3$="loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritemovexy bullet3 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B4$="loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritemovexy bullet4 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B5$="loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritemovexy bullet5 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B6$="loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritemovexy bullet6 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B7$="loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritemovexy bullet7 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B8$="loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritemovexy bullet8 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B9$="loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritemovexy bullet9 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B10$="loaded" then
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritemovexy bullet10 -5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if
    end if

    if moving$ = "down" then
        if B1$="loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritemovexy bullet1 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if

        if B2$="loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritemovexy bullet2 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B3$="loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritemovexy bullet3 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B4$="loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritemovexy bullet4 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B5$="loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritemovexy bullet5 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B6$="loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritemovexy bullet6 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B7$="loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritemovexy bullet7 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B8$="loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritemovexy bullet8 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B9$="loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritemovexy bullet9 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B10$="loaded" then
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritemovexy bullet10 0 5"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if
    end if

    if moving$ = "right" then
        if B1$="loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritemovexy bullet1 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if

        if B2$="loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritemovexy bullet2 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B3$="loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritemovexy bullet3 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B4$="loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritemovexy bullet4 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B5$="loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritemovexy bullet5 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B6$="loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritemovexy bullet6 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B7$="loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritemovexy bullet7 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B8$="loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritemovexy bullet8 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B9$="loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritemovexy bullet9 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if


        if B10$="loaded" then
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritemovexy bullet10 5 0"
                print #game, "drawsprites"
                B1$ = ""
                B2$ = ""
                B3$ = ""
                B4$ = ""
                B5$ = ""
                B6$ = ""
                B7$ = ""
                B8$ = ""
                B9$ = ""
                B10$ = ""
        end if
    end if
    return

    [shoot]
    playwave "SFX\shoot.wav", async
    if moving$ = "up" then
        if sprite$ = "bulletten" then'
            if B10$<>"loaded" then    '
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritexy bullet10 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B10$ = "loaded"        '
            end if
            sprite$ = "bulletone"       '
            gosub [loadBullet]
        end if

        if sprite$ = "bulletnine" then
            if B9$<>"loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritexy bullet9 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B9$ = "loaded"
            end if
            sprite$ = "bulletten"
        end if

        if sprite$ = "bulleteight" then
            if B8$<>"loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritexy bullet8 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B8$ = "loaded"
            end if
            sprite$ = "bulletnine"
        end if

        if sprite$ = "bulletseven" then
            if B7$<>"loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritexy bullet7 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B7$ = "loaded"
            end if
            sprite$ = "bulleteight"
        end if

        if sprite$ = "bulletsix" then
            if B6$<>"loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritexy bullet6 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B6$ = "loaded"
            end if
            sprite$ = "bulletseven"
        end if

        if sprite$ = "bulletfive" then
            if B5$<>"loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritexy bullet5 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B5$ = "loaded"
            end if
            sprite$ = "bulletsix"
        end if

        if sprite$ = "bulletfour" then
            if B4$<>"loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritexy bullet4 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B4$ = "loaded"
            end if
            sprite$ = "bulletfive"
        end if

        if sprite$ = "bulletthree" then
            if B3$<>"loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritexy bullet3 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B3$ = "loaded"
            end if
            sprite$ = "bulletfour"
        end if

        if sprite$ = "bullettwo" then
            if B2$<>"loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritexy bullet2 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B2$ = "loaded"
            end if
            sprite$ = "bulletthree"
        end if

        if sprite$ = "bulletone" then
            if B1$<>"loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritexy bullet1 ";bulletX+24; " ";bulletY-10
                print #game, "drawsprites"
                B1$ = "loaded"
            end if
            sprite$ = "bullettwo"
        end if
    end if

    if moving$ = "left" then
        if sprite$ = "bulletten" then'
            if B10$<>"loaded" then    '
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritexy bullet10 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B10$ = "loaded"
            end if
            sprite$ = "bulletone"
            goto [loadBullet]
        end if

        if sprite$ = "bulletnine" then
            if B9$<>"loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritexy bullet9 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B9$ = "loaded"
            end if
            sprite$ = "bulletten"
        end if

        if sprite$ = "bulleteight" then
            if B8$<>"loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritexy bullet8 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B8$ = "loaded"
            end if
            sprite$ = "bulletnine"
        end if

        if sprite$ = "bulletseven" then
            if B7$<>"loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritexy bullet7 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B7$ = "loaded"
            end if
            sprite$ = "bulleteight"
        end if

        if sprite$ = "bulletsix" then
            if B6$<>"loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritexy bullet6 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B6$ = "loaded"
            end if
            sprite$ = "bulletseven"
        end if

        if sprite$ = "bulletfive" then
            if B5$<>"loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritexy bullet5 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B5$ = "loaded"
            end if
            sprite$ = "bulletsix"
        end if

        if sprite$ = "bulletfour" then
            if B4$<>"loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritexy bullet4 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B4$ = "loaded"
            end if
            sprite$ = "bulletfive"
        end if

        if sprite$ = "bulletthree" then
            if B3$<>"loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritexy bullet3 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B3$ = "loaded"
            end if
            sprite$ = "bulletfour"
        end if

        if sprite$ = "bullettwo" then
            if B2$<>"loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritexy bullet2 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B2$ = "loaded"
            end if
            sprite$ = "bulletthree"
        end if

        if sprite$ = "bulletone" then
            if B1$<>"loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritexy bullet1 ";bulletX-5; " ";bulletY+18
                print #game, "drawsprites"
                B1$ = "loaded"
            end if
            sprite$ = "bullettwo"
        end if
    end if

    if moving$ = "down" then
        if sprite$ = "bulletten" then'
            if B10$<>"loaded" then    '
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritexy bullet10 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B10$ = "loaded"
            end if
            sprite$ = "bulletone"
            goto [loadBullet]
        end if

        if sprite$ = "bulletnine" then
            if B9$<>"loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritexy bullet9 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B9$ = "loaded"
            end if
            sprite$ = "bulletten"
        end if

        if sprite$ = "bulleteight" then
            if B8$<>"loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritexy bullet8 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B8$ = "loaded"
            end if
            sprite$ = "bulletnine"
        end if

        if sprite$ = "bulletseven" then
            if B7$<>"loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritexy bullet7 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B7$ = "loaded"
            end if
            sprite$ = "bulleteight"
        end if

        if sprite$ = "bulletsix" then
            if B6$<>"loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritexy bullet6 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B6$ = "loaded"
            end if
            sprite$ = "bulletseven"
        end if

        if sprite$ = "bulletfive" then
            if B5$<>"loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritexy bullet5 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B5$ = "loaded"
            end if
            sprite$ = "bulletsix"
        end if

        if sprite$ = "bulletfour" then
            if B4$<>"loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritexy bullet4 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B4$ = "loaded"
            end if
            sprite$ = "bulletfive"
        end if

        if sprite$ = "bulletthree" then
            if B3$<>"loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritexy bullet3 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B3$ = "loaded"
            end if
            sprite$ = "bulletfour"
        end if

        if sprite$ = "bullettwo" then
            if B2$<>"loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritexy bullet2 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B2$ = "loaded"
            end if
            sprite$ = "bulletthree"
        end if

        if sprite$ = "bulletone" then
            if B1$<>"loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritexy bullet1 ";bulletX+22; " ";bulletY+50
                print #game, "drawsprites"
                B1$ = "loaded"
            end if
            sprite$ = "bullettwo"
        end if
    end if

    if moving$ = "right" then
        if sprite$ = "bulletten" then'
            if B10$<>"loaded" then    '
                print #game, "spriteimage bullet10 bulletten"
                print #game, "spritexy bullet10 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B10$ = "loaded"
            end if
            sprite$ = "bulletone"
            goto [loadBullet]
        end if

        if sprite$ = "bulletnine" then
            if B9$<>"loaded" then
                print #game, "spriteimage bullet9 bulletnine"
                print #game, "spritexy bullet9 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B9$ = "loaded"
            end if
            sprite$ = "bulletten"
        end if

        if sprite$ = "bulleteight" then
            if B8$<>"loaded" then
                print #game, "spriteimage bullet8 bulleteight"
                print #game, "spritexy bullet8 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B8$ = "loaded"
            end if
            sprite$ = "bulletnine"
        end if

        if sprite$ = "bulletseven" then
            if B7$<>"loaded" then
                print #game, "spriteimage bullet7 bulletseven"
                print #game, "spritexy bullet7 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B7$ = "loaded"
            end if
            sprite$ = "bulleteight"
        end if

        if sprite$ = "bulletsix" then
            if B6$<>"loaded" then
                print #game, "spriteimage bullet6 bulletsix"
                print #game, "spritexy bullet6 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B6$ = "loaded"
            end if
            sprite$ = "bulletseven"
        end if

        if sprite$ = "bulletfive" then
            if B5$<>"loaded" then
                print #game, "spriteimage bullet5 bulletfive"
                print #game, "spritexy bullet5 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B5$ = "loaded"
            end if
            sprite$ = "bulletsix"
        end if

        if sprite$ = "bulletfour" then
            if B4$<>"loaded" then
                print #game, "spriteimage bullet4 bulletfour"
                print #game, "spritexy bullet4 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B4$ = "loaded"
            end if
            sprite$ = "bulletfive"
        end if

        if sprite$ = "bulletthree" then
            if B3$<>"loaded" then
                print #game, "spriteimage bullet3 bulletthree"
                print #game, "spritexy bullet3 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B3$ = "loaded"
            end if
            sprite$ = "bulletfour"
        end if

        if sprite$ = "bullettwo" then
            if B2$<>"loaded" then
                print #game, "spriteimage bullet2 bullettwo"
                print #game, "spritexy bullet2 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B2$ = "loaded"
            end if
            sprite$ = "bulletthree"
        end if

        if sprite$ = "bulletone" then
            if B1$<>"loaded" then
                print #game, "spriteimage bullet1 bulletone"
                print #game, "spritexy bullet1 ";bulletX+53; " ";bulletY+22
                print #game, "drawsprites"
                B1$ = "loaded"
            end if
            sprite$ = "bullettwo"
        end if
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
    open "SaveFiles/save.save" for output as #save
    print #save, "shipX: ";shipX
    print #save, "shipY: ";shipY
    print #save, "bulletX: ";bulletX
    print #save, "bulletY: ";bulletY
    print #save, "velx: ";velx
    print #save, "vely: ";vely
    print #save, "x: ";x
    print #save, "y: ";y
    close #save
    notice "Save successful!"
    notice "Leaving to menu..."
    goto [MainMenu]

[Load]
    if paused = 0 then 'i changed the 1 to a zero on 11/27/13
        filedialog "choose a .save to load", "SaveFiles\*.save",savefile$
            if savefile$ <> "" then
                open savefile$ for random as #load LEN=76


            else
                notice "Load Aborted!"
                BEEP
            end if
    end if
    SavedGame = 0

[mouseMotion]
    if MouseMotion$ = "On" then
        shipX = MouseX
        shipY = MouseY
        print #main, "spritexy cursor ";shipX; " ";shipY
        print #main, "drawsprites"
        goto 6 'continue
    else
        useGameLabel = 1
        goto [timeTicked]
    end if


[Score]
    print #game.score, "!enable"
    print #game.score, "Score: ";score
    print #game, "drawsprites"
    return

[changeWindowSize]
    'back up the previous values early in case of error
    TempWidth = WindowWidth
    TempHeight = WindowHeight
    if resize = 0 then
        newwidth = 500
        newheight = 500
    end if
    WindowWidth = 500
    WindowHeight = 500

    confirm "You want to change the window/display size";anwser$
    if anwser$ = "yes" then

        WindowWidth = 500
        WindowHeight = 250

        statictext #window, "X-Position", 135, 38, 100, 30
        textbox #window.xpos, 150, 80, 30, 55
        statictext #window, "Y-Position", 255, 38, 100, 30
        textbox #window.ypos, 270, 80, 30, 55
        loadbmp "WindowResizeBackground", "backgrounds\window_resize_background.bmp"
        button #window, "RESIZE", [windowResize], UL, 195, 100, 50, 150

        open "Window Resize" for graphics_nsb_nf AS #window
        print #window, "down"
        print #window, "font times_new_roman 14 bold"
        print #window, "flush"
        print #window, "trapclose [windowQuit]"
    end if
    wait


[windowQuit]
    fromMenu = 0
    fromGame = 0
    close #window
    wait

[windowResize]
    print #window.xpos, "!contents? ";newwidthr$
    print #window.ypos, "!contents? ";newheightr$

    width = val(newwidthr$)
    height = val(newheightr$)

    WindowWidth = width
    WindowHeight = height

    notice "Window Resize Complete!"
    resized = 1

    'if there was an error
    if WindowWidth = 0 then
        if WindowHeight = 0 then
           WindowHeight = TempHeight
           WindowWidth = TempWidth
        end if
    end if

    if WindowHeight = 0 then
        if WindowWidth = 0 then
            WindowWidth = TempWidth
            WindowHeight = TempHeight
        end if
    end if

    goto [windowQuit]
    wait

[changeCursor]
    if cursorChanged = 1 then
        print ChangeCursor(cursor$)
        print ChangeCursor(cursor$)
    end if
    wait



[startCheatCodeValidator]
    textbox #cheat.code, 0, 0, WindowWidth, 300
    button #cheat.validate, "Validate", [cheatCodeValidator], LL, 0, 400, WindowWidth, 600
    open "Cheat code test" for graphics_nsb_nf as #cheat
    print #cheat, "trapclose [closeCheatCodeWindow]"
    wait

[clearCode]
    print #cheat.code, "!enable"
    print #cheat.code, "!selectall"
    print #cheat.code, "!Cls"
    wait

[cheatCodeValidator]
    print #cheat.code, "!contents? code$"

    select case code$
        case "XYZ"
            gosub [checkCode]
            if codeValid$ = "true" then
                if codeXYZ$ <> "used" then
                    boost = boost + 10
                    print boost
                    print #cheat.code, " -- Code Valid! -- , plus 10 boost!"
                end if
            codeXYZ$ = "used"
            end if

        case "1x349B"
            gosub [checkCode]
            if codeValid$ = "true" then
                if code1x349B$ <> "used" then
                    lives = lives + 1
                    print lives
                    print #cheat.code, " -- Code Valid! -- , +1 health"
                end if
            code1x349B$ = "used"
            end if

        case "4949258"
            gosub [checkCode]
            if codeValid$ = "true" then
                if code4949258$ <> "used" then
                    score = score + 10
                    print score
                    print #cheat.code, " -- Code Valid! -- , extra 10 points *dont tell anyone B)*"
                end if
            code4949258$ = "used"
            end if
        'add new codes here

        case else
            print #cheat.code," -- Code Invalid! -- "
    end select
    codeValid$ = ""
    wait

[checkCode]
    codeIdentity$ = "code"; "";code$; "$"
    open "codeslog.txt" for APPEND as #getcodes
    if codenum > 1 then
        if instr(entries, " --*") <> 0 then
            print #getcodes, ""
        end if
    else
        if codenum <= 1 then
            print #getcodes, ""
            print #getcodes, "---------- ";date$() ;": "; time$(); "----------"
        end if
    end if


    print #getcodes, codenum; ". -- ";code$ ;" --*"
    close #getcodes

        if codeIdentity$ = "used" then
            codeValid$ = "false"
        else
            codeValid$ = "true"
            codenum = codenum + 1
        end if
    return

[closeCheatCodeWindow]
    close #cheat : wait

[CollisionDetection]
    'Ship to Asteroids
    print #game, "spritecollides ship ";
    input #game, shipcollides$
    if shipcollides$ = "asteroid" then
        playwave "SFX\damage.wav", async
        print "Hit! -1 health"
        health = health - 1
        print #game, "spritevisible asteroid off"
        print #game, "drawsprites"
        shipcollides$ = ""
    end if

    'Bullet to Asteroids
    for i = 1 to 10
        print #game, "spritecollides bullet";i
        input #game, bulletcollides$
        if bulletcollides$ = "asteroid" then
            print #game, "spritevisible asteroid off"
            playwave "SFX\score.wav", async
            print "Good shot! +1 point!"
            score = score + 1
            loadedAsteroid$ = "false"
            bulletcollides$ = ""
        end if
    next
    return

[Music]
    if music$ <> "" then
        confirm "would you like to change the music back to the default track?";musicbacktodefault$
        if musicbacktodefault$ = "yes" then
            music$ = ""
            playwave "SFX\music.wav"
            musicState$ = "On"
        else
            goto 5
        end if
    else
5       filedialog "Open a .wav file to play", "music\*.wav", music$
        if music$ = "" then
            notice "music change aborted!"
        else
            playwave music$, loop
        end if
    musicState$ = "On"
    end if

[toggleMusic]
    if musicState$ = "" then
        musicState$ = "Off"
    end if

    if musicState$ = "On" then
        musicState$ = "Off"
        playwave ""
        goto [timeTicked]
    end if

    if musicState$ = "Off" then
        musicState$ = "On"
        if music$ <> "" then
            playwave music$, loop
        else
            playwave "SFX\music.wav", loop
        end if
    end if

    wait

'functions
'-----------------------

function score(addpoints, subtractpoints)
    score = score + addpoints
    score = score - subtractpoints
end function

function window(width, height)
    WindowWidth = width
    WindowHeight = height
end function

function ChangeCursor(cursor$)
    filedialog "Open new cursor", "cursors/*.bmp",cursordir$
    if (cursordir$ = "") then
        notice "cursor change aborted by user."
    end if
    loadbmp cursor$, cursordir$
    print #main, "drawsprites"
end function

function newsprite$(spritename$, spritebmp$)
    print #game, "addsprite ";spritename$;" ";spritebmp$
end function


