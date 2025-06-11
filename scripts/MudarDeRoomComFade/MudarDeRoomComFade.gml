// Em scr_Transicoes

/// @function MudarDeRoomComFade(sala_de_destino)
/// @description Inicia uma transição de fade para uma nova sala.
function MudarDeRoomComFade(alvo) {

    // Só inicia uma nova transição se a anterior já tiver terminado
    if (instance_exists(oTransicao) && oTransicao.estado == "inativo") {
        oTransicao.room_alvo = alvo; // Define para qual sala ir
        oTransicao.estado = "fade_out"; // Começa o processo de escurecer
    }
}