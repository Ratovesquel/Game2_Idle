

var keyX = keyboard_check_released(ord("X"));
if(keyX){
	
	if(nWorker<6){
		var positions = personalArea[| nWorker];
		var worker = instance_create_layer(obj_spawner.x, obj_spawner.y, "Instances", obj_worker2);
		worker.areaX = x+positions[0];
		worker.areaY = y+positions[1];
		nWorker++;
		ds_list_add(myWorkers, worker);
	}
}

//var keyM = keyboard_check_released(ord("M"));
//if(keyM)obj_worker2.spd++;


