/// Player's Active State

get_input();


// ----------- Jump ----------
// Player is on the ground 
if (place_meeting(x, y+1, obj_solid) && space) {
    if (!launched) {   
        vspd = -30;
        gravOn = false;
        launched = true;
    }
    else vspd = pJumpHeight;
}

// ---------- End Jump ----------

// ---------- Horizontal Movement ----------

// Moving right or left
if (right || left) {
    hspd += (right-left)*pAccel;
    image_speed = 0.5;

    // enforce speed limit
    if (hspd > pSpd) hspd = pSpd;
    if (hspd < -pSpd) hspd = -pSpd;
} 

// Stop moving, apply friction
else {
    apply_friction(pAccel);
    image_speed = 0;
    image_index = 0;
}

// Set sprite direction
if (hspd != 0) {
    image_xscale = sign(hspd);
}

move(obj_solid);
