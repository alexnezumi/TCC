// oNPCgatoLaranja - Evento Step

switch (estado) {
    case "caminhando_reto_inicial":
        if (x > x_alvo_caminhada_reta) {
            x -= velocidade_cliente;
            if (x < x_alvo_caminhada_reta) {
                x = x_alvo_caminhada_reta;
            }
        }
        
        if (x <= x_alvo_caminhada_reta) {
            x = x_alvo_caminhada_reta;
            estado = "buscando_cadeira";
            show_debug_message("Cliente " + string(id) + " terminou caminhada reta em x=" + string(x) + ". Buscando cadeira.");
        }
        break;

    case "buscando_cadeira":
        var lista_cadeiras_livres = ds_list_create();
        with (oCadeira) { // << Certifique-se que oCadeira é o nome correto do seu objeto cadeira
            if (!ocupada) {
                ds_list_add(lista_cadeiras_livres, id);
            }
        }

        if (ds_list_size(lista_cadeiras_livres) > 0) {
            var indice_aleatorio = irandom(ds_list_size(lista_cadeiras_livres) - 1);
            minha_cadeira_id = lista_cadeiras_livres[| indice_aleatorio];

            if (instance_exists(minha_cadeira_id)) {
                minha_cadeira_id.ocupada = true;
                minha_cadeira_id.id_cliente_sentado = id;
                alvo_x = minha_cadeira_id.x;
                alvo_y = minha_cadeira_id.y;
                estado = "chegando_cadeira";
                show_debug_message("Cliente " + string(id) + " escolheu oCadeira (ID: " + string(minha_cadeira_id) + ") em (" + string(alvo_x) + "," + string(alvo_y) + "). Indo até ela.");
                
                // Linhas de image_xscale REMOVIDAS daqui
            } else {
                 minha_cadeira_id = noone;
                 show_debug_message("Cliente " + string(id) + ": oCadeira escolhida aleatoriamente não existe mais. Tentando buscar novamente no próximo frame.");
            }
        } else {
            show_debug_message("Cliente " + string(id) + " não encontrou nenhuma oCadeira livre. Indo embora.");
            estado = "saindo_efetivamente";
        }
        ds_list_destroy(lista_cadeiras_livres);
        break;

    case "chegando_cadeira":
        if (!instance_exists(minha_cadeira_id)) {
            show_debug_message("Cliente " + string(id) + ": oCadeira alvo (ID: " + string(minha_cadeira_id) + ") desapareceu! Buscando nova cadeira.");
            estado = "buscando_cadeira";
            minha_cadeira_id = noone;
            break;
        }

        // Linhas de image_xscale REMOVIDAS daqui

        if (point_distance(x, y, alvo_x, alvo_y) > velocidade_cliente) {
            move_towards_point(alvo_x, alvo_y, velocidade_cliente);
        } else {
            x = alvo_x;
            y = alvo_y;
            speed = 0;
            
            estado = "esperando_pedido";
            sprite_index = sprite_pedindo;
            timer_entrega = tempo_max_espera_segundos * game_get_speed(gamespeed_fps);
            show_debug_message("Cliente " + string(id) + " sentou. Pedido: " + meu_pedido_nome + ". Timer: " + string(tempo_max_espera_segundos) + "s");
        }
        break;

       case "esperando_pedido":
        if (timer_entrega > 0) {
            timer_entrega--;
        } else { // Tempo esgotou!
            
            // --- LÓGICA DE PENALIDADE "PÉSSIMO" ---
            var pontos_perdidos = -5; // << AJUSTE o valor da penalidade se quiser
            global.pontos = max(0, global.pontos + pontos_perdidos); // 'max(0, ...)' impede que a pontuação fique negativa
            show_debug_message("Entrega PÉSSIMA! Tempo esgotado. " + string(pontos_perdidos) + " pontos. Total: " + string(global.pontos));
            // ----------------------------------------
            
            // O resto da lógica para o cliente ficar bravo e ir embora
            estado = "saindo_bravo";
            sprite_index = sprite_bravo;
            // ... (liberar cadeira se usar esse sistema, e definir alarme para sair) ...
            alarm[0] = 2 * game_get_speed(gamespeed_fps);
        }
        break;

    case "recebeu_pedido":
        show_debug_message("Cliente " + string(id) + ": Pedido recebido a tempo! Feliz!");
        sprite_index = sprite_feliz;
        estado = "saindo_feliz";
        if (instance_exists(minha_cadeira_id) && minha_cadeira_id.id_cliente_sentado == id) {
            minha_cadeira_id.ocupada = false;
            minha_cadeira_id.id_cliente_sentado = noone;
        }
        minha_cadeira_id = noone;
        alarm[0] = 2 * game_get_speed(gamespeed_fps);
        break;

    case "saindo_feliz":
    case "saindo_bravo":
        // Esperando Alarm[0]
        break;

    case "saindo_efetivamente":
        var _ponto_saida_x = -sprite_get_width(sprite_index);
        var _ponto_saida_y = y;
        
        // Linha de image_xscale REMOVIDA daqui

        if (x > _ponto_saida_x + velocidade_cliente) {
            move_towards_point(_ponto_saida_x, _ponto_saida_y, velocidade_cliente * 1.5);
        } else {
            instance_destroy();
        }
        break;
}