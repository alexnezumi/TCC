// O timer só avança se o jogo não estiver pausado
if (!global.pause && timer_dia_frames > 0) {
    timer_dia_frames--; // Diminui 1 frame do tempo restante
} 
else if (!global.pause && timer_dia_frames == 0) { // O tempo acabou!
    
    show_debug_message("Fim do Dia " + string(global.dia_atual_numero) + "!");
    
    // Avança para o próximo número do dia
    global.dia_atual_numero++;

    // Ação para quando o dia acaba: ir para a próxima sala
    if (room_exists(room_next(room))) { // Verifica se existe uma "próxima sala" na ordem do Gerenciador de Salas
        show_debug_message("Indo para a próxima sala para iniciar o Dia " + string(global.dia_atual_numero));
        room_goto_next();
    } else {
        show_debug_message("Não há próxima sala! Fim do jogo.");
        // Se não houver próxima sala, você pode ir para uma tela de final de jogo ou voltar ao menu
        // Exemplo: room_goto(rm_fim_de_jogo);
    }
    
    // Define o timer como -1 para impedir que este bloco seja executado novamente antes da transição da sala
    timer_dia_frames = -1; 
}// obj_controlador_principal - Evento Etapa
else if (!global.pause && timer_dia_frames == 0) { 
    
    show_debug_message("Fim do Dia " + string(global.dia_atual_numero) + "!");
    
    global.dia_atual_numero++;

    // --- AÇÃO PARA MUDAR DE SALA ---
    // A função room_goto_next() vai para a próxima sala na ordem do Gerenciador de Salas
    if (room_exists(room_next(room))) {
        show_debug_message("Indo para a próxima sala...");
        room_goto(Final); // <<< ESTA É A LINHA QUE MUDA A SALA
    } else {
        show_debug_message("Não há próxima sala definida no Gerenciador de Salas!");
        // Ação alternativa se não houver próxima sala (ex: voltar ao menu)
        // room_goto(rm_menu_principal); 
    }
    
    timer_dia_frames = -1; 
}
// -----------------------------