draw_set_font(Fontmenu);
var largura = display_get_gui_width();
var altura = display_get_gui_height();
var x1 = largura/2;
var y1 = altura/2;
var margin = 50;
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

for(var i = 0; i < op_max;i++){
	var y2 = y1 + (margin * i);
	var string_w = string_width(opcoes[i]);
	var string_h = string_height(opcoes[i]);
	
	if (point_in_rectangle(m_x,m_y, x1 - string_w /2,y2 - string_h /2, x1 + string_w /2, y2 + string_h/2)){
	draw_set_color(#8E53D1);
	index = i;
	if(mouse_check_button_pressed(mb_left)){
	
	if(index == 0){
		MudarDeRoomComFade(Tutorial); // Inicia a transição suave

	}else if (index == 1){
		MudarDeRoomComFade(Controles); // Inicia a transição suave
		
	}else if(index == 2){
		game_end();
	}
	}
	}else{
	draw_set_color(c_white);
	}
	
	draw_text(x1,y2,opcoes[i]);
}