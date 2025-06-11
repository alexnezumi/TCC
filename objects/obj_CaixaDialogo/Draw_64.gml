var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Posição da caixa (na base da tela)
var _caixa_x = (_gui_w / 2) - (largura_caixa / 2);
var _caixa_y = _gui_h - altura_caixa - 20;

// Desenha o fundo da caixa
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(_caixa_x, _caixa_y, _caixa_x + largura_caixa, _caixa_y + altura_caixa, false);
draw_set_alpha(1.0);

// Desenha o texto
draw_set_color(c_white);
draw_set_font(FontTextos); // << Sua fonte
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(_caixa_x + 15, _caixa_y + 15, texto, 24, largura_caixa - 30);