function gotobegin!(r)
    gotoborder!(r, West)
    gotoborder!(r, Sud)
    if(!(isborder(r, West) & isborder(r, Sud)))
        gotobegin!(r)
    end
end
function gotoborder!(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function seek(r)
    while(!isborder(r, Nord))
        if(!isborder(r, Ost))
            move!(r, Ost)
        else
            gotoborder!(r, West)
            move!(r, Nord)
        end
    end
end
function mark(r)
    while(isborder(r, Nord))
        putmarker!(r)
        move!(r, Ost)
    end
    putmarker!(r)
    move!(r, Nord)

    while(isborder(r, West))
        putmarker!(r)
        move!(r, Nord)
    end
    putmarker!(r)
    move!(r, West)

    while(isborder(r, Sud))
        putmarker!(r)
        move!(r, West)
    end
    putmarker!(r)
    move!(r, Sud)

    while(isborder(r, Ost))
        putmarker!(r)
        move!(r, Sud)
    end
    putmarker!(r)
    move!(r, Sud)


end
function main2(r)
    gotobegin!(r)
    seek(r)
    mark(r)
    gotobegin!(r)
end
