function gotobegin!(r)
    gotoborder!(r, West)
    gotoborder!(r, Sud)
end
function gotoborder!(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function marktoborder!(r, side)
    while(!isborder(r, side))
        putmarker!(r)
        move!(r, side)
    end
    putmarker!(r)
end
function marktoborder_with_exceptions!(r, counter)
    gotoborder!(r, Ost)
    while(counter > 0)
        move!(r, West)
        counter = counter - 1
    end
    marktoborder!(r, West)
end
function main(r::Robot)
    vert = moves!(r, Sud)
    hor = moves!(r, West)
    counter = 0
    while(!isborder(r, Nord))
        marktoborder_with_exceptions!(r, counter)
        counter = counter + 1
        move!(r, Nord)
    end
    marktoborder_with_exceptions!(r, counter)
    while isborder(r,Sud)==0
        move!(r,Sud)
    end
    moves!(r, Nord, vert)
    moves!(r, Ost, hor)
end