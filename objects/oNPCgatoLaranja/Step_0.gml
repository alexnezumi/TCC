switch (estado) {
    case "chegando":
        if (point_distance(x, y, alvo_x, alvo_y) > velocidade_cliente) {
            move_towards_point(alvo_x, alvo_y, velocidade_cliente);
        } else {
            x = alvo_x;
            y = alvo_y;
            speed = 0; // Para o movimento do move_towards_point
            estado = "esperando_pedido";
        }
        break;

    case "esperando_pedido":
        // Apenas espera
        break;

    case "recebeu_pedido":
        // Poderia ter uma animação de feliz aqui
        alarm [0] = 1 * game_get_speed(gamespeed_fps); // Espera 2 segundos antes de sair
        estado = "saindo_anim"; // Estado intermediário para não disparar o alarme de novo
        break;

    case "saindo_anim":
        // Apenas esperando o alarme
        break;

    case "saindo":
        // Mover para fora da tela e destruir
        if (y < room_height + 60) { // Supondo que saem por baixo
            y += velocidade_cliente;
        } else {
            instance_destroy();
        }
        break;
}