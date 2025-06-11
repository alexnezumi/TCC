//#################################################################
// obj_controlador_principal - Evento Draw GUI (Alinhado à Esquerda)
//#################################################################

// --- 1. CONFIGURAÇÕES GERAIS DE DESENHO ---
draw_set_font(FontTextos);
draw_set_halign(fa_left);   // Alinhamento à esquerda, já está correto.
draw_set_valign(fa_top);
draw_set_color(c_black);


// --- 2. DEFINIÇÃO DAS POSIÇÕES ---
var _pos_x = 15;            // <<< MUDANÇA PRINCIPAL AQUI: de centro para uma margem fixa.
var _pos_y_inicial = 15;
var _espaco_entre_linhas = 25;


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
	
	// Formata a string dos minutos
    var _minutos_str;
    if (_minutos_restantes < 10) {
        _minutos_str = "0" + string(_minutos_restantes);
    } else {
        _minutos_str = string(_minutos_restantes);
    }
    
    // Formata a string dos segundos
    var _segundos_str;
    if (_segundos_restantes < 10) {
        _segundos_str = "0" + string(_segundos_restantes);
    } else {
        _segundos_str = string(_segundos_restantes);
    }
    
    // Junta as duas partes para formar o texto final do timer
    var _texto_timer = _minutos_str + ":" + _segundos_str;
    
    // Desenha na posição inicial + 1x o espaçamento
    draw_text(_pos_x, _pos_y_inicial + _espaco_entre_linhas, "Tempo: " + _texto_timer);
}


// --- DIA (Terceira linha) ---
var _texto_dia = "Dia: " + string(global.dia_atual_numero);
// Desenha na posição inicial + 2x o espaçamento
draw_text(_pos_x, _pos_y_inicial + (_espaco_entre_linhas * 2), _texto_dia);