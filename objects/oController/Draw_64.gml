// obj_controlador_principal - Evento Desenhar GUI

// --- DESENHAR TIMER DO DIA ---
// Garante que a variável timer_dia_frames existe antes de tentar desenhá-la
if (variable_instance_exists(self, "timer_dia_frames")) {
    var FPS = game_get_speed(gamespeed_fps);
    if (FPS == 0) { FPS = 60; }

    var _total_segundos_restantes = max(0, floor(timer_dia_frames / fps));
    var _minutos_restantes = floor(_total_segundos_restantes / 60);
    var _segundos_restantes = _total_segundos_restantes mod 60;

    // Formata o texto para o formato MM:SS (ex: 01:59)
    var _texto_timer = string_format(_minutos_restantes, 2, 0) + ":" + string_format(_segundos_restantes, 2, 0);

    // Configurações de desenho do texto
    // << SUBSTITUA 'fnt_ui_principal' PELO NOME DO SEU RECURSO DE FONTE >>
    draw_set_font(Fontmenu); 
    draw_set_halign(fa_center); // Alinha o texto no centro
    draw_set_valign(fa_top);
    draw_set_color(c_black);

    // Posição do timer na tela (centralizado no topo, por exemplo)
    var _pos_x_timer = display_get_gui_width() / 2;
    var _pos_y_timer = 10; // 10 pixels do topo

    draw_text(_pos_x_timer, _pos_y_timer, "Tempo Restante: " + _texto_timer);
}
// --------------------------

// ... (outro código de Desenhar GUI, como a pontuação ou a tela de cozinha) ...
// Em obj_controlador_principal - Evento Desenhar GUI

// --- CONFIGURAÇÕES DE DESENHO PARA O TEXTO ---

// << SUBSTITUA 'fnt_sua_fonte' PELO NOME DO SEU RECURSO DE FONTE >>
// (Você precisa criar uma Fonte no Navegador de Recursos > Fontes)
draw_set_font(Fontmenu);

// Define o alinhamento e a cor do texto
draw_set_halign(fa_left);   // Alinhamento horizontal: à esquerda
draw_set_valign(fa_top);    // Alinhamento vertical: no topo
draw_set_color(c_black);    // Cor do texto: branca (você pode usar outras, como c_yellow)


// --- DESENHAR A PONTUAÇÃO ---

// Posição na tela onde o texto vai aparecer (canto superior esquerdo)
var _posicao_x = 20; // 20 pixels da borda esquerda
var _posicao_y = 20; // 20 pixels do topo

// Monta o texto que será exibido, convertendo a variável numérica 'global.pontos' para texto
var _texto_para_desenhar = "Pontos: " + string(global.pontos);

// Desenha o texto na tela
draw_text(_posicao_x, _posicao_y, _texto_para_desenhar);


// Você pode adicionar aqui o código para desenhar outros elementos da sua UI, como o timer do dia.
// Exemplo:
// var _texto_timer = "Tempo: " + ...
// draw_text(display_get_gui_width() - 20, 20, _texto_timer); // Desenha o timer no canto superior direito