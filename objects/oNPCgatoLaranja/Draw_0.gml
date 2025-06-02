draw_self();
if (estado == "esperando_pedido" && meu_pedido_nome != noone) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_black);
    // Desenha um balão de fala simples
    var bx = x;
    var by = y - sprite_get_yoffset(sprite_index) - 5;
    var bw = string_width(meu_pedido_nome) + 20;
    var bh = 25;
    draw_rectangle(bx - bw/2, by - bh, bx + bw/2, by, false); // Caixa do balão
    draw_set_color(c_white);
    draw_text(bx, by - bh/2, meu_pedido_nome);
}