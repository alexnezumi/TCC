//#################################################################
// oPlayer - Evento Draw GUI - VERSÃO FINAL DE DIAGNÓSTICO
//#################################################################



// --- VERIFICAÇÃO DE PRÉ-REQUISITOS ---
if (!variable_instance_exists(self, "limite_inventario")) { 
    show_debug_message("!!! ERRO CRÍTICO: Variavel 'limite_inventario' não foi criada no oPlayer !!!");
    exit;
}
if (!font_exists(Fontmenu)) { // << Lembre-se de usar o nome da sua fonte aqui
    show_debug_message("!!! ERRO CRÍTICO: A fonte 'Fontmenu' não existe no projeto !!!");
    exit; 
}

// --- CONFIGURAÇÕES DE LAYOUT ---
var _slot_tamanho = 64;
var _slot_espaco = 8;
var _inv_x = 20;
var _inv_y = display_get_gui_height() - _slot_tamanho - 20;
var _largura_total_painel = (_slot_tamanho * limite_inventario) + (_slot_espaco * (limite_inventario - 1)) + 20;
var _altura_total_painel = _slot_tamanho + 20;

// --- 1. DESENHA O TÍTULO "INVENTÁRIO" ---
draw_set_font(Fontmenu); // Define a fonte
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_text(_inv_x, _inv_y - 15, "Inventário"); // Desenha o título acima do painel

// --- 2. DESENHA O PAINEL DE FUNDO ---
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_roundrect_ext(_inv_x - 10, _inv_y - 10, _inv_x + _largura_total_painel, _inv_y + _altura_total_painel, 10, 10, false);
draw_set_alpha(1.0);

// --- 3. DESENHA OS SLOTS VAZIOS ---
for (var i = 0; i < limite_inventario; i++) {
    var _slot_x = _inv_x + i * (_slot_tamanho + _slot_espaco);
    draw_set_color(c_dkgray);
    draw_roundrect(_slot_x, _inv_y, _slot_x + _slot_tamanho, _inv_y + _slot_tamanho, false);
}

// --- 4. DESENHA OS ITENS DENTRO DOS SLOTS ---
var _itens_no_inventario = array_length(inventario_ingredientes);
if (_itens_no_inventario > 0) {
    for (var i = 0; i < _itens_no_inventario; i++) {
        var _nome_item = inventario_ingredientes[i];
        
        if (variable_struct_exists(global.sprites_pedidos, _nome_item)) {
            var _sprite_item = global.sprites_pedidos[$ _nome_item];
            var _slot_x = _inv_x + i * (_slot_tamanho + _slot_espaco);
            
            draw_sprite_ext(_sprite_item, 0, _slot_x + (_slot_tamanho / 2), _inv_y + (_slot_tamanho / 2), 2, 2, 0, c_white, 1); 
            
        } else {
            // DIAGNÓSTICO IMPORTANTE!
            show_debug_message("------------------------------------------------");
            show_debug_message("FALHA ao desenhar! Não achei o sprite para o item: [" + _nome_item + "]");
            show_debug_message("Chaves que existem no dicionário: " + string(variable_struct_get_names(global.sprites_pedidos)));
            show_debug_message("------------------------------------------------");
        }
    }
}