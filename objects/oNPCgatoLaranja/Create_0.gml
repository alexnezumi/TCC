// Estados possíveis: "spawn", "indo_cadeira", "sentado", "esperando", "indo_caixa", "indo_embora"
state = "spawn";

pedido_feito = false;
pedido = -1;
tempo_espera = 300; // frames até ficar bravo (5s em 60fps)
cadeira_alvo = noone;
feliz = false;
cardapio = ["Rosquinha", "Coxinha", "Bolo"];
