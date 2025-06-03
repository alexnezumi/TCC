// Em oCozinhaFake - Evento Draw
draw_self();
draw_set_alpha(0.5); draw_set_color(c_red); // Cozinha em vermelho
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
draw_set_alpha(1);