// Em oPlayer - Evento Draw GUI

// Desenha um fundo para o inventário (opcional)
var _ui_x = 20;
var _ui_y = display_get_gui_height() - 80;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_ui_x - 10, _ui_y - 10, _ui_x + (limite_inventario * 60), _ui_y + 70, false);
draw_set_alpha(1);


// Loop para desenhar cada item do inventário
for (var i = 0; i < array_length(inventario_ingredientes); i++) {
    var _nome_item = inventario_ingredientes[i];
    
    if (variable_struct_exists(global.sprites_pedidos, _nome_item)) {
        var _sprite_item = global.sprites_pedidos[$ _nome_item];
        
        // Calcula a posição de cada item
        var _item_x = _ui_x + (i * 60); // 60 pixels de espaçamento
        var _item_y = _ui_y;
        
        // Desenha uma "caixa" para o item
        draw_set_color(c_gray);
        draw_rectangle(_item_x, _item_y, _item_x + 60, _item_y + 60, true);
        
        // Desenha o sprite do item
        draw_sprite_ext(_sprite_item, 0, _item_x + 30, _item_y + 30, 2, 2, 0, c_white, 1);
    }
}