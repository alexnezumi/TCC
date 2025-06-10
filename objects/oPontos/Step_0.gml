// Em obj_PlacarFinal - Evento Step

// Verifica se a tecla ENTER foi pressionada
if (keyboard_check_pressed(vk_enter)) {
    
    
    // Vai para a PRÓXIMA sala na ordem do seu Room Manager
    // (que deve ser a sala do próximo dia de jogo)
    room_goto(Menu);
}