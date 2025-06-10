// Em oCozinha - Evento Step

// Contagem regressiva para itens no fogão
if (estado_fogao == "assando") {
    timer_fogao--;
    if (timer_fogao <= 0) {
        estado_fogao = "pronto";
        show_debug_message(produto_pronto + " está pronto!");
    }
}

// Contagem regressiva para a mensagem de status
if (timer_mostrar_status > 0) {
    timer_mostrar_status--;
}