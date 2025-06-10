velh = 0;
velv =0;
velc = 4;
dir = 0;
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
distancia_max_entrega = 65;  // Distância máxima em pixels para conseguir entregar. Ajuste como preferir.

// --- VELOCIDADES DO JOGADOR ---
velocidade_caminhando = 5;   
velocidade_correndo = 10;     


velocidade = velocidade_caminhando; 


meus_ingredientes = {
    oleo: 0,
    panela: 0,
    massa: 0,
    frango: 0,
    rosquinha: 0,
    calda_ninho: 0,
    calda_chocolate: 0,
    calda_morango: 0,
    forma: 0,
    bolo_redvelvet: 0,
    bolo_cenoura: 0,
    bolo_chocolate: 0,
    cafe: 0,
    chocolate_quente: 0,
    agua: 0,
    suco_morango: 0,
    suco_uva: 0,
    suco_limao: 0,
    suco_laranja: 0
};
show_debug_message("Inventário do jogador (meus_ingredientes) inicializado.");
item_carregando = noone; // 'noone' significa nada, ou pode ser o nome do produto

inventario_ingredientes = []; // Um array para guardar os NOMES dos ingredientes
limite_inventario = 3;

show_debug_message("Inventário do jogador inicializado como um array com limite de " + string(limite_inventario) + " itens.");

// --- FUNÇÕES DE GERENCIAMENTO DE INVENTÁRIO ---

function inventario_esta_vazio() {
    // Usando a variável correta: inventario_ingredientes (que é um array)
    return (array_length(inventario_ingredientes) == 0);
}

function limpar_ingredientes() {
    show_debug_message("Limpando array de ingredientes...");
    // Usando a variável correta: inventario_ingredientes (que é um array)
    inventario_ingredientes = [];
}
visible = true;