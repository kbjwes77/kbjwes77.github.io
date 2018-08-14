#define settings_save
/// @description  settings_save();
/// @function  settings_save

var file = file_text_open_write(working_directory+"settings.ini");

file_text_write_real(file,global.fullscreen);
file_text_writeln(file);
file_text_write_real(file,global.bgm_gain);
file_text_writeln(file);
file_text_write_real(file,global.sfx_gain);
file_text_writeln(file);
file_text_write_real(file,global.bloom);
file_text_writeln(file);
file_text_write_real(file,global.particles);

file_text_close(file);


#define settings_load
/// @description  settings_load

var temp_val, i;
var file = file_text_open_read(working_directory+"settings.ini");

i = 0;
while(!file_text_eof(file))
    {
    temp_val[i] = file_text_read_real(file);
    file_text_readln(file);
    
    i++;
    }

file_text_close(file);

// fullscreen
if (i >= 1) and (temp_val[0] >= 0) and (temp_val[0] <= 1)
    global.fullscreen = temp_val[0];
// bgm
if (i >= 2) and (temp_val[1] >= 0) and (temp_val[1] <= 1)
    global.bgm_gain = temp_val[1];
// sfx
if (i >= 3) and (temp_val[2] >= 0) and (temp_val[2] <= 1)
    global.sfx_gain = temp_val[2];
// bloom
if (i >= 4) and (temp_val[3] >= 0) and (temp_val[3] <= 1)
    global.bloom = temp_val[3];
// particles
if (i >= 5) and (temp_val[4] >= 0) and (temp_val[4] <= 1)
    global.particles = temp_val[4];


#define val_to_text
/// @description  val_to_text(val,type);
/// @function  val_to_text
/// @param val
/// @param type

var val = argument[0];

if (argument[1] == 0) // boolean
    {
    if (val < 0.5)
        return("OFF");
    else
        return("ON");
    }
else if (argument[1] == 1) // percent
    {
    if (val <= 0)
        return("OFF");
    else if (val > 0) and (val < 1)
        return(string(val*100)+"%");
    else if (val >= 1)
        return("MAX");
    }
else if (argument[1] == 2) // LOW to HIGH
    {
    if (val <= 0)
        return("OFF");
    else if (val > 0) and (val <= 0.33)
        return("LOW");
    else if (val > 0.33) and (val <= 0.66)
        return("MEDIUM");
    else if (val > 0.66) and (val < 1)
        return("HIGH")
    else if (val >= 1)
        return("MAX");
    }

#define time_to_text
/// time_to_text();

var m = floor(argument[0]/(60*1000000));
var s = floor((argument[0]-(m*60*1000000))/1000000);
var ms = floor((argument[0]-(m*60*1000000)-(s*1000000))/10000);

var str = "";
if (m < 10)
    str = string(str) + "0"+string(m);
else
    str = string(str) + string(m);

str = string(str)+":";

if (s < 10)
    str = string(str) + "0"+string(s);
else
    str = string(str) + string(s);

str = string(str)+":";

if (ms < 10)
    str = string(str) + "0"+string(ms);
else
    str = string(str) + string(ms);

return(str);


