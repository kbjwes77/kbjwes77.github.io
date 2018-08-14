#define highscores_save
/// @description  highscores_save();
/// @function  highscores_save

var file = file_text_open_write(working_directory+"highscore.ini");
file_text_write_real(file,global.highscore);
file_text_close(file);


#define highscores_load
/// @description  highscores_load();
/// @function  highscores_load

var file = file_text_open_read(working_directory+"highscore.ini");
global.highscore = file_text_read_real(file);
file_text_close(file);


