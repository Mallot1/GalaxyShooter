

loadbmp "ship", "sprites\ship_up.bmp"
loadbmp "bullet", "sprites\bullet1.bmp"

open "multiple pizza throwing exercise" for graphics_nsb_nf as #game

    #game "trapclose [quit]"

    #game "addsprite ship ship"
    #game "spritexy ship -30 280"
    #game "spritemovexy ship 2 0"

    #game "setfocus"
    #game "when characterInput [key]"

    timer 56, [time]
wait

[time]
    'wrap up the land
    #game "spritexy? ship x y"
    if x >310 then #game "spritexy ship -30 280"

    #game "drawsprites"
    #game "place 0 0"
    #game "\\sprWeap";wNum

wait

[key]
    if Inkey$ <>" " then wait   'only space will do
    'and it should throw pizza!
    #game "spritexy? ship x y"
'print sprWeap";wNum
    #game "addsprite sprWeap";wNum;" weapon"
    #game "spritexy sprWeap";wNum;" ";x;" 260"
    #game "spritemovexy sprWeap";wNum;" 0 -3"
    wNum=wNum+1

wait

[quit]
    timer 0
    close #game
    unloadbmp "ship"
    unloadbmp "bullet"

