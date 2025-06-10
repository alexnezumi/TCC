// Em oNPCgatoLaranja - Evento Draw

// Desenha o sprite do próprio cliente
draw_self();


// O balão do pedido e a barrinha de tempo só devem aparecer quando o cliente está esperando
if (estado == "esperando_pedido" && meu_pedido_nome != noone) {
    
    //-----------------------------------------------------------------
    // CÓDIGO DO BALÃO DE PEDIDO (VOCÊ JÁ TEM ESTE)
    //-----------------------------------------------------------------
    if (variable_struct_exists(global.sprites_pedidos, meu_pedido_nome)) {
        var _sprite_pedido = global.sprites_pedidos[$ meu_pedido_nome];
        var _balao_x = x;
        var _balao_y = bbox_top - 5;
        var _balao_largura = sprite_get_width(_sprite_pedido) + 16;
        var _balao_altura = sprite_get_height(_sprite_pedido) + 16;
        
        draw_set_color(c_white);
        draw_roundrect_color(_balao_x - _balao_largura / 2, _balao_y - _balao_altura, _balao_x + _balao_largura / 2, _balao_y, c_white, c_white, false);
        
        var _sprite_x = _balao_x;
        var _sprite_y = _balao_y - _balao_altura / 2;
        
        draw_sprite(_sprite_pedido, 0, _sprite_x, _sprite_y);
    }
    
    //-----------------------------------------------------------------
    // <<< INÍCIO DO NOVO CÓDIGO DA BARRINHA DE PACIÊNCIA >>>
    //-----------------------------------------------------------------
    
    // --- 1. Define a aparência e posição da barra (abaixo do cliente) ---
    var _bar_largura = 50;
    var _bar_altura = 3;
    var _bar_x = x - (_bar_largura / 2); // Centraliza a barra
    var _bar_y = bbox_bottom + 5;        // 5 pixels abaixo do personagem
    
    // --- 2. Calcula a porcentagem de tempo restante ---
    var _tempo_total = tempo_max_espera_segundos * game_get_speed(gamespeed_fps);
    var _porcentagem = 0;
    if (_tempo_total > 0) {
        _porcentagem = (timer_entrega / _tempo_total) * 100;
    }
    
    // --- 3. Desenha a barrinha! ---
    draw_healthbar(
        _bar_x,                  // Posição x1 (canto esquerdo)
        _bar_y,                  // Posição y1 (canto de cima)
        _bar_x + _bar_largura,   // Posição x2 (canto direito)
        _bar_y + _bar_altura,    // Posição y2 (canto de baixo)
        _porcentagem,            // Quantidade (0 a 100)
        c_dkgray,                // Cor do fundo da barra
        c_red,                   // Cor da barra quando está em 0% (vermelho)
        c_lime,                  // Cor da barra quando está em 100% (verde-limão)
        0,                       // Direção (0 = da esquerda para a direita)
        true,                    // Mostrar o fundo? (sim)
        true                     // Mostrar borda? (sim)
    );
}