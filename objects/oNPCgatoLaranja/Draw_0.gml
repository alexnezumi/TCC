// Em oNPCgatoLaranja - Evento Draw

// Desenha o sprite do próprio cliente
draw_self();

// Se o cliente estiver esperando um pedido...
if (estado == "esperando_pedido" && meu_pedido_nome != noone) {
    
    // Verifica se o pedido dele existe no nosso mapa de sprites
    if (variable_struct_exists(global.sprites_pedidos, meu_pedido_nome)) {
        
        // Pega o sprite do pedido
        var _sprite_pedido = global.sprites_pedidos[$ meu_pedido_nome];
        
        // --- Lógica para desenhar o balão (pode manter a sua) ---
        var _balao_x = x;
        var _balao_y = bbox_top - 5; // Posição do balão
        var _balao_largura = sprite_get_width(_sprite_pedido) + 16; // Largura do balão baseada no sprite
        var _balao_altura = sprite_get_height(_sprite_pedido) + 16; // Altura do balão baseada no sprite
        
        draw_set_color(c_white);
        draw_roundrect_color(_balao_x - _balao_largura / 2, _balao_y - _balao_altura, _balao_x + _balao_largura / 2, _balao_y, c_white, c_white, false);
        
        // --- Desenha o sprite do pedido DENTRO do balão ---
        var _sprite_x = _balao_x;
        var _sprite_y = _balao_y - _balao_altura / 2; // Centralizado no balão
        
        draw_sprite(_sprite_pedido, 0, _sprite_x, _sprite_y);
        
    } else {
        // Se, por algum motivo, o sprite não for encontrado, desenhe o texto como antes para podermos depurar
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);
        draw_text(x, bbox_top - 20, "Sprite não encontrado para: " + meu_pedido_nome);
    }
}