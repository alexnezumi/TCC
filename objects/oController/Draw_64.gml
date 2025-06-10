//#################################################################
// obj_controlador_principal - Evento Draw GUI (VERSÃO REORGANIZADA)
//#################################################################

// --- 1. CONFIGURAÇÕES GERAIS DE DESENHO ---
// Definimos a fonte e o alinhamento uma única vez para todos os textos.
draw_set_font(FontTextos);    // << Lembre-se de usar o nome da sua fonte
draw_set_halign(fa_center);   // Centraliza todos os textos horizontalmente
draw_set_valign(fa_top);      // Alinha todos pelo topo
draw_set_color(c_black);      // Define a cor para todos


// --- 2. DEFINIÇÃO DAS POSIÇÕES ---
// Definimos variáveis para controlar facilmente a posição de toda a UI.
var _pos_x = display_get_gui_width() / 2; // O centro da tela
var _pos_y_inicial = 15;                   // A altura inicial do primeiro texto (15 pixels do topo)
var _espaco_entre_linhas = 25;             // O espaço vertical entre cada linha de texto


// --- 3. DESENHAR OS ELEMENTOS NA ORDEM CORRETA ---

// --- PONTOS (Primeira linha) ---
var _texto_pontos = "Pontos: " + string(global.pontos);
draw_text(_pos_x, _pos_y_inicial, _texto_pontos);


// --- TEMPO (Segunda linha) ---
if (variable_instance_exists(self, "timer_dia_frames")) {
    var FPS = game_get_speed(gamespeed_fps);
    if (FPS == 0) { FPS = 60; }

    var _total_segundos_restantes = max(0, floor(timer_dia_frames / FPS));
    var _minutos_restantes = floor(_total_segundos_restantes / 60);
    var _segundos_restantes = _total_segundos_restantes mod 60;

    var _texto_timer = string_format(_minutos_restantes, 2, 0) + ":" + string_format(_segundos_restantes, 2, 0);
    
    // Desenha na posição inicial + 1x o espaçamento
    draw_text(_pos_x, _pos_y_inicial + _espaco_entre_linhas, "Tempo: " + _texto_timer);
}


// --- DIA (Terceira linha) ---
var _texto_dia = "Dia: " + string(global.dia_atual_numero);
// Desenha na posição inicial + 2x o espaçamento
draw_text(_pos_x, _pos_y_inicial + (_espaco_entre_linhas * 2), _texto_dia);