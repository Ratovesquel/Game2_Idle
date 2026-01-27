function MoveTo(toX, toY, spd){

    if (x < toX-spd) x+= spd;
    else if (x > toX+spd) x-= spd;

    if (y < toY) y+= spd;
    else if (y > toY) y-= spd;

    return point_distance(x, y, toX, toY) <= spd;
}


//function MoveTo(toX, toY) {
    
//    move_towards_point(toX, toY, spd);

//    return point_distance(x, y, toX, toY) <= spd;
//}
