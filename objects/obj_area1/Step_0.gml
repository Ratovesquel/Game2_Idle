

#region PRODUCTION
if(production <= 0){
	production = productionMax;
	var newMaterial = instance_create_layer(x, y, "Material", obj_area1Material);
	var axl = false;
	while(!axl){
		var chosen = ds_list_find_value(myWorkers, irandom(ds_list_size(myWorkers)-1));
		
		if(chosen.worker1State == WorkerState.WORKING){
			axl = true;
			chosen.target = newMaterial;
			chosen.worker1State = WorkerState.RAW_MATERIAL;
		}
	}	
}
#endregion


#region CREATION

var keyA = keyboard_check_released(ord("A"));
if(keyA){
	if(nSpot < 8){
		var position = personalArea[| nSpot];
		var spot = instance_create_layer(x+position[0], y+position[1], "Areas", obj_area1Spot);
		ds_list_add(mySpots, spot);
		nSpot = ds_list_size(mySpots);
		if(nSpot%2==0) spot.image_xscale = -1;
	}
}


var keyZ = keyboard_check_released(ord("Z"));
if(keyZ){
	
	if(nWorker < nSpot){
		if((global.Money - 20) < 0)show_message("NUH UH, U R POOR");
		else{
			global.Money -= 10;
			var positions = personalArea[| nWorker];
			var worker = instance_create_layer(obj_spawner.x, obj_spawner.y, "Instances", obj_worker1);
			worker.areaX = x+positions[0];
			worker.areaY = y+positions[1];
			
			//follow from spot position nwork recive the var worker as his follow
			var spotOccuped = mySpots[| nWorker];
			spotOccuped.follow = worker;
			
			ds_list_add(myWorkers, worker);
			nWorker = ds_list_size(myWorkers);
		}
	}
}

var keyM = keyboard_check_released(ord("M"));
if(keyM)obj_worker1.spd++;

#endregion


#region CLICK AREA
var click = device_mouse_check_button_pressed(0, mb_left);
if(mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom){
	image_index = 1;	
		if(click) obj_camera.follow = id;
		
}
else{
	image_index = 0;
}
#endregion

