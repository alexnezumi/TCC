if (estado_fogao == "assando") {
    timer_fogao--;
    if (timer_fogao <= 0) {
        estado_fogao = "pronto";
        show_debug_message(produto_pronto + " está pronto!");
    }
}

function tentar_cozinhar(_inventario_array) { // A função agora espera um array
    if (estado_fogao != "disponivel") return false;

    // Loop por todas as receitas globais
    for (var i = 0; i < array_length(global.receitas); i++) {
        var _receita = global.receitas[i];
        var _ingr_receita_struct = _receita.ingredientes;
        
        // Compara o inventário do player (array) com os ingredientes da receita (struct)
        var _num_ingr_player = array_length(_inventario_array);
        var _num_ingr_receita = variable_struct_names_count(_ingr_receita_struct);
        
        // CONDIÇÃO 1: O número de itens é o mesmo?
        if (_num_ingr_player == _num_ingr_receita) {
            
            var _combina = true;
            // CONDIÇÃO 2: Todos os itens do jogador existem na receita?
            for (var j = 0; j < _num_ingr_player; j++) {
                var _item_player = _inventario_array[j];
                if (!variable_struct_exists(_ingr_receita_struct, _item_player)) {
                    _combina = false; // Este item não pertence à receita
                    break;
                }
            }
            
            // Se combinou perfeitamente...
            if (_combina) {
                // SUCESSO! Encontramos a receita correta.
                
                // Limpa o inventário do jogador (faremos isso no player)
                
                // Inicia o preparo
                if (_receita.tempo_fogao > 0) {
                    estado_fogao = "assando";
                    produto_pronto = _receita.nome;
                    timer_fogao = _receita.tempo_fogao;
                    show_debug_message("Cozinhando: " + produto_pronto);
                    return "cozinhando"; // Retorna um sinal de sucesso
                } else {
                    return _receita.nome; // Retorna o item instantâneo
                }
            }
        }
    }
    
    show_debug_message("Nenhuma receita corresponde aos ingredientes: " + string(_inventario_array));
    return false; // Nenhuma receita correspondeu
}