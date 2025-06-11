// Em oController - Evento Step

// --- MÁQUINA DE ESTADOS DO TUTORIAL (COM CONTROLE DE PAUSE CORRIGIDO) ---
if (global.tutorial_ativo) {
    
    switch (tutorial_passo) {
        
        case 0: // Boas-vindas (aqui o jogo precisa pausar)
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Bem-vindo(a)! Vamos aprender as mecânicas básicas da cafeteria. (Pressione ENTER)";
                tutorial_passo++;
            }
            break;
            
        case 1: // Espera fechar a caixa da introdução
            if (!instance_exists(obj_CaixaDialogo)) {
                tutorial_passo++; 
            }
            break;

        // A caixa de diálogo vai aparecer, mas não vai mais pausar o jogo.
            
        case 2: // Consulta ao Livro de Receitas
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Este é o Livro de Receitas. Passe o mouse sobre ele para ver as combinações. Faça isso agora.";
            }
            if (instance_exists(oLivro) && oLivro.mouse_esta_em_cima) {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;
            
        case 3: // Pega a Massa
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Vamos fazer uma Coxinha. A receita é Massa + Frango + Panela. Primeiro, pegue a 'Massa'.";
            }
            // Use o nome exato do ingrediente (com maiúscula, como definimos antes)
            if (instance_exists(oPlayer) && array_contains(oPlayer.inventario_ingredientes, "massa")) {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;

        case 4: // Pega o Frango
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Ótimo! Agora o 'Frango'.";
            }
            if (instance_exists(oPlayer) && array_contains(oPlayer.inventario_ingredientes, "frango")) {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;

        case 5: // Pega a Panela
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Perfeito. Falta apenas a 'Panela'.";
            }
            if (instance_exists(oPlayer) && array_contains(oPlayer.inventario_ingredientes, "panela")) {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;

        case 6: // Ensina sobre a Lixeira (passo opcional)
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Se errar, você pode jogar tudo fora na Lixeira. Tente clicar nela agora para limpar seu inventário.";
            }
            // Condição: O inventário ficou vazio?
            if (instance_exists(oPlayer) && array_length(oPlayer.inventario_ingredientes) == 0) {
                 if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                 tutorial_passo++;
            }
            break;
        
        case 7: // Vai para a Cozinha
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Tudo bem. Pegue os 3 ingredientes da Coxinha novamente e clique na Cozinha para preparar.";
            }
            // Condição: Cozinha começou a assar.
            if (instance_exists(oCozinhaFake) && oCozinhaFake.estado_fogao == "assando") {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;
            
        case 8: // Espera a Coxinha Fritar
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Aguarde a contagem regressiva. Lembre-se: apenas uma receita pode ser feita por vez na cozinha.";
            }
            // Condição: O item está pronto.
            if (instance_exists(oCozinhaFake) && oCozinhaFake.estado_fogao == "pronto") {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;
            
        case 9: // Pega a Coxinha Pronta
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Clique na cozinha para pegar a Coxinha pronta.";
            }
            // Condição: Jogador está carregando a coxinha.
            if (instance_exists(oPlayer) && oPlayer.item_carregando == "Coxinha") {
                if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                tutorial_passo++;
            }
            break;

        case 10: // Apenas cria o cliente e avança o passo.
            if (!tutorial_cliente_spawned) {
                var spawn_x = 1385; var spawn_y = 290; // Use sua posição de spawn
                var _cliente_tutorial = instance_create_layer(spawn_x, spawn_y, "Instances", oNPCgatoLaranja);
                _cliente_tutorial.meu_pedido_nome = "Coxinha";
                _cliente_tutorial.tempo_max_espera_segundos = 99999;
                tutorial_cliente_spawned = true;
            }
            tutorial_passo++;
            break;

        case 11: // NOVO PASSO: Espera o cliente sentar e fazer o pedido.
            var _cliente = instance_find(oNPCgatoLaranja, 0);
            // Quando o cliente chegar no estado de espera, avançamos
            if (instance_exists(_cliente) && _cliente.estado == "esperando_pedido") {
                tutorial_passo++;
            }
            break;
            
        case 12: // NOVO PASSO: Pausa e explica a barra de paciência.
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Este cliente está esperando. A barrinha verde é a paciência dele! Entregue o pedido antes que ela acabe para ganhar mais pontos. (Pressione ENTER para continuar)";
                tutorial_passo++;
            }
            break;
            
        case 13: // NOVO PASSO: Espera o jogador ler e pressionar ENTER.
            if (!instance_exists(obj_CaixaDialogo)) {
                tutorial_passo++;
            }
            break;
            
        case 14: // Antigo passo 10: Instrução final para entregar.
            if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "Agora sim! Entregue a Coxinha para o cliente.";
            }
            // Condição para avançar: O cliente foi atendido e já saiu.
            if (tutorial_cliente_spawned && !instance_exists(oNPCgatoLaranja)) {
                 if (instance_exists(obj_CaixaDialogo)) { instance_destroy(obj_CaixaDialogo); }
                 tutorial_passo++;
            }
            break;

        // Renumeramos os passos finais
        case 15: // Finalização
             if (!instance_exists(obj_CaixaDialogo)) {
                var c = instance_create_layer(0, 0, "Instances", obj_CaixaDialogo);
                c.texto = "PARABÉNS! Você completou o tutorial. O dia vai começar de verdade agora! (Pressione ENTER para começar)";
                tutorial_passo++;
            }
            break;
            
        case 16: // Limpeza
            if (!instance_exists(obj_CaixaDialogo)) {
                global.tutorial_ativo = false;
                timer_dia_frames = global.duracao_dia_em_segundos * game_get_speed(gamespeed_fps);
                alarm[0] = 5 * game_get_speed(gamespeed_fps);
            }
            break;
    }
    exit;
}
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