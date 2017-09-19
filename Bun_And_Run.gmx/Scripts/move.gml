///move(collision_object)
var collision_object = argument0;

//Apply gravity
if (!place_meeting(x, y+1, obj_solid) && gravOn) {
    vspd = min(max_vspd,vspd + grav);
}

//Horizontal Collision
if (place_meeting(x+hspd, y, collision_object)) {
    while (!place_meeting(x+sign(hspd), y, collision_object)) {
        x += sign(hspd);
    }
    hspd = 0;
}

x += hspd;

//Vertical Collision
if (place_meeting(x, y+vspd, collision_object)) {
    while (!place_meeting(x, y+sign(vspd), collision_object)) {
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;
