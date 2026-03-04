//show_debug_message("Max = " + string(delivered));

#region CREATION

var keyS = keyboard_check_released(ord("S"));
if(keyS){
	if(nSpot < 6){
		var position = personalArea[| nSpot];
		var spot;
		switch (nSpot){
			case 0: case 1:
				spot = instance_create_layer(x+position[0], y+position[1]-30, "Areas", obj_area2Spot);
				break;

			case 2: case 3:
				spot = instance_create_layer(x+position[0]+30, y+position[1], "Areas", obj_area2Spot_2);
				break;
				
			case 4: case 5:
				spot = instance_create_layer(x+position[0], y+position[1]+32, "Areas", obj_area2Spot);
				break;
		}
		
		ds_list_add(mySpots, spot);
		nSpot = ds_list_size(mySpots);
		
	}
}


var keyX = keyboard_check_released(ord("X"));
if(keyX){
	
	if(nWorker < nSpot){
		if((global.Money - 50) < 0)show_message("NUH UH, U R POOR");
		else{
			global.Money -= 50;
			var positions = personalArea[| nWorker];
			var worker = instance_create_layer(obj_spawner.x, obj_spawner.y, "Instances", obj_worker2);
			worker.areaX = x+positions[0];
			worker.areaY = y+positions[1];
			
			var spotOccuped = mySpots[| nWorker];
			spotOccuped.follow = worker;
			
			ds_list_add(myWorkers, worker);
			nWorker = ds_list_size(myWorkers);
		}
	}
}

#endregion

