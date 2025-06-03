if(keyboard_check_pressed(vk_escape))
{
 if (!instance_exists(oTransicao3))
{
	instance_create_layer(0,0,layer, oTransicao3,{destino: Menu});
}
}