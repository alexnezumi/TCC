// oNPCgatoLaranja - Evento Create
show_debug_message("oNPCgatoLaranja (ID: " + string(id) + ") - CREATE EVENT INICIADO em x=" + string(x) + ", y=" + string(y));

meu_pedido_nome = noone;
estado = "caminhando_reto_inicial";
velocidade_cliente = 5;

// << AJUSTE ESTE VALOR DE X CONFORME NECESSÁRIO >>
x_alvo_caminhada_reta = 1100;

minha_cadeira_id = noone;
alvo_x = x;
alvo_y = y;

tempo_max_espera_segundos = 10;
timer_entrega = 0;
sprite_pedindo = sprite_index;
sprite_feliz = sNPCgatoLaranjaFeliz; // << SUBSTITUA
sprite_bravo = sNPCgatosBravos; // << SUBSTITUA

if (variable_global_exists("receitas") && array_length(global.receitas) > 0) {
    var _receita_aleatoria_idx = irandom(array_length(global.receitas) - 1);
    meu_pedido_nome = global.receitas[_receita_aleatoria_idx].nome;
} else {
    show_debug_message("ERRO CRÍTICO para oNPCgatoLaranja (ID: " + string(id) + "): global.receitas não existe ou está vazia! NPC será destruído.");
    instance_destroy();
    exit;
}

// A linha abaixo que definia image_xscale foi REMOVIDA:
// image_xscale = -2; 

show_debug_message("oNPCgatoLaranja (ID: " + string(id) + ") quer: " + meu_pedido_nome + ". Estado: " + estado + ". Alvo reto: x=" + string(x_alvo_caminhada_reta));