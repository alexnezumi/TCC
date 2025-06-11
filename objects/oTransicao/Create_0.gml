// Em obj_Transicao - Evento Create

// A máquina de estados da transição: "inativo", "fade_out", "fade_in"
estado = "inativo";

// Nível de transparência (alpha) do retângulo preto. 0 = invisível, 1 = totalmente preto.
alpha_fade = 0;

// Velocidade do fade. Um número maior torna a transição mais rápida.
velocidade_fade = 0.05;

// A sala para a qual queremos ir. -1 significa nenhum alvo.
room_alvo = -1;