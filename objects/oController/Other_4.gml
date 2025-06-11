// Em oController - Evento Room Start

if (global.dia_atual_numero == 1) {
    global.tutorial_ativo = true;
    tutorial_passo = 0; // Garante que o tutorial comece do zero
	tutorial_cliente_spawned = false;
} else {
    global.tutorial_ativo = false;
    timer_dia_frames = global.duracao_dia_em_segundos * game_get_speed(gamespeed_fps);
}

// obj_controlador_principal - Evento Início da Sala

var FPS = game_get_speed(gamespeed_fps); // Pega o FPS do jogo (ex: 60)
if (FPS == 0) { FPS = 60; } // Medida de segurança caso o FPS seja 0

// Converte a duração do dia de segundos para frames e inicia o timer
timer_dia_frames = global.duracao_dia_em_segundos * fps;

show_debug_message("Dia " + string(global.dia_atual_numero) + " iniciado! Duração: " + string(global.duracao_dia_em_segundos) + " segundos.");