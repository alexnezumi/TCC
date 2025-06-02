if (estado_fogao == "assando") {
    timer_fogao--;
    if (timer_fogao <= 0) {
        estado_fogao = "pronto";
        show_debug_message(produto_pronto + " está pronto!");
    }
}
