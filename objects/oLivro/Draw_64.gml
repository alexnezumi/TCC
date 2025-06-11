//#################################################################
// oLivro - Evento Draw GUI (COM MAIS ALTURA E MENOS ESPAÇAMENTO)
//#################################################################

if (mouse_esta_em_cima) {
    
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _meio_x = _gui_w / 2;
    var _meio_y = _gui_h / 2;

    var _cor_fundo = make_color_rgb(250, 245, 230);
    var _cor_texto_borda = make_color_rgb(85, 57, 47);

    // --- 1. DESENHA O FUNDO DO LIVRO E A LINHA DIVISÓRIA ---
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1.0);
    
    draw_set_color(_cor_fundo);
    // <<< MUDANÇA: Aumentamos ainda mais a altura do livro, de 350 para 400
    draw_rectangle(_meio_x - 450, _meio_y - 400, _meio_x + 450, _meio_y + 400, false);
    
    draw_set_color(_cor_texto_borda);
    // <<< MUDANÇA: Ajustamos a linha para a nova altura
    draw_line_width(_meio_x, _meio_y - 380, _meio_x, _meio_y + 380, 2);
    

    // --- 2. FUNÇÕES AJUDANTES PARA DESENHAR ---
    
    var desenhar_receitas_por_categoria = function(titulo_categoria, x_inicial, y_inicial, cor_do_texto) {
        draw_set_font(Fontmenu); draw_set_halign(fa_center); draw_set_valign(fa_top); draw_set_color(cor_do_texto);
        draw_text(x_inicial, y_inicial, titulo_categoria);
        
        var _y_atual = y_inicial + 60;
        var _x_base = x_inicial - 180;
        // <<< MUDANÇA: Diminuímos o espaço entre as linhas de 45 para 42
        var _espaco_linha = 42; 
        var _espaco_item = 12;
        
        for (var i = 0; i < array_length(global.receitas); i++) {
            var _receita = global.receitas[i];
            if (_receita.categoria == titulo_categoria) {
                var _x_atual = _x_base;
                draw_set_font(FontTextos); draw_set_halign(fa_left); draw_set_valign(fa_middle); draw_set_color(cor_do_texto);
                draw_text(_x_atual, _y_atual, _receita.nome);
                _x_atual += string_width(_receita.nome) + _espaco_item * 2;
                
                var _ingredientes = variable_struct_get_names(_receita.ingredientes);
                for (var j = 0; j < array_length(_ingredientes); j++) {
                    var _sprite_ingr = global.sprites_pedidos[$ _ingredientes[j]];
                    var _sprite_w = sprite_get_width(_sprite_ingr);
                    draw_sprite(_sprite_ingr, 0, _x_atual + (_sprite_w/2), _y_atual);
                    _x_atual += _sprite_w + _espaco_item;
                    if (j < array_length(_ingredientes) - 1) { var _sinal_w = string_width("+"); draw_text(_x_atual, _y_atual, "+"); _x_atual += _sinal_w + _espaco_item; }
                }
                if (array_length(_ingredientes) > 0) { var _sinal_w = string_width("="); draw_text(_x_atual, _y_atual, "="); _x_atual += _sinal_w + _espaco_item; }
                
                var _sprite_final = global.sprites_pedidos[$ _receita.nome];
                var _sprite_w = sprite_get_width(_sprite_final);
                draw_sprite(_sprite_final, 0, _x_atual + (_sprite_w/2), _y_atual);
                _y_atual += _espaco_linha;
            }
        }
        return _y_atual;
    }
    
    var desenhar_lista_simples = function(titulo_categoria, lista_de_nomes, x_inicial, y_inicial, cor_do_texto) {
        draw_set_font(Fontmenu); draw_set_halign(fa_center); draw_set_valign(fa_top); draw_set_color(cor_do_texto);
        draw_text(x_inicial, y_inicial, titulo_categoria);

        var _y_atual = y_inicial + 60;
        var _x_base = x_inicial - 180;
        // <<< MUDANÇA: Diminuímos o espaço entre as linhas de 45 para 42
        var _espaco_linha = 42;

        for (var i = 0; i < array_length(lista_de_nomes); i++) {
            var _nome_item = lista_de_nomes[i];
            draw_set_font(FontTextos); draw_set_halign(fa_left); draw_set_valign(fa_middle); draw_set_color(cor_do_texto);
            draw_text(_x_base, _y_atual, _nome_item);

            var _sprite = global.sprites_pedidos[$ _nome_item];
            draw_sprite(_sprite, 0, _x_base + string_width(_nome_item) + 20, _y_atual);
            _y_atual += _espaco_linha;
        }
        return _y_atual;
    }


    // --- 3. CHAMA AS FUNÇÕES PARA DESENHAR CADA CATEGORIA ---
    var _coluna1_x = _meio_x - 225;
    var _coluna2_x = _meio_x + 225;
    // <<< MUDANÇA: Ajustamos a altura inicial para o novo tamanho do livro
    var _y_inicial = _meio_y - 360;
    
    var _y_final_doces = desenhar_receitas_por_categoria("Doces", _coluna1_x, _y_inicial, _cor_texto_borda);
    desenhar_receitas_por_categoria("Bebidas", _coluna1_x, _y_final_doces, _cor_texto_borda);
    
    var _y_final_salgados = desenhar_receitas_por_categoria("Salgados", _coluna2_x, _y_inicial, _cor_texto_borda);
    desenhar_lista_simples("Ingredientes", global.ingredientes_lista, _coluna2_x, _y_final_salgados, _cor_texto_borda);
}