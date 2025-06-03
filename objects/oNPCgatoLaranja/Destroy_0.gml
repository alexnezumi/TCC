// oNPCgatoLaranja - Evento Destroy
show_debug_message("oNPCgatoLaranja (ID: " + string(id) + ") - DESTROY EVENT INICIADO. Verificando cadeira...");

if (minha_cadeira_id != noone && instance_exists(minha_cadeira_id)) {
    // Só libera se ESTE cliente era o que estava designado para ela ou sentado nela
    if (minha_cadeira_id.id_cliente_sentado == id) {
        minha_cadeira_id.ocupada = false;
        minha_cadeira_id.id_cliente_sentado = noone;
        show_debug_message("oCadeira (ID: " + string(minha_cadeira_id) + ") liberada no Destroy do cliente " + string(id));
    } else {
        // Isso pode acontecer se a cadeira foi reatribuída ou o ID do cliente na cadeira é diferente
        show_debug_message("oCadeira (ID: " + string(minha_cadeira_id) + ") não foi liberada no Destroy, pois id_cliente_sentado (" + string(minha_cadeira_id.id_cliente_sentado) + ") não bate com id do cliente (" + string(id) + ").");
    }
} else if (minha_cadeira_id != noone) {
    show_debug_message("oCadeira (ID: " + string(minha_cadeira_id) + ") referenciada por cliente " + string(id) + " não existe mais.");
}