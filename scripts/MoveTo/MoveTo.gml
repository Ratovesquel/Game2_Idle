
function MoveTo(toX, toY, spd) {
    
    move_towards_point(toX, toY, spd);

    return point_distance(x, y, toX, toY) <= spd;
}
