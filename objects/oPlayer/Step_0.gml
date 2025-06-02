
//pause do jogo 
if (global.pause) exit;

// Movimento
var tecla_cima = keyboard_check(ord("W"));
var tecla_baixo = keyboard_check(ord("S"));
var tecla_esquerda = keyboard_check(ord("A"));
var tecla_direita = keyboard_check(ord("D"));

var movx = tecla_direita - tecla_esquerda;
var movy = tecla_baixo - tecla_cima;
var movendo = (movx != 0 || movy != 0);

if (movendo) {
    dir = point_direction(0, 0, movx, movy);
    velh = lengthdir_x(velc, dir);
    velv = lengthdir_y(velc, dir);
} else {
    velh = 0;
    velv = 0;
}

// Virar sprite horizontalmente
if (tecla_direita) {
    image_xscale = -2;
}
if (tecla_esquerda) {
    image_xscale = 2;
}

// Colisão
if (place_meeting(x + velh, y, oColisores)) {
    while (!place_meeting(x + sign(velh), y, oColisores)) {
        x += sign(velh);
    }
    velh = 0;
}
x += velh;

if (place_meeting(x, y + velv, oColisores)) {
    while (!place_meeting(x, y + sign(velv), oColisores)) {
        y += sign(velv);
    }
    velv = 0;
}
y += velv;
