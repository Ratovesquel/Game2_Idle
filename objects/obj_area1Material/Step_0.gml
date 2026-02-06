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
	var newMaterial = instance_create_layer(obj_area2.x+obj_area2.createdAreaXY[0], obj_area2.y+obj_area2.createdAreaXY[1], "Material", obj_area2Material);
	newMaterial.follow = follow;
	with(follow){
		target = newMaterial;
		worker2State = WorkerState.PRODUCED_MATERIAL;
	}
	
	instance_destroy();
}