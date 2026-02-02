var esc = keyboard_check_released(vk_escape);

if(esc) game_end();

var keyT = keyboard_check_released(ord("T"));

if(keyT)game_restart();