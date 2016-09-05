#define scr_gamepad_init
/// scr_gamepad_init();

global.gpcount = 0;
if (gamepad_is_supported())
    {
    for(i = 0; i < 4; i++)
        {
        global.gp[i,0] = gamepad_is_connected(i); // gamepad connected
        global.gp[i,1] = gamepad_get_description(i); // gamepad name
        global.gp[i,2] = 0; // gamepad rumble left
        global.gp[i,3] = 0; // gamepad rumble right
        global.gp[i,4] = 0; // gamepad deadzone
        global.gp[i,5] = 0; // gamepad left stick vertical
        global.gp[i,6] = 0; // gamepad left stick horizontal
        global.gp[i,7] = 0; // gamepad right stick vertical
        global.gp[i,8] = 0; // gamepad right stick horizontal
        
        if (global.gp[i,0] == true) {
            global.gpcount++;
            }
        }
    return(global.gpcount);
    }
return(-1);

#define scr_gamepad_update
/// scr_gamepad_update();

i = 0;
repeat(4)
    {
    if (gamepad_is_connected(i))
        {
        if (global.gp[i,0] == false)
            {
            global.gp[i,0] = true;
            global.gp[i,1] = gamepad_get_description(i);
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            global.gp[i,4] = 0;
            }
        global.gp[i,2] *= 0.9;
        global.gp[i,3] *= 0.9;
        
        // left stick vertical
        if (global.gp[i,5] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axislv)) < 0.05) {
                global.gp[i,5] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axislv)) > 0.05) {
                global.gp[i,5] = true;
                }
            }
        
        // left stick horizontal
        if (global.gp[i,6] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axislh)) < 0.05) {
                global.gp[i,6] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axislh)) > 0.05) {
                global.gp[i,6] = true;
                }
            }
        
        // right stick vertical
        if (global.gp[i,7] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axisrv)) < 0.05) {
                global.gp[i,7] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axisrv)) > 0.05) {
                global.gp[i,7] = true;
                }
            }
        
        // right stick horizontal
        if (global.gp[i,8] == true)
            {
            if (abs(gamepad_axis_value(i,gp_axisrh)) < 0.05) {
                global.gp[i,8] = false;
                }
            }
        else
            {
            if (abs(gamepad_axis_value(i,gp_axisrh)) > 0.05) {
                global.gp[i,8] = true;
                }
            }
        }
    else
        {
        if (global.gp[i,0] == true)
            {
            global.gp[i,0] = false;
            global.gp[i,1] = "";
            global.gp[i,2] = 0;
            global.gp[i,3] = 0;
            global.gp[i,4] = 0;
            global.gp[i,5] = false;
            global.gp[i,6] = false;
            global.gp[i,7] = false;
            global.gp[i,8] = false;
            global.gp[i,9] = 0;
            global.gp[i,10] = 0;
            }
        }
    
    i++;
    }

#define scr_gamepad_checkall
/// scr_gamepad_checkall(function,info);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

switch(argument0)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_axis_value(i,argument0)) > 0.05)
                    {
                    if (argument1) {
                        return(gamepad_axis_value(i,argument0));
                        }
                    else
                        {
                        return(true);
                        }
                    }
                }
            }
    break;
    default:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_button_value(i,argument0)) > 0.05)
                    {
                    if (argument1) {
                        return(gamepad_button_value(i,argument0));
                        }
                    else
                        {
                        return(true);
                        }
                    }
                }
            }
    break;
    }

return(false);

#define scr_gamepad_checkall_pressed
/// scr_gamepad_checkall_pressed(function,info);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

if (argument0 == gp_axislv) {
    axis = 5;
    }
if (argument0 == gp_axislh) {
    axis = 6;
    }
if (argument0 == gp_axisrv) {
    axis = 7;
    }
if (argument0 == gp_axisrh) {
    axis = 8;
    }

switch(argument0)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_axis_value(i,argument0)) > 0.05)
                    {
                    if (global.gp[i,axis] == false)
                        {
                        global.gp[i,axis] = true;
                        if (argument1) {
                            return(gamepad_axis_value(i,argument0));
                            }
                        else
                            {
                            return(true);
                            }
                        }
                    }
                }
            }
    break;
    default:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (gamepad_button_check_pressed(i,argument0))
                    {
                    if (argument1) {
                        return(gamepad_button_value(i,argument0));
                        }
                    else
                        {
                        return(true);
                        }
                    }
                }
            }
    break;
    }

return(false);

#define scr_gamepad_checkall_released
/// scr_gamepad_checkall_released(function);

// if argument1 is true, it will return the value of the gamepad's function
// if argument1 is false, it will only return true or false

if (argument0 == gp_axislv) {
    axis = 5;
    }
if (argument0 == gp_axislh) {
    axis = 6;
    }
if (argument0 == gp_axisrv) {
    axis = 7;
    }
if (argument0 == gp_axisrh) {
    axis = 8;
    }

switch(argument0)
    {
    case gp_axislh: case gp_axislv:
    case gp_axisrh: case gp_axisrv:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (abs(gamepad_axis_value(i,argument0)) < 0.05)
                    {
                    if (global.gp[i,axis] == true)
                        {
                        global.gp[i,axis] = false;
                        return(true);
                        }
                    }
                }
            }
    break;
    default:
        for(i = 0; i < 4; i++)
            {
            if (gamepad_is_connected(i))
                {
                if (gamepad_button_check_released(i,argument0)) {
                    return(true);
                    }
                }
            }
    break;
    }

return(false);

