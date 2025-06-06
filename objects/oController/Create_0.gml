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

if(!variable_global_exists("duracao_dia_em_segundos"))
{
global.duracao_dia_em_segundos = 5 * 60; // definida a 5 minutos 
show_debug_message("Duração do dia definida para" + string(global.duracao_dia_em_segundos) + "segundos");
}
if (!variable_global_exists("dia_atual_numero"))
{
global.dia_atual_numero = 1; //começa no dia 1 
show_debug_message(global.dia_atual_numero);
} 

//variavel instancia para countdown do dia atual em frames

timer_dia_frames = 0;















