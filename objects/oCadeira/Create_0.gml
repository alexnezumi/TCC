// oCadeira - Evento Create
ocupada = false;
id_cliente_sentado = noone; // Guarda o ID do cliente que está nesta cadeira ou a caminho dela
                           // Isso é útil para garantir que a cadeira seja liberada corretamente.

show_debug_message("oCadeira criada (ID: " + string(id) + ") - Estado inicial: Livre");