#region BASE
if(grabed){
	x = follow.x;
	y = follow.y -10;
}

if(selled){
	global.Money += price;
	var coinEffect = instance_create_layer(x, y, "Others", obj_littleCoin);
	coinEffect.value = price;
	follow.target = noone;
	instance_destroy();
}
#endregion

if(production <= 0){
	var newMaterial = instance_create_layer(x, y, "Material", obj_area2Material);
	follow.target = newMaterial;
	
	instance_destroy();
}