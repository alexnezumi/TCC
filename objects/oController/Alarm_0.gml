// obj_controlador_principal - Evento Alarm[0]

// Lógica para verificar se há cadeiras (oCadeira) disponíveis ANTES de criar um novo cliente
var _cadeira_disponivel = false;
if (instance_exists(oCadeira)) {
    with (oCadeira) {
        if (!ocupada) {
            _cadeira_disponivel = true;
            break;
        }
    }
} else {
    show_debug_message("Controlador: Nenhuma instância de oCadeira encontrada. Não é possível criar clientes.");
}
// ... (código de verificação de _cadeira_disponivel, como antes) ...

if (_cadeira_disponivel) {
    // --- Posição de Spawn FIXA ---
    var spawn_x = 1385;
    var spawn_y = 290;
    // ---------------------------------

    show_debug_message("Controlador: oCadeira disponível. Criando novo oNPCgatoLaranja em (" + string(spawn_x) + "," + string(spawn_y) + ")");
    instance_create_layer(spawn_x, spawn_y, "Instances", oNPCgatoLaranja);
    
} else {
    show_debug_message("Controlador: Nenhuma oCadeira disponível no momento. Cliente não foi criado.");
}

// Reagenda o alarme
alarm[0] = random_range(1,2) * game_get_speed(gamespeed_fps);