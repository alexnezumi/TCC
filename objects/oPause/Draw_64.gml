
if(global.pause)
{
draw_set_alpha(.8);
draw_set_color(c_black);
draw_rectangle(0,0,var_gui_w,var_gui_h,false);
draw_set_alpha(.1);
draw_set_color(c_white);
draw_set_font(Fontmenu);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(var_gui_w/2, var_gui_h/2, "JOGO PAUSADO");
draw_set_halign(-1);
draw_set_valign(-1);
}