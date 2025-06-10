// Em oCozinha - Evento Create

estado_fogao = "disponivel";
timer_fogao = 0;
produto_pronto = noone;

// ADICIONE ESTAS DUAS LINHAS:
ultimo_item_instantaneo = ""; // Guarda o nome do último item feito na hora
timer_mostrar_status = 0;     // Um timer para saber por quanto tempo mostrar a mensagem

function tentar_cozinhar(_inventario_array) {

    
    // Se a cozinha já estiver ocupada, não faz nada.
    if (estado_fogao != "disponivel") {
        show_debug_message("Fogão está ocupado!");
        return false;
    }
    
    // Loop que passa por CADA receita da sua lista global de receitas.
    for (var i = 0; i < array_length(global.receitas); i++) {
        
        var _receita_atual = global.receitas[i];
        var _ingredientes_da_receita = _receita_atual.ingredientes; // Pega o struct de ingredientes da receita
        
        // Compara o inventário do player (array) com os ingredientes da receita (struct)
        var _num_ingr_player = array_length(_inventario_array);
        var _num_ingr_receita = variable_struct_names_count(_ingredientes_da_receita);
        
        // CONDIÇÃO 1: O número de itens que o jogador tem é o mesmo que a receita precisa?
        if (_num_ingr_player == _num_ingr_receita) {
            
            var _combina = true;
            
            // CONDIÇÃO 2: Se o número de itens bate, vamos checar se CADA item do jogador
            // existe na receita.
            for (var j = 0; j < _num_ingr_player; j++) {
                var _item_do_jogador = _inventario_array[j];
                if (!variable_struct_exists(_ingredientes_da_receita, _item_do_jogador)) {
                    _combina = false; // Achou um item que não pertence a essa receita.
                    break;           // Para de verificar essa receita e vai para a próxima.
                }
            }
            
            // Se, após todas as verificações, a combinação for perfeita...
            if (_combina) {
                
                show_debug_message("Combinação encontrada! Preparando: " + _receita_atual.nome);
                
                // --- AÇÃO: Inicia o preparo do item ---
                
                // Se o tempo de fogão for maior que zero, é um item que precisa de contagem regressiva.
                if (_receita_atual.tempo_fogao > 0) {
                    estado_fogao = "assando";
                    produto_pronto = _receita_atual.nome;
                    timer_fogao = _receita_atual.tempo_fogao;
                    
                    return "cozinhando"; // Retorna um sinal de sucesso para o Player.
                
                } else { // Senão, é um item de preparo instantâneo.
                    
                    // Ativa o status visual para itens instantâneos
                    ultimo_item_instantaneo = _receita_atual.nome;
                    timer_mostrar_status = 120; // Mostra "Suco pronto!" por 2 segundos
                    
                    // Retorna o nome do item pronto diretamente para o jogador.
                    return _receita_atual.nome;
                }
            }
        }
    }
    
    // Se o loop terminou e nenhuma receita combinou com os itens do jogador...
    show_debug_message("Nenhuma receita corresponde aos ingredientes: " + string(_inventario_array));
    return false; // Retorna 'false' para indicar que a tentativa de cozinhar falhou.
}