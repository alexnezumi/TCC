// Vamos usar um array de structs para as receitas
// Cada struct terá: nome_produto, ingredientes_necessarios (outro struct), tempo_forno


global.receitas = [
    {
        nome: "Coxinha",
        ingredientes: { massa: 1, frango: 1, panela: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	 {
        nome: "Donut de Ninho",
        ingredientes: { rosquinha: 1, calda_ninho: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	{
        nome: "Donut de Chocolate",
        ingredientes: { rosquinha: 1, calda_chocolate: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	{
        nome: "Donut de Morango",
        ingredientes: { rosquinha: 1, calda_morango: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	{
        nome: "Croassant",
        ingredientes: { massa: 1, frango: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	{
        nome: "Torta de Frango",
        ingredientes: { massa: 1, forma: 1}, // itens 
        tempo_fogao: 5 * game_get_speed(gamespeed_fps)// 5 segundos

    },
	{
        nome: "Bolo Red Velvet",
        ingredientes: { bolo_redvelvet:1},// itens 
    },
	{
        nome: "Bolo de Cenoura",
        ingredientes: { bolo_cenoura:1} // itens 
    },
	{
        nome: "Bolo Chocolate",
        ingredientes: { bolo_redvelvet:1} // itens 
    },
	{
        nome: "Café",
        ingredientes: { cafe: 1} // itens 
    },
	{
        nome: "Chocolate Quente",
        ingredientes: { chocolate_quente: 1} // itens 
    },
	{
        nome: "Aguá",
        ingredientes: { agua: 1} // itens 
    },
	{
        nome: "Suco de Morango",
        ingredientes: { suco_morango: 1} // itens 
    },
	{
        nome: "Suco de Uva",
        ingredientes: { suco_uva: 1} // itens 
    },
	{
        nome: "Suco de Limao",
        ingredientes: { suco_limao: 1} // itens 
    },
	{
        nome: "Suco de Laranja",
        ingredientes: { suco_laranja: 1} // itens 
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















