//#################################################################
// oPlayer - Evento Etapa (Step) - VERSÃO FINAL COMPLETA
//#################################################################

// --- 1. VERIFICAÇÃO DE PAUSE ---
// Se o jogo está pausado, nada abaixo será executado.
if (global.pause) {
    exit;
}

// --- 2. LÓGICA DE MOVIMENTO E CORRIDA ---
// Verifica se o jogador está correndo
if (keyboard_check(vk_shift)) {
    velocidade = velocidade_correndo; // Usa a velocidade de corrida
} else {
    velocidade = velocidade_caminhando; // Usa a velocidade de caminhada
}

// Pega a entrada do teclado para o movimento
var tecla_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
var tecla_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
var tecla_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
var tecla_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));

// Calcula a velocidade horizontal e vertical
var velh_atual = (tecla_direita - tecla_esquerda) * velocidade;
var velv_atual = (tecla_baixo - tecla_cima) * velocidade;

// Vira o sprite do jogador com base na direção
if (velh_atual > 0) { image_xscale = -2; }
else if (velh_atual < 0) { image_xscale = 2; }

// Lógica de colisão horizontal
if (place_meeting(x + velh_atual, y, oColisores)) {
    while (!place_meeting(x + sign(velh_atual), y, oColisores)) { x += sign(velh_atual); }
    velh_atual = 0;
}
x += velh_atual;

// Lógica de colisão vertical
if (place_meeting(x, y + velv_atual, oColisores)) {
    while (!place_meeting(x, y + sign(velv_atual), oColisores)) { y += sign(velv_atual); }
    velv_atual = 0;
}
y += velv_atual;


// --- 3. LÓGICA DE INTERAÇÃO COM CLIQUE DO MOUSE ---
if (mouse_check_button_pressed(mb_left)) {
    
    var _mx = mouse_x;
    var _my = mouse_y;
    
    // A ORDEM DAS VERIFICAÇÕES ABAIXO É MUITO IMPORTANTE!
    
    // PRIORIDADE 1: TENTAR ENTREGAR UM PEDIDO PRONTO
    if (item_carregando != noone) {
        var _cliente_clicado = instance_position(_mx, _my, oNPCgatoLaranja);
        if (instance_exists(_cliente_clicado) && _cliente_clicado.estado == "esperando_pedido") {
            if (point_distance(x, y, _cliente_clicado.x, _cliente_clicado.y) <= distancia_max_entrega) {
                if (item_carregando == _cliente_clicado.meu_pedido_nome) {
                    
                    // <<< O CÓDIGO DE PONTOS FOI REINSERIDO AQUI >>>
                    var pontos_ganhos = 0;
                    var _tempo_total = _cliente_clicado.tempo_max_espera_segundos * game_get_speed(gamespeed_fps);
                    var _porcentagem_restante = 0;
                    if (_tempo_total > 0) { _porcentagem_restante = _cliente_clicado.timer_entrega / _tempo_total; }

                    if (_porcentagem_restante > 0.7) { pontos_ganhos = 15; }
                    else if (_porcentagem_restante > 0.3) { pontos_ganhos = 10; }
                    else { pontos_ganhos = 5; }

                    global.pontos += pontos_ganhos;
                    show_debug_message("ENTREGA CORRETA! Pontos ganhos: +" + string(pontos_ganhos) + ". Total: " + string(global.pontos));
                    
                    // O resto da lógica de entrega...
                    _cliente_clicado.estado = "recebeu_pedido";
                    item_carregando = noone;
                    exit;
                }
            }
        }
    }
    
    // PRIORIDADE 2: TENTAR USAR A LIXEIRA
    if (item_carregando != noone || !inventario_esta_vazio()) {
        var _lixeira_clicada = instance_position(_mx, _my, oLixo); // << Use o nome do seu objeto de lixo
        if (instance_exists(_lixeira_clicada)) {
            if (point_distance(x, y, _lixeira_clicada.x, _lixeira_clicada.y) <= distancia_max_entrega) {
                if (item_carregando != noone) { item_carregando = noone; }
                limpar_ingredientes();
                exit;
            }
        }
    }
    
    // PRIORIDADE 3: TENTAR USAR A COZINHA (COZINHAR OU PEGAR)
    var _cozinha_clicada = instance_position(_mx, _my, oCozinhaFake); // << Use o nome do seu objeto de cozinha
    if (instance_exists(_cozinha_clicada)) {
        if (_cozinha_clicada.estado_fogao == "disponivel") {
            var _resultado_cozinha = _cozinha_clicada.tentar_cozinhar(inventario_ingredientes);
            if (_resultado_cozinha != false) {
                inventario_ingredientes = [];
                if (is_string(_resultado_cozinha) && _resultado_cozinha != "cozinhando") {
                    item_carregando = _resultado_cozinha;
                }
                exit;
            }
        }
        else if (_cozinha_clicada.estado_fogao == "pronto" && item_carregando == noone) {
            item_carregando = _cozinha_clicada.produto_pronto;
            _cozinha_clicada.produto_pronto = noone;
            _cozinha_clicada.estado_fogao = "disponivel";
            exit;
        }
    }
    
    // PRIORIDADE 4: TENTAR COLETAR UM INGREDIENTE NOVO
    var _ingrediente_clicado = instance_position(_mx, _my, oIngredientePai);
    if (instance_exists(_ingrediente_clicado)) {
        if (array_length(inventario_ingredientes) < limite_inventario) {
            var _nome_ingr = _ingrediente_clicado.nome_ingrediente;
            var _ja_possui = false;
            for (var i = 0; i < array_length(inventario_ingredientes); i++) {
                if (inventario_ingredientes[i] == _nome_ingr) {
                    _ja_possui = true;
                    break;
                }
            }
            if (!_ja_possui) {
                array_push(inventario_ingredientes, _nome_ingr);
            }
        }
    }
}