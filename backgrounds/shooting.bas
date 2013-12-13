'NOMAINWIN

WindowWidth = DisplayWidth
WindowHeight = DisplayHeight
loadbmp "bullet", "Sprites\bullet1.bmp"
loadbmp "ship", "Sprites\ship_up_on.bmp"
open "Shooting Test" for graphics_nsb_nf AS #game
print #game, "when leftButtonDown [Shoot]"
print #game, "when characterInput [userInput]"
print #game, "trapclose [quit]"
print #game, "addsprite ship ship"
print #game, "drawsprites"
wait

[Shoot]
print #game, "addsprite bullet bullet"
print #game, "spritemovexy bullet 10 0"
print #game, "drawsprites"
wait

[userInput]
char$ = InKey$
if char$ = "W" then
    moving$ = "up"
end if            

if char$ = "a" then
    moving$ = "left"
end if

if char$ = "s" then
    moving$ = "down"
end if
if char$ = "d" then
    moving$ = "right"
end if
print moving$
print "j"
wait

[quit]
close #game
end
