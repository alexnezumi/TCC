draw_self(); // Desenha o sprite do padeiro

// Desenha a contagem de ingredientes acima do padeiro
var _texto_y_offset = -40;
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x, y + _texto_y_offset, "Oleo: " + string(meus_ingredientes.oleo));
draw_text(x, y + _texto_y_offset + 15, "Panela: " + string(meus_ingredientes.panela));

// Desenha o item carregado
if (item_carregando != noone) {
    draw_text(x, y + sprite_yoffset + 5, "Carregando: " + item_carregando);
}