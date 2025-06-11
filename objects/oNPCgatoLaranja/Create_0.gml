// oNPCgatoLaranja - Evento Criar
show_debug_message("oNPCgatoLaranja (ID: " + string(id) + ") - CREATE EVENT INICIADO");

// --- ESCOLHER UM TIPO DE CLIENTE ALEATORIAMENTE ---
var _lista_tipos = global.tipos_de_cliente;
var _num_tipos = array_length(_lista_tipos);

// Escolhe um índice aleatório da lista de tipos de cliente
var _tipo_escolhido_idx = irandom(_num_tipos - 1);
// Pega o struct do tipo de cliente escolhido
var _meu_tipo_de_sprite = _lista_tipos[_tipo_escolhido_idx];
// ----------------------------------------------------


// --- CONFIGURAR SPRITES DESTE NPC ESPECÍFICO ---
// As variáveis de sprite agora pegam os valores do tipo que foi sorteado
sprite_pedindo = _meu_tipo_de_sprite.pedindo;
sprite_feliz = _meu_tipo_de_sprite.feliz;
sprite_bravo = _meu_tipo_de_sprite.bravo;

// Define o sprite inicial do NPC
sprite_index = sprite_pedindo;
// ------------------------------------------------

meu_pedido_nome = noone;
estado = "buscando_cadeira"; // Ou o estado inicial que você estiver usando
velocidade_cliente = 5;

minha_cadeira_id = noone;
alvo_x = x;
alvo_y = y;

tempo_max_espera_segundos = 25;
timer_entrega = 0;


// --- ESCOLHER UM PEDIDO ALEATÓRIO (como tínhamos antes) ---
if (variable_global_exists("receitas") && array_length(global.receitas) > 0) {
    var _receita_aleatoria_idx = irandom(array_length(global.receitas) - 1);
    meu_pedido_nome = global.receitas[_receita_aleatoria_idx].nome;
} else {
    show_debug_message("ERRO CRÍTICO para oNPCgatoLaranja (ID: " + string(id) + "): global.receitas não existe ou está vazia! NPC será destruído.");
    instance_destroy();
    exit;
}

show_debug_message("oNPCgatoLaranja (ID: " + string(id) + ") - CREATE EVENT CONCLUÍDO. Sprite: " + sprite_get_name(sprite_index) + ". Pedido: " + meu_pedido_nome);