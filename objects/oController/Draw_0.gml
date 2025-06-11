// Em oController - Evento Draw

if (global.tutorial_ativo) {
    var _alvo = noone;
    switch (tutorial_passo) {
        case 2: _alvo = instance_find(oLivro, 0); break;
        case 3: _alvo = instance_find(oMassa, 0); break;
        case 4: _alvo = instance_find(oFrango, 0); break;
        case 5: _alvo = instance_find(oPanela, 0); break;
        case 6: _alvo = instance_find(oLixo, 0); break;
        case 7: _alvo = instance_find(oCozinhaFake, 0); break;
        case 9: _alvo = instance_find(oCozinhaFake, 0); break;
        case 10: _alvo = instance_find(oNPCgatoLaranja, 0); break;
    }

    if (instance_exists(_alvo)) {
        draw_sprite(sSeta, -1, _alvo.x, _alvo.bbox_top - 32);
    }
}