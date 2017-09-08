///move_state() !!!!May not be necessary anymore!!!!

//Buff is available
if(global.bufftime == global.buffduration) {
    if(shift_press) {
        audio_play_sound(snd_tom_grunt, 5, false);
        global.portraitversion = 0;
        pJumpHeight += pJumpBuff;
        pSpd += pSpdBuff;
    }   
}

//Buff expires
else if(global.bufftime <= 0) {
    global.portraitversion = 1;
    global.bufftime = global.buffduration;
    pJumpHeight -= pJumpBuff;
    pSpd -= pSpdBuff;
}

//reset Buff
if(global.portraitversion == 0) {
    global.bufftime -= 1;
}

//Jump
if (!place_meeting(x, y+1, obj_solid)) {
    
    vspd += grav;
    
    // Player is in the air
    sprite_index = spr_tom_jump;
    image_speed = 0;
    image_index = (vspd > 0);
    
    // Control the jump height
    if (up_release && vspd < -6) {
        vspd = -6;
    }
    
} else {
    vspd = 0;
    
    // Jumping code
    if (up && global.dialogueDone) {
        vspd = pJumpHeight;
        //audio_play_sound(snd_tom_grunt, 5, false);
    }
    
    // Player is on the ground idle
    if (hspd == 0) {
        
        //Crouch
        if (down) {
            sprite_index = spr_tom_crouch;
            object_set_mask(obj_player, spr_tom_crouch_mask);
        }
        //Stand
        else {
            sprite_index = spr_tom_idle;
            object_set_mask(obj_player, spr_tom_mask)
        }
    } else {
        sprite_index = spr_tom_walk;
        image_speed = .6;
    }
}


//Right/Left Movement
if (right || left) {
    hspd += (right-left)*pAccel;
    //hspd_dir = right - left;
    
    //enforce speed limit
    if (hspd > pSpd) hspd = pSpd;
    if (hspd < -pSpd) hspd = -pSpd;
} else {
    apply_friction(pAccel);
}

if (hspd != 0) {
    image_xscale = sign(hspd);
}

// Play the landing sound
//if (place_meeting(x, y+vspd+1, obj_solid) && vspd > 0) {
//    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
//    audio_emitter_gain(audio_em, .2);
//    audio_play_sound_on(audio_em, snd_step, false, 6);
//}

move(obj_solid);

