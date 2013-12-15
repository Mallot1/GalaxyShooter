NOMAINWIN

WindowWidth = 640
WindowHeight = 480

UpperLeftX = 300
UpperLeftY = 100

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
loadbmp "ship", "sprites\ship_up_on.bmp"
open "Shooting" for graphics_nsb_nf AS #shoot
sprite$ = "bulletone"
nextsprite = 1
print #shoot, "when leftButtonDown [shoot]"
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
print #shoot, "trapclose [quit]"
timer 100, [timeTicked]
wait

[timeTicked]
    gosub [loadBullet]
    wait

[shoot]

    print #shoot, "addsprite ship ship"
    print #shoot, "spriteimage ship ship"
    print #shoot, "spritexy ship 310 420"
    print #shoot, "drawsprites"

    if sprite$ = "bulletten" then'
        if B10$<>"loaded" then    '
            print #shoot, "spriteimage bullet10 bulletten"
            print #shoot, "spritexy bullet10 310 410"
            print #shoot, "drawsprites"
            B10$ = "loaded"        '
        end if
        sprite$ = "bulletone"
        goto [loadBullet]
    end if

    if sprite$ = "bulletnine" then
        if B9$<>"loaded" then
            print #shoot, "spriteimage bullet9 bulletnine"
            print #shoot, "spritexy bullet9 310 410"
            print #shoot, "drawsprites"
            B9$ = "loaded"
        end if
        sprite$ = "bulletten"
    end if

    if sprite$ = "bulleteight" then
        if B8$<>"loaded" then
            print #shoot, "spriteimage bullet8 bulleteight"
            print #shoot, "spritexy bullet8 310 410"
            print #shoot, "drawsprites"
            B8$ = "loaded"
        end if
        sprite$ = "bulletnine"
    end if

    if sprite$ = "bulletseven" then
        if B7$<>"loaded" then
            print #shoot, "spriteimage bullet7 bulletseven"
            print #shoot, "spritexy bullet7 310 410"
            print #shoot, "drawsprites"
            B7$ = "loaded"
        end if
        sprite$ = "bulleteight"
    end if

    if sprite$ = "bulletsix" then
        if B6$<>"loaded" then
            print #shoot, "spriteimage bullet6 bulletsix"
            print #shoot, "spritexy bullet6 310 410"
            print #shoot, "drawsprites"
            B6$ = "loaded"
        end if
        sprite$ = "bulletseven"
    end if

    if sprite$ = "bulletfive" then
        if B5$<>"loaded" then
            print #shoot, "spriteimage bullet5 bulletfive"
            print #shoot, "spritexy bullet5 310 410"
            print #shoot, "drawsprites"
            B5$ = "loaded"
        end if
        sprite$ = "bulletsix"
    end if

    if sprite$ = "bulletfour" then
        if B4$<>"loaded" then
            print #shoot, "spriteimage bullet4 bulletfour"
            print #shoot, "spritexy bullet4 310 410"
            print #shoot, "drawsprites"
            B4$ = "loaded"
        end if
        sprite$ = "bulletfive"
    end if

    if sprite$ = "bulletthree" then
        if B3$<>"loaded" then
            print #shoot, "spriteimage bullet3 bulletthree"
            print #shoot, "spritexy bullet3 310 410"
            print #shoot, "drawsprites"
            B3$ = "loaded"
        end if
        sprite$ = "bulletfour"
    end if

    if sprite$ = "bullettwo" then
        if B2$<>"loaded" then
            print #shoot, "spriteimage bullet2 bullettwo"
            print #shoot, "spritexy bullet2 310 410"
            print #shoot, "drawsprites"
            B2$ = "loaded"
        end if
        sprite$ = "bulletthree"
    end if

    if sprite$ = "bulletone" then
        if B1$<>"loaded" then
            print #shoot, "spriteimage bullet1 bulletone"
            print #shoot, "spritexy bullet1 310 410"
            print #shoot, "drawsprites"
            B1$ = "loaded"
        end if
        sprite$ = "bullettwo"
    end if
    bullets = bullets + 1

    statictext #shoot, "Bullets: ";bullets, 50, 50, 100, 30
    print #shoot, "flush"
    wait

[loadBullet]'*its in!
    if B1$="loaded" then
            print #shoot, "spriteimage bullet1 bulletone"
            print #shoot, "spritemovexy bullet1 0 -10"
            print #shoot, "drawsprites"
            B10$ = ""
    end if

    if B2$="loaded" then
            print #shoot, "spriteimage bullet2 bullettwo"
            print #shoot, "spritemovexy bullet2 0 -10"
            print #shoot, "drawsprites"
            B1$ = ""
    end if


    if B3$="loaded" then
            print #shoot, "spriteimage bullet3 bulletthree"
            print #shoot, "spritemovexy bullet3 0 -10"
            print #shoot, "drawsprites"
            B2$ = ""
    end if


    if B4$="loaded" then
            print #shoot, "spriteimage bullet4 bulletfour"
            print #shoot, "spritemovexy bullet4 0 -10"
            print #shoot, "drawsprites"
            B3$ = ""
    end if


    if B5$="loaded" then
            print #shoot, "spriteimage bullet5 bulletfive"
            print #shoot, "spritemovexy bullet5 0 -10"
            print #shoot, "drawsprites"
            B4$ = ""
    end if


    if B6$="loaded" then
            print #shoot, "spriteimage bullet6 bulletsix"
            print #shoot, "spritemovexy bullet6 0 -10"
            print #shoot, "drawsprites"
            B5$ = ""
    end if


    if B7$="loaded" then
            print #shoot, "spriteimage bullet7 bulletseven"
            print #shoot, "spritemovexy bullet7 0 -10"
            print #shoot, "drawsprites"
            B4$ = ""
    end if


    if B8$="loaded" then
            print #shoot, "spriteimage bullet8 bulleteight"
            print #shoot, "spritemovexy bullet8 0 -10"
            print #shoot, "drawsprites"
            B3$ = ""
    end if


    if B9$="loaded" then
            print #shoot, "spriteimage bullet9 bulletnine"
            print #shoot, "spritemovexy bullet9 0 -10"
            print #shoot, "drawsprites"
            B2$ = ""
    end if


    if B10$="loaded" then
            print #shoot, "spriteimage bullet10 bulletten"
            print #shoot, "spritemovexy bullet10 0 -10"
            print #shoot, "drawsprites"
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
    wait

[quit]'*its in!
    close #shoot : end

'*Its in!
function newsprite$(spritename$, spritebmp$)
    print #shoot, "addsprite ";spritename$;" ";spritebmp$
end function
