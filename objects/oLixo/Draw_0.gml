
//#################################################################
// oLixeira - Evento Draw
//#################################################################

// Primeiro, desenha o sprite da própria lixeira
draw_self();


// --- 1. VERIFICAÇÕES INICIAIS ---
// O código abaixo só executa se:
// a) O objeto do jogador existir na sala.
// b) O mouse estiver em cima da lixeira.
if (instance_exists(oPlayer) && position_meeting(mouse_x, mouse_y, id)) {

    // --- 2. JUNTA TODOS OS ITENS A SEREM DESCARTADOS ---
    // Cria um array temporário para facilitar o desenho.
    var _itens_a_descartar = [];
    
    // Adiciona o item que o jogador está carregando na mão (se houver)
    if (oPlayer.item_carregando != noone) {
        array_push(_itens_a_descartar, oPlayer.item_carregando);
    }
    
    // Adiciona todos os ingredientes do inventário
    for (var i = 0; i < array_length(oPlayer.inventario_ingredientes); i++) {
        array_push(_itens_a_descartar, oPlayer.inventario_ingredientes[i]);
    }
    
    // Se não houver nada para descartar, não desenha mais nada.
    if (array_length(_itens_a_descartar) == 0) {
        exit;
    }
    
    
    // --- 3. DESENHA O FUNDO DO "TOOLTIP" ---
    // Define a posição base (acima da lixeira)
    var _tooltip_x = x;
    var _tooltip_y = bbox_top - 10;
    
    // Define o tamanho e o espaçamento dos ícones
    var _icone_tamanho = 48;
    var _icone_espaco = 8;
    
    // Calcula a largura do painel de fundo baseado em quantos itens serão mostrados
    var _painel_largura = (array_length(_itens_a_descartar) * (_icone_tamanho + _icone_espaco)) + 16;
    var _painel_altura = _icone_tamanho + 48; // Espaço para o ícone e o texto
    
    // Desenha o painel
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_roundrect_ext(
        _tooltip_x - _painel_largura / 2, 
        _tooltip_y - _painel_altura, 
        _tooltip_x + _painel_largura / 2, 
        _tooltip_y, 
        10, 10, false
    );
    draw_set_alpha(1.0);
    

    // --- 4. DESENHA OS SPRITES DOS ITENS ---
    // Pega o ponto inicial para desenhar o primeiro ícone
    var _desenho_x_inicial = _tooltip_x - ((array_length(_itens_a_descartar) - 1) * (_icone_tamanho + _icone_espaco)) / 2;
    
    for (var i = 0; i < array_length(_itens_a_descartar); i++) {
        var _nome_item = _itens_a_descartar[i];
        
        if (variable_struct_exists(global.sprites_pedidos, _nome_item)) {
            var _sprite = global.sprites_pedidos[$ _nome_item];
            var _icone_x = _desenho_x_inicial + i * (_icone_tamanho + _icone_espaco);
            
            // Desenha o sprite com uma cor vermelha para indicar que será descartado
            draw_sprite_ext(_sprite, 0, _icone_x, _tooltip_y - _painel_altura / 2 - 10, 1.5, 1.5, 0, c_red, 0.9);
        }
    }
    
    
    // --- 5. DESENHA O TEXTO DE CONFIRMAÇÃO ---
    draw_set_font(FontTextos); // << SUBSTITUA pela sua fonte
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text(_tooltip_x, _tooltip_y - 5, "Jogar itens fora?");
}