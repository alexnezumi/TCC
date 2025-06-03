//só roda se for a entrada 
if(entrando)
{
	img+= img_vel;

		if(img - img_num > colunas + 1)
		{
			if(room_exists(destino))
			{
				room_goto(destino);
				entrando = false;
			}
		}

}else
{
img -= img_vel;
}