// ver os dias passanso

if (variable_instance_exists(self,"timer_dia_frames"))
{
var FPS = game_get_speed(gamespeed_fps);
if(FPS == 0)
{
FPS = 60;
}
}
var _total_segundos_restantes = max(0, floor(timer_dia_frames/ FPS));
var _minutos_restantes = floor(_total_segundos_restantes/60);
var _segundos_na_hora_restantes = _total_segundos_restantes mod 60;

//formatação pra string tipo inteiro

var _texto_timer = string_format(_minutos_restantes, 2, 0) + ":" + string_format(_segundos_na_hora_restantes, 2, 0);

draw_set_font(Fontmenu);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_purple);

var _pos_x_time = display_get_gui_width() = -20;
var _pos_y_time = display_get_gui_height() = 20;

draw_text(_pos_x_time,_pos_y_time, "Dia" + string(global.dia_atual_numero) + "| Tempo" + _texto_timer);