if(grabed){
	x = follow.x;
	y = follow.y -16;
}

if(selled){
	global.Money += price;
	instance_destroy();
}