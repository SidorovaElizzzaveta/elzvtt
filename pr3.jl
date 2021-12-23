function all_field_is_marked(r::Robot)
    vert = moves!(r, Sud)
    hor = moves!(r, West)
    mark_all!(r)
    while isborder(r,West)==0
        move!(r,West)
    end
    moves!(r, Nord, vert)
    moves!(r, Ost, hor)
end
function mark_all!(r::Robot)
    marktoborder!(r, Nord)
    if(!isborder(r, Ost))
        move!(r, Ost)
        marktoborder!(r, Sud)
        if(!isborder(r, Ost))
            move!(r, Ost)
            mark_all!(r)
        end
    end
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
function moves!(r::Robot,side::HorizonSide)
    steps=0
    while isborder(r,side)==false
        move!(r,side)
        steps+=1
    end
    return steps
end

function moves!(r::Robot,side::HorizonSide,steps::Int)
    for _ in 1:steps
        move!(r,side)
    end
end
