
//pause do jogo 
if (global.pause) exit;

// Movimento
// Controles de movimento simples

var tecla_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
var tecla_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
var tecla_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
var tecla_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));

var _mov_x = (tecla_direita - tecla_esquerda) * velocidade;
var _mov_y = (tecla_baixo - tecla_cima) * velocidade;

x += _mov_x;
y += _mov_y;


// Virar sprite horizontalmente
if (tecla_direita) {
    image_xscale = -2;
}
if (tecla_esquerda) {
    image_xscale = 2;
}

// Colisão
if (place_meeting(x + velh, y, oColisores)) {
    while (!place_meeting(x + sign(velh), y, oColisores)) {
        x += sign(velh);
    }
    velh = 0;
}
x += velh;

if (place_meeting(x, y + velv, oColisores)) {
    while (!place_meeting(x, y + sign(velv), oColisores)) {
        y += sign(velv);
    }
    velv = 0;
}
y += velv;

// Interação para coletar ingredientes
if (keyboard_check_pressed(ord("E"))) { // Tecla de ação
    var _inst_oleo = instance_place(x, y, oOleo);
    if (_inst_oleo != noone) {
        meus_ingredientes.oleo += 1;
        show_debug_message("Coletou Oleo! Total: " + string(meus_ingredientes.oleo));
    }

    var _inst_panela = instance_place(x, y, oPanela);
    if (_inst_panela != noone) {
        meus_ingredientes.panela += 1;
        show_debug_message("Coletou panela! Total: " + string(meus_ingredientes.panela));
    }
    // Adicione mais 'else if' para outros ingredientes
	
	// ... (código de coletar ingredientes acima)

var _inst_forno = instance_place(x, y, oCozinhaFake);
if (_inst_forno != noone) {
    if (_inst_forno.estado_fogao == "disponivel" && item_carregando == noone) {
		
        // Tentar assar algo - por simplicidade, vamos tentar assar a primeira receita que tivermos ingredientes
        for (var i = 0; i < array_length(global.receitas); i++) {
            var _receita_atual = global.receitas[i];
            var _pode_assar = true;
            var _ingredientes_da_receita = _receita_atual.ingredientes;

            // Verifica se tem todos os ingredientes para esta receita
            var _vars_ingredientes_receita = variable_struct_get_names(_ingredientes_da_receita);
            for (var j = 0; j < array_length(_vars_ingredientes_receita); j++) {
                var _nome_ingrediente = _vars_ingredientes_receita[j];
                var _qtd_necessaria = _ingredientes_da_receita[$ _nome_ingrediente];
                if (!variable_struct_exists(meus_ingredientes, _nome_ingrediente) || meus_ingredientes[$ _nome_ingrediente] < _qtd_necessaria) {
                    _pode_assar = false;
                    break;
                }
            }

            if (_pode_assar) {
                // Consumir ingredientes
                for (var j = 0; j < array_length(_vars_ingredientes_receita); j++) {
                    var _nome_ingrediente = _vars_ingredientes_receita[j];
                    var _qtd_necessaria = _ingredientes_da_receita[$ _nome_ingrediente];
                    meus_ingredientes[$ _nome_ingrediente] -= _qtd_necessaria;
                }

                // Iniciar o forno
                _inst_forno.estado_fogao = "assando";
                _inst_forno.produto_pronto = _receita_atual.nome;
                _inst_forno.timer_fogao = _receita_atual.tempo_fogao;
                show_debug_message("Assando: " + _inst_forno.produto_pronto);
                break; 
				// Assa apenas uma receita por vez
            }
        }
        if (!_pode_assar) { // Se saiu do loop e não pode assar nada
             show_debug_message("Faltam ingredientes para qualquer receita!");
        }

    } else if (_inst_forno.estado_fogao == "pronto" && item_carregando == noone) {
        item_carregando = _inst_forno.produto_pronto;
        _inst_forno.produto_pronto = noone;
        _inst_forno.estado_fogao = "disponivel";
        show_debug_message("Pegou: " + item_carregando);
    }
}
// ... (código de coletar ingredientes e forno acima) ...

	var _inst_balcao = instance_place(x, y, oCadeira);
	if (_inst_balcao != noone && item_carregando != noone) {
	    // Tenta entregar para um cliente no balcão ou colocar no balcão
	    var _cliente_atendido = false;
	    var _lista_clientes_esperando = ds_list_create();
	    instance_place_list(oCadeira.x, oCadeira.y, oNPCgatoLaranja, _lista_clientes_esperando, false); // Pega clientes próximos ao balcão

	    for (var i = 0; i < ds_list_size(_lista_clientes_esperando); i++) {
	        var _cliente_id = _lista_clientes_esperando[| i];
	        if (_cliente_id.estado == "esperando_pedido" && _cliente_id.meu_pedido_nome == item_carregando) {
	            _cliente_id.estado = "recebeu_pedido";
	            show_debug_message("Cliente atendido com: " + item_carregando);
	            // Aqui você adicionaria pontos, dinheiro, etc.
	            // Ex: obj_controlador.pontos += 10;

	            item_carregando = noone; // Esvazia as mãos do padeiro
	            _cliente_atendido = true;
	            break; // Atendeu um cliente
	        }
	    }
	    ds_list_destroy(_lista_clientes_esperando);

	    if (!_cliente_atendido) {
	        // Se não atendeu um cliente específico, deixa no balcão (opcional)
	        // Para esta versão simples, vamos apenas dizer que não pode colocar se não for para um cliente
	        // ou podemos implementar uma lista de itens no balcão
	        show_debug_message("Nenhum cliente quer '" + item_carregando + "' agora ou balcão cheio.");
	        // Para uma mecânica de "deixar no balcão":
	        // if (ds_list_size(global.produtos_prontos_no_balcao) < 3) { // Limite de 3 itens no balcão
	        //    ds_list_add(global.produtos_prontos_no_balcao, item_carregando);
	        //    show_debug_message("Deixou " + item_carregando + " no balcão.");
	        //    item_carregando = noone;
	        // } else {
	        //    show_debug_message("Balcão cheio!");
	        // }
	    }
	}
	}
