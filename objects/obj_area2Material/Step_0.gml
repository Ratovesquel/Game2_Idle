if(grabed){
	x = follow.x;
	y = follow.y -10;
}

if(selled){
	global.Money += price;
	instance_destroy();
}