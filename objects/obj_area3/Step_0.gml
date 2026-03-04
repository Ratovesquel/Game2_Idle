//show_debug_message("Max = " + string(delivered));


#region WORKING

if(production<=0){
	var newMaterial = instance_create_layer(x+createdAreaXY[0], y+createdAreaXY[1], "Material", obj_area3Material);
	production = productionMax;
	delivered--;
	for(i = 0; i<ds_list_size(myWorkers); i++){
		var chosen = myWorkers[| i];
		if(chosen.worker3State == WorkerState.WAITING || chosen.worker3State == WorkerState.WORKING){
			chosen.target = newMaterial;
			chosen.worker3State = WorkerState.PRODUCED_MATERIAL;
			i = ds_list_size(myWorkers);
		}
	}
}



if(delivered>0){
	sprite_index = spr_Area3_working;
	hasWork = true;
} 
else{
	sprite_index = spr_Area3_idle;
	hasWork = false;
} 

#endregion


#region CREATION
var keyD = keyboard_check_released(ord("D"));
if(keyD){
	if(nSpot < 5){
		var position = personalArea[| nSpot];
		var spot = instance_create_layer(x+position[0], y+position[1], "Areas", obj_area3Spot);
		ds_list_add(mySpots, spot);
		nSpot = ds_list_size(mySpots);
	}
}


var keyC = keyboard_check_released(ord("C"));
if(keyC){
	
	if(nWorker < nSpot){
		if((global.Money - 100) < 0)show_message("NUH UH, U R POOR");
		else{
			global.Money -= 100;
			var positions = personalArea[| nWorker];
			var worker = instance_create_layer(obj_spawner.x, obj_spawner.y, "Instances", obj_worker3);
			worker.areaX = x+positions[0];
			worker.areaY = y+positions[1]-6;
			
			//follow from spot position nwork recive the var worker as his follow
			var spotOccuped = mySpots[| nWorker];
			spotOccuped.follow = worker;
			
			ds_list_add(myWorkers, worker);
			nWorker = ds_list_size(myWorkers);
		}
	}
}

#endregion




