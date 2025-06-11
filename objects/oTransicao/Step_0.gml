// Em obj_Transicao - Evento Step

switch (estado) {

    case "fade_out": // Escurecendo a tela
        // Aumenta a transparência até chegar em 1 (totalmente preto)
        alpha_fade = min(1, alpha_fade + velocidade_fade);

        // Quando a tela estiver totalmente preta...
        if (alpha_fade == 1) {
            // ...muda para a sala de destino...
            room_goto(room_alvo);

            // ...e inicia o processo de clarear (fade in).
            estado = "fade_in";
        }
        break;

    case "fade_in": // Clareando a tela
        // Diminui a transparência até chegar em 0 (totalmente visível)
        alpha_fade = max(0, alpha_fade - velocidade_fade);

        // Quando a tela estiver totalmente visível, a transição acaba.
        if (alpha_fade == 0) {
            estado = "inativo";
        }
        break;
}