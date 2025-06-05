// oPlayer - Evento Step

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

// Virar sprite horizontalmente
if (velh_atual > 0) {
    image_xscale = -2; // Ou o valor que você usa para virar para a direita (ex: 1 ou abs(image_xscale))
} else if (velh_atual < 0) {
    image_xscale = 2; // Ou o valor que você usa para virar para a esquerda (ex: -1 ou -abs(image_xscale))
}

// --- COLISÃO ---
if (place_meeting(x + velh_atual, y, oColisores)) {
    while (!place_meeting(x + sign(velh_atual), y, oColisores)) {
        x += sign(velh_atual);
    }
    velh_atual = 0;
}
x += velh_atual;

if (place_meeting(x, y + velv_atual, oColisores)) {
    while (!place_meeting(x, y + sign(velv_atual), oColisores)) {
        y += sign(velv_atual);
    }
    velv_atual = 0;
}
y += velv_atual;

// --- INTERAÇÕES COM O BOTÃO ESQUERDO DO MOUSE (mb_left) ---
if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;
    var _interagiu_com_algo_no_mouse = false; // Flag para evitar múltiplas ações com um clique

    // 1. Tenta Coletar Ingredientes
    if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_panela_clicada = instance_position(_mx, _my, oPanela);
        if (_inst_panela_clicada != noone) {
            meus_ingredientes.panela += 1;
            show_debug_message("Coletou Panela com mouse! Total: " + string(meus_ingredientes.panela));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
        }
    }
	  if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_rosquinha_clicada = instance_position(_mx, _my, oRosquinha);
        if (_inst_rosquinha_clicada != noone) {
            meus_ingredientes.rosquinha += 1;
            show_debug_message("Coletou Rosquinha com mouse! Total: " + string(meus_ingredientes.rosquinha));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
        }
	  }
	    if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_calda_ninho_clicada = instance_position(_mx, _my, oCaldaNinho);
        if (_inst_calda_ninho_clicada != noone) {
            meus_ingredientes.calda_ninho += 1;
            show_debug_message("Coletou Calda ninho com mouse! Total: " + string(meus_ingredientes.calda_ninho));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	    if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_calda_chocolate_clicada = instance_position(_mx, _my, oCaldaChocolate);
        if (_inst_calda_chocolate_clicada != noone) {
            meus_ingredientes.calda_chocolate += 1;
            show_debug_message("Coletou Calda chocolate com mouse! Total: " + string(meus_ingredientes.calda_chocolate));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	    if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_calda_morango_clicada = instance_position(_mx, _my, oCaldaMorango);
        if (_inst_calda_morango_clicada != noone) {
            meus_ingredientes.calda_morango += 1;
            show_debug_message("Coletou Calda morango com mouse! Total: " + string(meus_ingredientes.calda_morango));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	    if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_massa_clicada = instance_position(_mx, _my, oMassa);
        if (_inst_massa_clicada != noone) {
            meus_ingredientes.massa += 1;
            show_debug_message("Coletou Massa com mouse! Total: " + string(meus_ingredientes.massa));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	   if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_frango_clicada = instance_position(_mx, _my, oFrago);
        if (_inst_frango_clicada != noone) {
            meus_ingredientes.frango += 1;
            show_debug_message("Coletou Frango com mouse! Total: " + string(meus_ingredientes.frango));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	   if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_massa_clicada = instance_position(_mx, _my, oMassa);
        if (_inst_massa_clicada != noone) {
            meus_ingredientes.massa += 1;
            show_debug_message("Coletou Massa com mouse! Total: " + string(meus_ingredientes.massa));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	   if (!_interagiu_com_algo_no_mouse) { // Só tenta o próximo se não interagiu com o anterior
        var _inst_forma_clicada = instance_position(_mx, _my, oForma);
        if (_inst_forma_clicada != noone) {
            meus_ingredientes.forma += 1;
            show_debug_message("Coletou Forma com mouse! Total: " + string(meus_ingredientes.forma));
            // Se oPanela é um item que desaparece: with (_inst_panela_clicada) { instance_destroy(); }
            _interagiu_com_algo_no_mouse = true;
		}
	  }
	  
    // Adicione mais 'if (!_interagiu_com_algo_no_mouse) { var _inst_outro = ... }' para outros ingredientes

    // 2. Tenta Interagir com a Cozinha (Fogão) - Só se não pegou ingrediente e não está carregando nada
    if (!_interagiu_com_algo_no_mouse && item_carregando == noone) {
        var _inst_cozinha_clicada = instance_position(_mx, _my, oCozinhaFake);
        if (_inst_cozinha_clicada != noone) {
            _interagiu_com_algo_no_mouse = true; // Marcou que interagiu com a cozinha
            show_debug_message("Clicou em oCozinhaFake ID: " + string(_inst_cozinha_clicada));

            if (_inst_cozinha_clicada.estado_fogao == "disponivel") {
                // Tentar INICIAR o cozimento de uma receita
                var _pode_cozinhar_algo = false;
                if (array_length(global.receitas) > 0) {
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
                            _inst_cozinha_clicada.estado_fogao = "assando";
                            _inst_cozinha_clicada.produto_pronto = _receita_atual.nome;
                            _inst_cozinha_clicada.timer_fogao = _receita_atual.tempo_fogao;
                            show_debug_message("Cozinhando: " + string(_inst_cozinha_clicada.produto_pronto));
                            _pode_cozinhar_algo = true;
                            break;
                        }
                    }
                }
                if (!_pode_cozinhar_algo) {
                    show_debug_message("Faltam ingredientes para qualquer receita ou não há receitas!");
                }
            } else if (_inst_cozinha_clicada.estado_fogao == "pronto") {
                // Tentar PEGAR o item pronto
                item_carregando = _inst_cozinha_clicada.produto_pronto;
                _inst_cozinha_clicada.produto_pronto = noone;
                _inst_cozinha_clicada.estado_fogao = "disponivel";
                show_debug_message("Pegou do fogão: " + string(item_carregando));
            }
        }
    }
} // Fim das interações com mouse_check_button_pressed(mb_left)


// --- INTERAÇÕES COM A TECLA "E" (APENAS PARA ENTREGAR PEDIDO) ---
if (keyboard_check_pressed(ord("E"))) {
    if (item_carregando != noone) { // Só tenta entregar se estiver carregando algo
        var _dist_max_entrega = 64; // Distância máxima para interagir com cliente (ajuste)
        var _cliente_alvo = instance_nearest(x, y, oNPCgatoLaranja); // Encontra o cliente mais próximo

        if (instance_exists(_cliente_alvo) && distance_to_object(_cliente_alvo) < _dist_max_entrega) {
            // Verifica se o cliente está no estado correto e se o pedido bate
            if ((_cliente_alvo.estado == "esperando_pedido" || _cliente_alvo.estado == "sentado_pedindo") &&
                _cliente_alvo.meu_pedido_nome == item_carregando) {

                _cliente_alvo.estado = "recebeu_pedido"; // Cliente muda seu estado
                show_debug_message("Cliente " + string(_cliente_alvo) + " atendido com: " + string(item_carregando));
                // Adicionar pontos, dinheiro etc. aqui
                // Ex: if (instance_exists(obj_controlador)) { obj_controlador.pontos += 10; }
                item_carregando = noone; // Esvazia as mãos do jogador

            } else if (_cliente_alvo.meu_pedido_nome != item_carregando) {
                show_debug_message("Item [" + string(item_carregando) + "] não é o que o cliente " + string(_cliente_alvo) + " quer (quer: [" + string(_cliente_alvo.meu_pedido_nome) + "]).");
            } else {
                 show_debug_message("Cliente " + string(_cliente_alvo) + " não está no estado de receber pedido. Estado atual: " + string(_cliente_alvo.estado));
            }
        } else {
            show_debug_message("Nenhum cliente oNPCgatoLaranja próximo o suficiente ou em estado de pedir para entregar " + string(item_carregando));
        }
    } else {
        show_debug_message("Tecla E pressionada, mas jogador não está carregando nenhum item para entregar.");
    }
} // Fim das interações com keyboard_check_pressed(ord("E"))