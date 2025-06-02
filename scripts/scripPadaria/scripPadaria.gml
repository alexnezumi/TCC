// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scripPadaria(){

	
	
	
	/// receber_item(item_id)
if (state == "esperando") {
    if (item_id == pedido) {
        feliz = true;
        state = "indo_caixa";
        cadeira_alvo.ocupada = false;
        show_debug_message("Item certo! NPC feliz.");
    } else {
        feliz = false;
        state = "indo_embora";
        cadeira_alvo.ocupada = false;
        show_debug_message("Item errado! NPC bravo.");
    }
}

}