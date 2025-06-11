// Em oController - Evento Draw (VERSÃO COM CÍRCULO)

if (global.tutorial_ativo) {
    // Primeiro, o código encontra qual é o alvo do passo atual do tutorial
    var _alvo = noone;
    switch (tutorial_passo) {
        case 2: _alvo = instance_find(oLivro, 0); break;
        case 3: _alvo = instance_find(oMassa, 0); break;
        case 4: _alvo = instance_find(oFrango, 0); break;
        case 5: _alvo = instance_find(oPanela, 0); break;
        case 6: _alvo = instance_find(oLixo, 0); break;
        case 7: _alvo = instance_find(oCozinhaFake, 0); break;
        case 9: _alvo = instance_find(oCozinhaFake, 0); break;
        case 14: _alvo = instance_find(oNPCgatoLaranja, 0); break;
    }

  // Em oController - Evento Draw

// Se um alvo foi encontrado para o passo atual, desenha o círculo
if (instance_exists(_alvo)) {
    
    //-----------------------------------------------------
    // <<< CÓDIGO DO CÍRCULO ATUALIZADO >>>
    //-----------------------------------------------------

    // 1. Define a cor e a transparência
    draw_set_color(c_red);
    draw_set_alpha(0.8);

    // 2. Calcula o raio
    // <<< MUDANÇA 1: Deixando o círculo MENOR >>>
    // Diminuímos a margem de +10 para +5, para o círculo ficar mais justo ao objeto.
    var _raio = max(sprite_get_width(_alvo.sprite_index), sprite_get_height(_alvo.sprite_index)) / 2 + 5;
    
    // 3. Efeito de pulsar (continua o mesmo)
    var _efeito_pulsar = sin(get_timer() / 150000) * 4; 
    
    // 4. Desenha o círculo com linha GROSSA
    // <<< MUDANÇA 2: Usamos um 'for loop' para desenhar vários círculos >>>
    
    var _espessura_da_linha = 3; // << AJUSTE AQUI para uma linha mais grossa ou mais fina
    
    for (var i = 0; i < _espessura_da_linha; i++) {
        // Desenha um círculo para cada "camada" da espessura
        draw_circle(_alvo.x, _alvo.y, (_raio + _efeito_pulsar) + i, true);
    }

    // 5. Restaura a transparência
    draw_set_alpha(1.0);
}
}