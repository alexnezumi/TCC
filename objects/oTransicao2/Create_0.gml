tamanho = sprite_get_width(sQuadrado);
colunas = ceil(room_width/tamanho);
linhas = ceil(room_height/tamanho);
// variavel para animação 

img = 0;

//velocidade da animação 
img_vel = sprite_get_speed(sQuadrado) / game_get_speed(gamespeed_fps);

img_num = sprite_get_number(sQuadrado) - 1;

// criando a variavel de mudar de room 

destino = Controles;

//controle de entrada e saida

entrando = true;