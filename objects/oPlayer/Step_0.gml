// oPlayer - Evento Etapa

// Pause do jogo
if (global.pause) {
    exit; // Sai do evento Step se o jogo estiver pausado
}

// --- INPUT E MOVIMENTO ---
var tecla_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
var tecla_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
var tecla_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
var tecla_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));

var velh_atual = (tecla_direita - tecla_esquerda) * velocidade;
var velv_atual = (tecla_baixo - tecla_cima) * velocidade;

// Virar sprite (se você usa)
if (velh_atual > 0) { image_xscale = 1; }
else if (velh_atual < 0) { image_xscale = -1; }

// --- COLISÃO ---
if (place_meeting(x + velh_atual, y, oColisores)) {
    while (!place_meeting(x + sign(velh_atual), y, oColisores)) { x += sign(velh_atual); }
    velh_atual = 0;
}
x += velh_atual;

if (place_meeting(x, y + velv_atual, oColisores)) {
    while (!place_meeting(x, y + sign(velv_atual), oColisores)) { y += sign(velv_atual); }
    velv_atual = 0;
}
y += velv_atual;


// --- INTERAÇÕES COM O BOTÃO ESQUERDO DO MOUSE (mb_left) ---
if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;
    var _inst_clicada = instance_position(_mx, _my, all);

    if (instance_exists(_inst_clicada)) {
        var _obj_clicado = _inst_clicada.object_index;

        switch (_obj_clicado) {
            // << CRIE OBJETOS PARA CADA INGREDIENTE E SUBSTITUA OS NOMES DE EXEMPLO (oMassa, oFrango, etc.) >>
            case oMassa:
                meus_ingredientes.massa += 1;
                show_debug_message("Coletou Massa! Total: " + string(meus_ingredientes.massa));
                break;
				
            case oFrango:
                meus_ingredientes.frango += 1;
                show_debug_message("Coletou Frango! Total: " + string(meus_ingredientes.frango));
                break;
				
            case oPanela:
                meus_ingredientes.panela += 1;
                show_debug_message("Coletou Panela! Total: " + string(meus_ingredientes.panela));
                break;
				
            case oRosquinha:
                meus_ingredientes.rosquinha += 1;
                show_debug_message("Coletou Rosquinha! Total: " + string(meus_ingredientes.rosquinha));
                break;
				
             case oCaldaNinho:
                meus_ingredientes.calda_ninho += 1;
                show_debug_message("Coletou Calda de Ninho! Total: " + string(meus_ingredientes.calda_ninho));
                break;
				
			 case oCaldaMorango:
                meus_ingredientes.calda_morango += 1;
                show_debug_message("Coletou Calda de Morango! Total: " + string(meus_ingredientes.calda_morango));
                break;
			
			case oCaldaChocolate:
                meus_ingredientes.calda_chocolate += 1;
                show_debug_message("Coletou Calda de Chocolate! Total: " + string(meus_ingredientes.calda_chocolate));
                break;
				
             case oBoloRedVelvet:
                meus_ingredientes.bolo_redvelvet += 1;
                show_debug_message("Coletou Bolo Red Velvet! Total: " + string(meus_ingredientes.bolo_redvelvet));
                 break;
				 
             case oBoloCenoura:
                meus_ingredientes.bolo_cenoura += 1;
                show_debug_message("Coletou Bolo de Cenoura! Total: " + string(meus_ingredientes.bolo_cenoura));
                 break;
				 
             case oBoloChocolate:
                meus_ingredientes.bolo_chocolate += 1;
                show_debug_message("Coletou Bolo de Chocolate! Total: " + string(meus_ingredientes.bolo_chocolate));
                 break;
				 
		     case oCookie:
                meus_ingredientes.cookie += 1;
                show_debug_message("Coletou Cookie! Total: " + string(meus_ingredientes.cookie));
                 break;
            
		 	case oAgua:
                meus_ingredientes.agua += 1;
                show_debug_message("Coletou Água! Total: " + string(meus_ingredientes.agua));
                 break;
				 
		 	case oCafe:
                meus_ingredientes.cafe+= 1;
                show_debug_message("Coletou Café! Total: " + string(meus_ingredientes.cafe));
                 break;
				 
		 	case oChocolateQuente:
                meus_ingredientes.chocolate_quente += 1;
                show_debug_message("Coletou Chocolate Quente! Total: " + string(meus_ingredientes.chocolate_quente));
                 break;
				 
		 	case oSucoLaranja:
                meus_ingredientes.suco_laranja += 1;
                show_debug_message("Coletou Suco de Laranja! Total: " + string(meus_ingredientes.suco_laranja));
                 break;
				 
		 	case oSucoMorango:
                meus_ingredientes.suco_morango += 1;
                show_debug_message("Coletou Suco de Morango! Total: " + string(meus_ingredientes.suco_morango));
                 break;
				 
		 	case oSucoLimao:
                meus_ingredientes.suco_limao += 1;
                show_debug_message("Coletou Suco de Limão! Total: " + string(meus_ingredientes.suco_limao));
                 break;
				 
		 	case oSucoUva:
                meus_ingredientes.suco_uva += 1;
                show_debug_message("Coletou Suco de Uva! Total: " + string(meus_ingredientes.suco_uva));
                 break;
				 
				 
            // Lógica de interação com a Cozinha
            case oCozinhaFake:
                if (item_carregando == noone) { // Só interage se não estiver carregando nada
                    if (_inst_clicada.estado_fogao == "disponivel") {
                        var _pode_cozinhar_algo = false;
                        for (var i = 0; i < array_length(global.receitas); i++) {
                            var _receita_atual = global.receitas[i];
                            var _pode_fazer_esta_receita = true;
                            var _ingredientes_da_receita = _receita_atual.ingredientes;
                            var _nomes_ingr_receita = variable_struct_get_names(_ingredientes_da_receita);

                            for (var j = 0; j < array_length(_nomes_ingr_receita); j++) {
                                var _nome_ingrediente = _nomes_ingr_receita[j];
                                var _qtd_necessaria = _ingredientes_da_receita[$ _nome_ingrediente];
                                if (!variable_struct_exists(meus_ingredientes, _nome_ingrediente) || meus_ingredientes[$ _nome_ingrediente] < _qtd_necessaria) {
                                    _pode_fazer_esta_receita = false;
                                    break;
                                }
                            }

                            if (_pode_fazer_esta_receita) {
                                for (var j = 0; j < array_length(_nomes_ingr_receita); j++) {
                                    var _nome_ingrediente = _nomes_ingr_receita[j];
                                    var _qtd_necessaria = _ingredientes_da_receita[$ _nome_ingrediente];
                                    meus_ingredientes[$ _nome_ingrediente] -= _qtd_necessaria;
                                }

                                // Verifica se a receita é instantânea (tempo_fogao: 0)
                                if (variable_struct_exists(_receita_atual, "tempo_fogao") && _receita_atual.tempo_fogao > 0) {
                                    _inst_clicada.estado_fogao = "assando";
                                    _inst_clicada.produto_pronto = _receita_atual.nome;
                                    _inst_clicada.timer_fogao = _receita_atual.tempo_fogao;
                                    show_debug_message("Cozinhando: " + string(_inst_clicada.produto_pronto));
                                } else {
                                    // Receita instantânea
                                    item_carregando = _receita_atual.nome;
                                    show_debug_message("Preparou item instantâneo: " + string(item_carregando));
                                }
                                
                                _pode_cozinhar_algo = true;
                                break;
                            }
                        }
                        if (!_pode_cozinhar_algo) {
                            show_debug_message("Faltam ingredientes para qualquer receita!");
                        }
                    } else if (_inst_clicada.estado_fogao == "pronto") {
                        item_carregando = _inst_clicada.produto_pronto;
                        _inst_clicada.produto_pronto = noone;
                        _inst_clicada.estado_fogao = "disponivel";
                        show_debug_message("Pegou do fogão: " + string(item_carregando));
                    }
                }
                break;
        }
    }
}


// --- INTERAÇÕES COM A TECLA "E" (ENTREGAR PEDIDO) ---
if (keyboard_check_pressed(ord("E"))) {
    if (item_carregando != noone) {
        var _cliente_em_colisao = instance_place(x, y, oNPCgatoLaranja);
        if (_cliente_em_colisao != noone) {
            if ((_cliente_em_colisao.estado == "esperando_pedido" || _cliente_em_colisao.estado == "sentado_pedindo") &&
                _cliente_em_colisao.meu_pedido_nome == item_carregando) {
                
                // >>>>> INÍCIO DA MUDANÇA: LÓGICA DE PONTUAÇÃO POR TEMPO <<<<<
                
                var pontos_ganhos = 0;
                var _tempo_restante_frames = _cliente_em_colisao.timer_entrega;
                var _tempo_total_frames = _cliente_em_colisao.tempo_max_espera_segundos * game_get_speed(gamespeed_fps);
                var _porcentagem_restante = 0;
                
                if (_tempo_total_frames > 0) {
                    _porcentagem_restante = _tempo_restante_frames / _tempo_total_frames;
                }
                
                // Define a pontuação baseada na porcentagem de tempo que sobrou
                // << VOCÊ PODE AJUSTAR ESTES VALORES E PONTOS COMO QUISER >>
                if (_porcentagem_restante > 0.7) { // Mais de 70% do tempo sobrou
                    pontos_ganhos = 15;
                    show_debug_message("Entrega ÓTIMA! +" + string(pontos_ganhos) + " pontos.");
                }
                else if (_porcentagem_restante > 0.3) { // Entre 30% e 70% do tempo sobrou
                    pontos_ganhos = 10;
                    show_debug_message("Entrega BOA. +" + string(pontos_ganhos) + " pontos.");
                }
                else { // Menos de 30% do tempo sobrou (mas ainda dentro do prazo)
                    pontos_ganhos = 5;
                    show_debug_message("Entrega RUIM... mas a tempo. +" + string(pontos_ganhos) + " pontos.");
                }

                global.pontos += pontos_ganhos;
                
                // >>>>> FIM DA MUDANÇA: LÓGICA DE PONTUAÇÃO POR TEMPO <<<<<
                
                // Continua com as ações de entrega bem-sucedida:
                _cliente_em_colisao.estado = "recebeu_pedido";
                item_carregando = noone;
            }
        }
    }
}