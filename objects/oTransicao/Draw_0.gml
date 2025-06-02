//desenhando a transição

for (var i = 0; i < linhas; i++)
{
	for(var j = 0; j < colunas; j++)
	{
	var _img = min(max(0,img - j), img_num);
	draw_sprite_ext(sQuadrado, _img  , j * tamanho, i * tamanho, 1 , 1 , 0 ,c_black, 1);
	} 
}