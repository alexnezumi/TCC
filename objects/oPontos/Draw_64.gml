//#################################################################
// Em obj_PlacarFinal - Evento Draw GUI (Layout Topo/Base)
//#################################################################

// --- Define o alinhamento horizontal para ser no centro para TUDO ---
draw_set_halign(fa_center);

var _tela_meio_x = display_get_gui_width() / 2;


// --- 1. Desenha o texto do placar (NO TOPO) ---

// Define o alinhamento vertical para o TOPO
draw_set_valign(fa_top); 
draw_set_font(FontTextos); // << Use sua fonte principal
draw_set_color(c_purple);

// Define uma posição Y fixa, perto do topo da tela
var _pos_y_placar = 100; 

// O \n cria uma quebra de linha
var _texto_placar = "Fim da demosntração " + "!\n\n" +
                    "Pontuação Final: " + string(global.pontos);

draw_text(_tela_meio_x, _pos_y_placar, _texto_placar);


// --- 2. Desenha a instrução para continuar (EMBAIXO) ---

// Define o alinhamento vertical para a BASE
draw_set_valign(fa_bottom); 
draw_set_font(Fontmenu); // << Pode usar uma fonte menor aqui

// Define uma posição Y fixa, perto da base da tela
var _pos_y_instrucao = display_get_gui_height() - 50; 

draw_text(_tela_meio_x, _pos_y_instrucao, "Pressione ENTER para voltar ao menu");