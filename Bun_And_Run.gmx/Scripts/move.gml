///move(collision_object)
var collision_object = argument0;

if (!place_meeting(x, y+1, obj_solid)) {
    
    vspd += grav;
    
}

// Horizontal Collisions
if (place_meeting(x+hspd, y, collision_object)) {
    //while (!place_meeting(x+sign(hspd), y, collision_object)) {
    //    x += sign(hspd);
    //}
    //hspd = 0;
    
    yplus = 0;
    while (place_meeting(x+hspd,y-yplus,collision_object) && yplus <= abs(1*hspd)) yplus += 1;
    if place_meeting(x+hspd,y-yplus,collision_object)
    {
        while (!place_meeting(x+sign(hspd),y,collision_object)) x+=sign(hspd);
        hspd = 0;
    }
    else
    {
        y -= yplus
    }
}
x += hspd;

// Vertical Collisions
if (place_meeting(x, y+vspd, collision_object)) {
    while (!place_meeting(x, y+sign(vspd), collision_object)) {
        y += sign(vspd);
        vspd = 0;
    }
    vspd = 0;
}
y += vspd;

