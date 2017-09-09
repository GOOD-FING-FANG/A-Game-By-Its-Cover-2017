///get_input

//Keyboard button controls (no ganepad connected)
//shift_press = keyboard_check_pressed(vk_shift);
//tab_press = keyboard_check_pressed(vk_tab);

space = keyboard_check_pressed(vk_space);
space_release = keyboard_check_released(vk_space);

//ctrl = keyboard_check(vk_control);

esc = keyboard_check(vk_escape);



//Override controls when a gamepad is detected
var gp_id = 0;

if (gamepad_is_connected(gp_id)) {
    gamepad_set_axis_deadzone(gp_id, 0.5);
    if (gamepad_axis_value(gp_id, gp_axislh) < 0) left = true;
    else left = false;
    if (gamepad_axis_value(gp_id, gp_axislh) > 0) right = true;
    else right = false;
    //Jump and advance text
    space = gamepad_button_check_pressed(gp_id, gp_face1);
    space_release = gamepad_button_check_released(gp_id, gp_face1);
    //Crouch
    if (gamepad_axis_value(gp_id, gp_axislv) > 0) down = true;
    else down = false;
    if (gamepad_axis_value(gp_id, gp_axislv) <= 0) down_release = true;
/*    //Weapon swing
    ctrl = gamepad_button_check_pressed(gp_id, gp_face3);
    //Grog mode
    shift_press = gamepad_button_check_pressed(gp_id, gp_face2);
    //Groggrog mode
    tab_press = gamepad_button_check_pressed(gp_id, gp_face4);
*/    //Restart
    esc = gamepad_button_check_pressed(gp_id, gp_select);
}

//Read direction input only when a gamepad is not connected
else
{
    right = keyboard_check(vk_right);
    left = keyboard_check(vk_left);

    up = keyboard_check(vk_up);
    down = keyboard_check(vk_down);
    down_release = keyboard_check_released(vk_down);
}

//Restart the game if esc is pressed
if (esc) game_restart();
