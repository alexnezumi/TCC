// Em oLivroDeReceitas - Evento Draw GUI

// Apenas executa este código se o mouse estiver em cima do livro.
if (mouse_esta_em_cima) {
    
    // --- Desenha um fundo escuro semi-transparente para focar no livro ---
    var _largura_tela = display_get_gui_width();
    var _altura_tela = display_get_gui_height();
    
    draw_set_color(c_black);
    draw_set_alpha(0.75); // 75% de opacidade
    draw_rectangle(0, 0, _largura_tela, _altura_tela, false);
    draw_set_alpha(1.0); // Restaura a opacidade para o normal
    
    
    // --- Desenha a imagem das receitas no centro da tela ---
    var _x_central = _largura_tela / 2;
    var _y_central = _altura_tela / 2;
    
    // Usa a variável que guardamos no evento Create
    draw_sprite(sprite_paginas, 0, _x_central, _y_central);
    
}