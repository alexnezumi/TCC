//#################################################################
// oPlayer - Evento Draw GUI - Inventário Visual
//#################################################################

// --- CONFIGURAÇÕES DE LAYOUT ---
// Mude estas variáveis para ajustar a posição e o tamanho do seu inventário
var _limite_inventario = 3;       // O número máximo de slots a desenhar
var _slot_tamanho = 64;          // Tamanho de cada slot em pixels (largura e altura)
var _slot_espaco = 8;            // Espaço entre os slots
var _inv_x = 20;                 // Posição X inicial (a partir da esquerda)
var _inv_y = display_get_gui_height() - _slot_tamanho - 10; // Posição Y (20 pixels de baixo para cima)

var _largura_total_painel = (_slot_tamanho * _limite_inventario) + (_slot_espaco * (_limite_inventario - 1)) + 20;
var _altura_total_painel = _slot_tamanho + 40; // Um pouco mais alto para o texto


// --- 1. DESENHA O PAINEL DE FUNDO (OPCIONAL, MAS RECOMENDADO) ---
draw_set_color(c_black);
draw_set_alpha(0.6); // Deixa o fundo um pouco transparente
draw_roundrect_ext(_inv_x - 10, _inv_y - 10, _inv_x + _largura_total_painel, _inv_y + _altura_total_painel, 10, 10, false);
draw_set_alpha(1.0); // Restaura a transparência para o normal


// --- 2. DESENHA OS SLOTS VAZIOS DO INVENTÁRIO ---
for (var i = 0; i < _limite_inventario; i++) {
    var _slot_x = _inv_x + i * (_slot_tamanho + _slot_espaco);
    
    // Desenha uma caixa cinza para o slot
    draw_set_color(c_dkgray);
    draw_set_alpha(0.8);
    draw_roundrect(_slot_x, _inv_y, _slot_x + _slot_tamanho, _inv_y + _slot_tamanho, false);
    draw_set_alpha(1.0);
}


// --- 3. DESENHA OS ITENS E NOMES DENTRO DOS SLOTS ---
var _itens_no_inventario = array_length(inventario_ingredientes);

for (var i = 0; i < _itens_no_inventario; i++) {
    var _nome_item = inventario_ingredientes[i];
    
    // Pega o sprite do item usando nosso mapa global
    if (variable_struct_exists(global.sprites_pedidos, _nome_item)) {
        var _sprite_item = global.sprites_pedidos[$ _nome_item];
        
        // Calcula a posição do slot atual
        var _slot_x = _inv_x + i * (_slot_tamanho + _slot_espaco);
        
        // Desenha o sprite do item centralizado dentro do slot
        draw_sprite_ext(
            _sprite_item, 
            0, 
            _slot_x + (_slot_tamanho / 2), 
            _inv_y + (_slot_tamanho / 2), 
            2, 2, 0, c_white, 1 // << Pode precisar ajustar a escala (os '2, 2')
        ); 
        
       
        
    }
}