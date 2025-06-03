// oMusicaController - Evento Step

var musica_desejada = noone;
var nome_da_room_de_menu = Menu; // Substitua pelo nome da sua room de menu

// 1. Determinar qual música deve tocar
if (global.pause) {
    musica_desejada = musica_pausa;
} else {
    if (room == nome_da_room_de_menu) {
        musica_desejada = musica_menu;
    } else {
        musica_desejada = musica_jogo;
    }
}

// 2. Gerenciar a transição e execução da música

var nome_musica_atual_para_debug = "Nenhuma/Inválida";
if (musica_atual != noone && audio_exists(musica_atual)) {
    nome_musica_atual_para_debug = audio_get_name(musica_atual);
}

var musica_desejada_e_valida = (musica_desejada != noone && audio_exists(musica_desejada));

if (musica_desejada_e_valida) {
    if (musica_atual != musica_desejada) { // Se a música precisa mudar
        // Para a música atual (se existir, for válida e estiver tocando)
        if (musica_atual != noone && audio_exists(musica_atual) && audio_is_playing(musica_atual)) {
            audio_stop_sound(musica_atual);
            show_debug_message("oMusicaController: Música parada - " + nome_musica_atual_para_debug);
        }
        
        // Toca a nova música
        audio_play_sound(musica_desejada, prioridade_musica, true); // true para loop
        musica_atual = musica_desejada;
        show_debug_message("oMusicaController: Música iniciada - " + audio_get_name(musica_desejada));

    } else if (!audio_is_playing(musica_atual)) { // Mesma música, mas não está tocando (ex: primeiro frame)
        audio_play_sound(musica_atual, prioridade_musica, true);
        show_debug_message("oMusicaController: Música (re)iniciada (não estava tocando) - " + nome_musica_atual_para_debug);
    }
    // Se musica_atual == musica_desejada E audio_is_playing(musica_atual) -> não faz nada, já está tocando.

} else { // Nenhuma música é desejada ou a música desejada não é válida
    // Para a música atual (se existir, for válida e estiver tocando)
    if (musica_atual != noone && audio_exists(musica_atual) && audio_is_playing(musica_atual)) {
        audio_stop_sound(musica_atual);
        show_debug_message("oMusicaController: Música parada (nenhuma desejada/inválida) - " + nome_musica_atual_para_debug);
        musica_atual = noone;
    }
    // Se musica_desejada não for 'noone' mas não for válida, a mensagem de erro do Create Event já deve ter alertado.
    // Poderíamos adicionar um alerta aqui também, se desejado.
    if (musica_desejada != noone && !audio_exists(musica_desejada)){
        show_debug_message("oMusicaController: ALERTA no Step! 'musica_desejada' (valor: " + string(musica_desejada) + ") não é um som válido.");
    }
}