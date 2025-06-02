// Decide qual asset de som deve tocar
var nova_musica;

if (room == Menu) {
    nova_musica = menu;
}
else if (room == Tutorial) {
    nova_musica = jogo;
}
else {
    nova_musica = Pause;
}

// Toca a nova música se for diferente da anterior
if (nova_musica != global.music_current_asset) {

    // Para a música anterior
    if (global.music_playing_id != -1) {
        audio_stop_sound(global.music_playing_id);
    }

    // Toca a nova
    if (nova_musica != noone) {
        global.music_playing_id = audio_play_sound(nova_musica, true, 1);
        global.music_current_asset = nova_musica;
    } else {
        global.music_playing_id = -1;
        global.music_current_asset = noone;
    }
}

