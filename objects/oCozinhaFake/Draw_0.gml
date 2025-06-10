// Em oCozinha - Evento Draw (VERSÃO ATUALIZADA COM FUNDO)

// Primeiro, desenha o sprite da própria cozinha
draw_self();

// --- 1. Decide qual texto e cor usar baseado no estado atual ---

var _texto_a_desenhar = ""; // Começa com um texto vazio
var _cor_do_texto = c_black;     // Cor padrão do texto

// Se o timer de status de item instantâneo estiver ativo, ele tem prioridade
if (timer_mostrar_status > 0) {
    _texto_a_desenhar = ultimo_item_instantaneo + " pronto!";
    _cor_do_texto = c_purple;
}
// Senão, mostra o status normal do fogão
else {
    switch (estado_fogao) {
        
        case "assando":
            var _segundos = ceil(timer_fogao / game_get_speed(gamespeed_fps));
            _texto_a_desenhar = "Cozinhando " + produto_pronto + ": " + string(_segundos);
            _cor_do_texto = c_red;
            break;
            
        case "pronto":
            _texto_a_desenhar = produto_pronto + " pronto para pegar!";
            _cor_do_texto = c_blue;
            break;
    }
}

// --- 2. Se houver um texto para mostrar, desenhe-o com o fundo ---

if (_texto_a_desenhar != "") {
    
    // Define a fonte e o alinhamento
    draw_set_font(FontTextos); // << SUBSTITUA pela sua fonte
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    // Mede o tamanho do texto para o retângulo saber que tamanho ter
    var _texto_largura = string_width(_texto_a_desenhar);
    var _texto_altura = string_height(_texto_a_desenhar);
    var _padding = 8; // Um preenchimento para o retângulo ser maior que o texto
    
    // Define a posição base do texto
    var _draw_x = x;
    var _draw_y = bbox_top - 25;
    
    // Calcula as coordenadas do retângulo
    var _rect_x1 = _draw_x - (_texto_largura / 2) - _padding;
    var _rect_y1 = _draw_y - _texto_altura - _padding;
    var _rect_x2 = _draw_x + (_texto_largura / 2) + _padding;
    var _rect_y2 = _draw_y + _padding;
    
    // Desenha o retângulo do fundo (branco e um pouco transparente)
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_roundrect(_rect_x1, _rect_y1, _rect_x2, _rect_y2, false);
    draw_set_alpha(1.0); // Restaura a transparência
    
    // Desenha o texto por cima do retângulo
    draw_set_color(_cor_do_texto);
    draw_text(_draw_x, _draw_y, _texto_a_desenhar);
}