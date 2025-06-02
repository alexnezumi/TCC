meu_pedido_nome = noone;
estado = "chegando"; // "chegando", "esperando_pedido", "recebeu_pedido", "saindo"
alvo_x = oCadeira.x - 60; // Posição de espera no balcão (ajuste)
alvo_y = oCadeira.y;
velocidade_cliente = 5;

// Escolher um pedido aleatório
if (array_length(global.receitas) > 0) {
    var _receita_aleatoria_idx = irandom(array_length(global.receitas) - 1);
    meu_pedido_nome = global.receitas[_receita_aleatoria_idx].nome;
} else {
    // Sem receitas definidas, não pode pedir nada
    instance_destroy(); // Ou tratar de outra forma
    exit;
}
show_debug_message("Novo cliente quer: " + meu_pedido_nome);