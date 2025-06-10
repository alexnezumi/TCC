//#################################################################
// oNPCgatoLaranja - Evento Etapa (Step) - VERSÃO FINAL
//#################################################################

switch (estado) {
    //-----------------------------------------------------------------
    // ESTADO 1: O cliente entra na tela e caminha até um ponto inicial.
    //-----------------------------------------------------------------
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
            show_debug_message("Cliente " + string(id) + " terminou caminhada reta. Buscando cadeira.");
        }
        break;

    //-----------------------------------------------------------------
    // ESTADO 2: O cliente para e procura por uma cadeira vazia.
    //-----------------------------------------------------------------
    case "buscando_cadeira":
        var lista_cadeiras_livres = ds_list_create();
        with (oCadeira) {
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
                show_debug_message("Cliente " + string(id) + " escolheu oCadeira (ID: " + string(minha_cadeira_id) + "). Indo até ela.");
            } else {
                minha_cadeira_id = noone;
            }
        } else {
            show_debug_message("Cliente " + string(id) + " não encontrou cadeira livre. Indo embora.");
            estado = "indo_para_saida"; // Se não há cadeiras, vai embora
        }
        ds_list_destroy(lista_cadeiras_livres);
        break;

    //-----------------------------------------------------------------
    // ESTADO 3: O cliente caminha em direção à cadeira escolhida.
    //-----------------------------------------------------------------
    case "chegando_cadeira":
        if (!instance_exists(minha_cadeira_id)) {
            show_debug_message("Cliente " + string(id) + ": Cadeira alvo desapareceu! Buscando nova cadeira.");
            estado = "buscando_cadeira";
            minha_cadeira_id = noone;
            break;
        }

        if (point_distance(x, y, alvo_x, alvo_y) > velocidade_cliente) {
            move_towards_point(alvo_x, alvo_y, velocidade_cliente);
        } else {
            x = alvo_x;
            y = alvo_y - 15;
            speed = 0;
            
            // <<< MUDANÇA ADICIONADA AQUI >>>
            // O cliente ajusta sua direção para a direção definida na cadeira.
            image_xscale = abs(image_xscale) * minha_cadeira_id.direcao_cadeira;
            
            estado = "esperando_pedido";
            sprite_index = sprite_pedindo;
            timer_entrega = tempo_max_espera_segundos * game_get_speed(gamespeed_fps);
            show_debug_message("Cliente " + string(id) + " sentou. Pedido: " + meu_pedido_nome);
        }
        break;

    //-----------------------------------------------------------------
    // ESTADO 4: O cliente está sentado, esperando o pedido. O tempo está correndo!
    //-----------------------------------------------------------------
    case "esperando_pedido":
        if (timer_entrega > 0) {
            timer_entrega--;
        } else { // Tempo esgotou!
            var pontos_perdidos = -5;
            global.pontos = max(0, global.pontos + pontos_perdidos);
            show_debug_message("Entrega PÉSSIMA! Tempo esgotado. " + string(pontos_perdidos) + " pontos.");
            
            sprite_index = sprite_bravo;
            
            // Libera a cadeira que estava ocupando
            if (instance_exists(minha_cadeira_id) && minha_cadeira_id.id_cliente_sentado == id) {
                minha_cadeira_id.ocupada = false;
                minha_cadeira_id.id_cliente_sentado = noone;
            }
            minha_cadeira_id = noone;

            estado = "indo_para_saida";
        }
        break;

    //-----------------------------------------------------------------
    // ESTADO 5: O cliente recebeu o pedido corretamente. (Este estado é ativado pelo oPlayer)
    //-----------------------------------------------------------------
    case "recebeu_pedido":
        show_debug_message("Cliente " + string(id) + ": Pedido recebido a tempo! Feliz!");
        sprite_index = sprite_feliz;
        
        // Libera a cadeira que estava ocupando
        if (instance_exists(minha_cadeira_id) && minha_cadeira_id.id_cliente_sentado == id) {
            minha_cadeira_id.ocupada = false;
            minha_cadeira_id.id_cliente_sentado = noone;
        }
        minha_cadeira_id = noone;
        
        estado = "indo_para_saida";
        break;

    //-----------------------------------------------------------------
    // ESTADO 6: O cliente (feliz ou bravo) caminha até a porta para sair.
    //-----------------------------------------------------------------
    case "indo_para_saida":
        // << DEFINA AQUI AS COORDENADAS DA SUA PORTA DE SAÍDA >>
        var _porta_x = 950; 
        var _porta_y = 65;
        
        // Vira o sprite para a direção da porta
        if (_porta_x > x) {
            image_xscale = abs(image_xscale) * -1; // Virado para a direita
        } else {
            image_xscale = abs(image_xscale) * 1; // Virado para a esquerda
        }

        // Move em direção à porta
        if (point_distance(x, y, _porta_x, _porta_y) > velocidade_cliente) {
            move_towards_point(_porta_x, _porta_y, velocidade_cliente);
        } else {
            // Quando chega na porta, o cliente é destruído
            instance_destroy();
        }
        break;
}