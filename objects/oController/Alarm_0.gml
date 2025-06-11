//#################################################################
// obj_controlador_principal - Evento Alarm[0] (COM VERIFICAÇÃO DE TEMPO)
//#################################################################


// Em oController - Alarm[0]

if (global.tutorial_ativo) { exit; } // Se o tutorial está ativo, não gera clientes

// --- NOVA VERIFICAÇÃO: Checa se falta pouco tempo para o dia acabar ---
var dez_segundos_em_frames = 10 * game_get_speed(gamespeed_fps);

// Se o tempo restante for menor ou igual a 10 segundos...
if (timer_dia_frames <= dez_segundos_em_frames) {
    show_debug_message("Fim do expediente! Menos de 10 segundos restantes. Novos clientes não serão gerados.");
    
    // Para a execução do alarme. Nenhum cliente será criado e o alarme não será reativado hoje.
    exit; 
}


// --- O RESTO DO SEU CÓDIGO DE SPAWN CONTINUA NORMALMENTE ABAIXO ---
// Se o código chegou até aqui, significa que HÁ mais de 10 segundos restantes.

// Lógica para verificar se há cadeiras (oCadeira) disponíveis
var _cadeira_disponivel = false;
if (instance_exists(oCadeira)) {
    with (oCadeira) {
        if (!ocupada) {
            _cadeira_disponivel = true;
            break;
        }
    }
}

// Se houver uma cadeira disponível, cria um novo cliente
if (_cadeira_disponivel) {
    var spawn_x = 950;
    var spawn_y = 65;
    instance_create_layer(spawn_x, spawn_y, "Instances", oNPCgatoLaranja);
}

// Reagenda o alarme para o próximo cliente (só se o dia ainda não estiver acabando)
alarm[0] = random_range(5, 10) * game_get_speed(gamespeed_fps);