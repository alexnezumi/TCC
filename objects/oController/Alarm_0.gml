if (instance_number(oNPCgatoLaranja) < max_clientes_na_tela) {
    var _spawn_x = room_width + 50; // Fora da tela à direita
    var _spawn_y = random_range(oCadeira.y - 20, oCadeira.y + 20); // Altura aleatória perto do balcão
    instance_create_layer( _spawn_x, _spawn_y, "Instances", oNPCgatoLaranja);
}
// Próximo cliente em X a Y segundos
alarm[0] = random_range(5, 10) * game_get_speed(gamespeed_fps);