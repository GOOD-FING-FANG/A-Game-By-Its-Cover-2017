/// Player's Active State

get_input();


// ----------- Jump ----------
// Player is on the ground 
if (place_meeting(x, y+1, obj_solid) && space) {
    if (!launched) {   
        vspd = -30;
        gravOn = false;
        launched = true;
        
        obj_flip.image_speed = 1;
    }
    
    else vspd = pJumpHeight;
}

// ---------- End Jump ----------

//----------- Slashing ----------
if (!place_meeting(x, y+1, obj_solid) && launched && !gravOn && space && !instance_exists(obj_swing_effect)) {
    instance_create(x, y, obj_swing_effect);
    if (left) {
        obj_swing_effect.x_offset = -18;
        obj_swing_effect.image_angle = 90;
    }
    else if (right) {
        obj_swing_effect.x_offset = 18;
        obj_swing_effect.image_angle = 270;
    }
    else if (down) {
        obj_swing_effect.y_offset = 10;
        obj_swing_effect.image_angle = 180;
    }
    else obj_swing_effect.y_offset = -10;
}
//----------- End Slash ---------

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
