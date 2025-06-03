// Vamos usar um array de structs para as receitas
// Cada struct terá: nome_produto, ingredientes_necessarios (outro struct), tempo_forno


global.receitas = [
    {
        nome: "Coxinha",
        ingredientes: { oleo: 1, panela: 1}, // Precisa de 2 farinhas
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos (ajuste game_get_speed se usar delta time)

    }
    // Adicione mais receitas aqui futuramente
];

global.produtos_prontos_no_balcao = ds_list_create(); // Lista de produtos no balcão

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















