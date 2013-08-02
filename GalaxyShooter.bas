'GalaxyShooter v1.0a
'By: Mallot1 and rawelja
'(C) 2013

    NOMAINWIN

    WindowWidth = DisplayWidth
    WindowHeight = DisplayHeight

    open "SpaceShooter v1.0a" for graphics_nsb_nf as #1
    print #1, "trapclose [quit]"
    wait

[quit]
    close #1
    end
