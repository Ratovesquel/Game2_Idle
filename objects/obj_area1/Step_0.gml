if(production <= 0){
	production = productionMax;
	var newMaterial = instance_create_layer(x+random_range(-150, 150), y+random_range(-150, 150), "Material", obj_area1Material);
	var axl = false;
	while(!axl){
		var chosen = ds_list_find_value(myWorkers, irandom(ds_list_size(myWorkers)-1));
		
		if(chosen.worker1State == WorkerState.WORKING){
			axl = true;
			chosen.target = newMaterial;
			chosen.worker1State = WorkerState.MATERIAL;
		}
	}	
}



var keyZ = keyboard_check_released(ord("Z"));
if(keyZ){
	
	if(nWorker<9){
		var positions = personalArea[| nWorker];
		var worker = instance_create_layer(obj_spawner.x, obj_spawner.y, "Instances", obj_worker1);
		worker.areaX = x+positions[0];
		worker.areaY = y+positions[1];
		nWorker++;
		ds_list_add(myWorkers, worker);
	}
}

var keyM = keyboard_check_released(ord("M"));
if(keyM)obj_worker1.spd++;


