switch (state) {
    
    case "spawn":
        // Encontra cadeira livre
        cadeira_alvo = instance_nearest(x, y, oCadeira);
        if (cadeira_alvo != noone && !cadeira_alvo.ocupada) {
            cadeira_alvo.ocupada = true;
            state = "indo_cadeira";
        }
        break;
    
    case "indo_cadeira":
        // Move até a cadeira
        if (point_distance(x, y, cadeira_alvo.x, cadeira_alvo.y) > 2) {
            move_towards_point(cadeira_alvo.x, cadeira_alvo.y, 1);
        } else {
            x = cadeira_alvo.x;
            y = cadeira_alvo.y;
            state = "sentado";
        }
        break;
    
    case "sentado":
        // Faz pedido
        if (!pedido_feito) {
            var total_itens = array_length(cardapio);
            pedido = irandom(total_itens - 1);
            show_debug_message("Pedido: " + string(cardapio[pedido]));
            pedido_feito = true;
            state = "esperando";
        }
        break;
    
    case "esperando":
        tempo_espera--;
        
        if (tempo_espera <= 0) {
            // Foi embora bravo
            cadeira_alvo.ocupada = false;
            feliz = false;
            state = "indo_embora";
        }
        
        break;
    
    case "indo_caixa":
        var caixa = instance_nearest(x, y, oAtendimento);
        move_towards_point(caixa.x, caixa.y, 1);
        
        if (point_distance(x, y, caixa.x, caixa.y) < 2) {
            // Pagou
            show_debug_message("Pagamento realizado!");
            state = "indo_embora";
        }
        break;
    
    case "indo_embora":
        // Move para fora da tela
        move_towards_point(room_width + 50, y, 1);
        if (x > room_width) {
            instance_destroy();
        }
        break;
}
