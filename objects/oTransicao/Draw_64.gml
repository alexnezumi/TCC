// Em obj_Transicao - Evento Draw GUI

// Só desenha algo se o alpha for maior que zero
if (alpha_fade > 0) {
    // Define a cor preta com a transparência atual
    draw_set_color(c_black);
    draw_set_alpha(alpha_fade);

    // Desenha um retângulo que cobre a tela inteira
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // Restaura a transparência para o normal para não afetar outros desenhos
    draw_set_alpha(1);
}