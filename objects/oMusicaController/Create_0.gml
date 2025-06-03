// oMusicaController - Evento Create

// --- INICIALIZAÇÃO DE VARIÁVEIS GLOBAIS ---
if (!variable_global_exists("pause")) { // Verifica se já não foi criada em outro lugar
    global.pause = false; // Define o valor inicial como 'false' (jogo não começa pausado)
    show_debug_message("Variável global.pause inicializada como: " + string(global.pause));
}
// -----------------------------------------

musica_atual = noone; 

// --- DEFINA OS NOMES DOS SEUS RECURSOS DE SOM AQUI ---
musica_menu = mMenu;   // << SUBSTITUA pelo nome real
musica_jogo = mJogo;   // << SUBSTITUA pelo nome real
musica_pausa = mPause; // << SUBSTITUA pelo nome real
// -----------------------------------------------------------

prioridade_musica = 10; // Um valor para a prioridade de execução do som

show_debug_message("oMusicaController: Criado e pronto!");
show_debug_message("oMusicaController: Verificando assets de som...");

// Verificações para garantir que os assets de som são válidos
if (audio_exists(musica_menu)) {
    show_debug_message(" - musica_menu ('" + audio_get_name(musica_menu) + "') é um som VÁLIDO.");
} else {
    show_debug_message("ERRO: 'musica_menu' (valor: " + string(musica_menu) + ") NÃO é um som válido ou não foi encontrado! Verifique o nome no Create Event.");
}

if (audio_exists(musica_jogo)) {
    show_debug_message(" - musica_jogo ('" + audio_get_name(musica_jogo) + "') é um som VÁLIDO.");
} else {
    show_debug_message("ERRO: 'musica_jogo' (valor: " + string(musica_jogo) + ") NÃO é um som válido ou não foi encontrado! Verifique o nome no Create Event.");
}

if (audio_exists(musica_pausa)) {
    show_debug_message(" - musica_pausa ('" + audio_get_name(musica_pausa) + "') é um som VÁLIDO.");
} else {
    show_debug_message("ERRO: 'musica_pausa' (valor: " + string(musica_pausa) + ") NÃO é um som válido ou não foi encontrado! Verifique o nome no Create Event.");
}