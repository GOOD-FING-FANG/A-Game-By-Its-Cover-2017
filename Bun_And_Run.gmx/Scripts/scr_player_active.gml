/// Player's Active State

get_input();

// ---------- Jump ----------

// Player is in the air
if (!place_meeting(x, y+1, obj_solid)) {
    
//    vspd += grav;
    
    // Double Jump
    if (space && !doubleJumped) {
        vspd = pDblJump;
        doubleJumped = true;
    }
    
    // Control the jump height
    if (space_release && vspd < -6) {
        vspd = -6;
    }

}

// Player is on the ground 
else {
    vspd = 0;
    
    // Jumping code
    if (space && !down) {
        vspd = pJumpHeight;
        doubleJumped = false;
    }
}

// ---------- End Jump ----------

// ---------- Horizontal Movement ----------

// Moving right or left
if ((!down && right) || (!down && left)) {
    hspd += (right-left)*pAccel;

    // enforce speed limit
    if (hspd > pSpd) hspd = pSpd;
    if (hspd < -pSpd) hspd = -pSpd;
} 

// Crawling right or left
else if ((down && right) || (down && left)) {
    hspd += (right-left)*pAccel;

    // enforce speed limit
    if (hspd > pSpd) hspd = pSpd/3;
    if (hspd < -pSpd) hspd = -pSpd/3;
} 

// Stop moving, apply friction
else {
    apply_friction(pAccel);
}

// Set sprite direction
if (hspd != 0) {
    image_xscale = sign(hspd);
}

move(solid);
