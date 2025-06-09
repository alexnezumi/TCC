// Em oPlayer - Evento Draw

// Dica de Ouro: A primeira coisa em um evento Draw customizado
// é desenhar o próprio objeto! Se não fizer isso, o jogador some.
draw_self();

// Agora, verificamos se o jogador está carregando algo
if (item_carregando != noone) {
    
    // Verificamos se o item que estamos carregando existe no nosso mapa de sprites
    if (variable_struct_exists(global.sprites_pedidos, item_carregando)) {
        
        // Pega o sprite correspondente usando o nome do item como chave
        var _sprite_para_desenhar = global.sprites_pedidos[$ item_carregando];
        
        // Define a posição para desenhar (acima da cabeça do player)
        // bbox_top é a coordenada Y do topo da caixa de colisão do player
        var _draw_x = x;
        var _draw_y = bbox_top - 10; // 10 pixels acima da cabeça. Ajuste se precisar.
        
        // Desenha o sprite!
        draw_sprite(_sprite_para_desenhar, 0, _draw_x, _draw_y);
        
    }
}