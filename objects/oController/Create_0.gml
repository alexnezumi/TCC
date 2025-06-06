// Vamos usar um array de structs para as receitas
// Cada struct terá: nome_produto, ingredientes_necessarios (outro struct), tempo_forno


show_debug_message("Inicializando lista de receitas...");
if (!variable_global_exists("receitas")) { // Garante que a lista só seja criada uma vez
    global.receitas = [
        {
            nome: "Coxinha",
            ingredientes: { massa: 1, frango: 1, panela: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps) // 5 segundos
        },
        {
            nome: "Donut de Ninho",
            ingredientes: { rosquinha: 1, calda_ninho: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps)
        },
        {
            nome: "Donut de Chocolate",
            ingredientes: { rosquinha: 1, calda_chocolate: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps)
        },
        {
            nome: "Donut de Morango",
            ingredientes: { rosquinha: 1, calda_morango: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps)
        },
        {
            nome: "Croassant",
            ingredientes: { massa: 1, frango: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps)
        },
        {
            nome: "Torta de Frango",
            ingredientes: { massa: 1, forma: 1},
            tempo_fogao: 5 * game_get_speed(gamespeed_fps)
        },
        {
            nome: "Bolo Red Velvet",
            ingredientes: { bolo_redvelvet: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Bolo de Cenoura",
            ingredientes: { bolo_cenoura: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Bolo Chocolate",
            ingredientes: { bolo_chocolate: 1 }, // Corrigido de bolo_redvelvet para bolo_chocolate
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Café",
            ingredientes: { cafe: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Chocolate Quente",
            ingredientes: { chocolate_quente: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Água",
            ingredientes: { agua: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Suco de Morango",
            ingredientes: { suco_morango: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Suco de Uva",
            ingredientes: { suco_uva: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Suco de Limão",
            ingredientes: { suco_limao: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        },
        {
            nome: "Suco de Laranja",
            ingredientes: { suco_laranja: 1 },
            tempo_fogao: 0 // Preparo instantâneo
        }
    ];
    show_debug_message("global.receitas inicializado com " + string(array_length(global.receitas)) + " receitas.");
}

// ... (código das receitas) ...
alarm[0] = 5 * game_get_speed(gamespeed_fps); // Primeiro cliente em 5 segundos
max_clientes_na_tela = 4; // Limite de clientes


// obj_controlador_principal - Evento Criar

// ... (outras inicializações globais que você já tem) ...

// --- LISTA GLOBAL DE TIPOS DE CLIENTE ---
if (!variable_global_exists("tipos_de_cliente")) {
    show_debug_message("Criando lista de tipos de cliente...");
    
    // Cada entrada no array é um 'struct' que define uma variação de cliente
    global.tipos_de_cliente = [
        // Tipo de Cliente 1: Gato Laranja
        { 
            pedindo: sNPCgatoLaranja,  // << SUBSTITUA pelo seu sprite
            feliz: sNPCgatoLaranjaFeliz,    // << SUBSTITUA pelo seu sprite
            bravo: sNPCgatosBravos     // << SUBSTITUA pelo seu sprite
        },
        
        // Tipo de Cliente 2: Gato Preto
        { 
            pedindo: sNPCgatoPreto,   // << SUBSTITUA pelo seu sprite
            feliz: sNPCgatoPretoFeliz,     // << SUBSTITUA pelo seu sprite
            bravo: sNPCgatosBravos       // << SUBSTITUA pelo seu sprite
        },
        
        // Tipo de Cliente 3: Gato Branco
        { 
            pedindo: sNPCgatoBranco,  // << SUBSTITUA pelo seu sprite
            feliz: sNPCgatoBrancoFeliz,    // << SUBSTITUA pelo seu sprite
            bravo: sNPCgatosBravos      // << SUBSTITUA pelo seu sprite
        },
		// Tipo de Cliente 4: Gato Frajola
        { 
            pedindo: sNPCgatoFrajola,  // << SUBSTITUA pelo seu sprite
            feliz: sNPCgatoFrajolaFeliz,    // << SUBSTITUA pelo seu sprite
            bravo: sNPCgatosBravos      // << SUBSTITUA pelo seu sprite
        },
		// Tipo de Cliente 5: Gato Tricolor
        { 
            pedindo: sNPCgatoTricolor,  // << SUBSTITUA pelo seu sprite
            feliz: sNPCgatoTricolorFeliz,    // << SUBSTITUA pelo seu sprite
            bravo: sNPCgatosBravos      // << SUBSTITUA pelo seu sprite
        }
        
        // << ADICIONE MAIS TIPOS DE CLIENTE AQUI DENTRO DE {} >>
    ];
    
    show_debug_message("Lista de tipos de cliente criada com " + string(array_length(global.tipos_de_cliente)) + " variações.");
}
// ------------------------------------------

// --- CONFIGURAÇÕES DO CICLO DE DIA ---
// Define a duração do dia em segundos (2 minutos * 60 segundos)
if (!variable_global_exists("duracao_dia_em_segundos")) {
    global.duracao_dia_em_segundos = 2 * 60; 
}
// Controla o número do dia atual
if (!variable_global_exists("dia_atual_numero")) {
    global.dia_atual_numero = 1;
}
// ------------------------------------

// Variável de instância para o timer do dia atual.
// Ela será configurada corretamente no Evento Início da Sala.
timer_dia_frames = 0; 


// pontos


if (!variable_global_exists("pontos")) {
    global.pontos = 0; // Define o valor inicial como 0
}















