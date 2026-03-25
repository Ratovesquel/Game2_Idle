
#region STATE MACHINE
switch (worker2State){
	
	#region COMMING BACK, SLAVE >:)
	case WorkerState.COMMING:
	
		if(PathSchedule(areaX, areaY)){
			StopPath();
		
			if(target != noone && target.follow != noone){
				target.grabed = false;
				worker2State = WorkerState.WORKING;
			}
			else worker2State = WorkerState.WAITING;
				
		}
		
		break;
	#endregion
	
	#region NEXT AREA
	case WorkerState.NEXT_AREA:
	
		if(PathSchedule(obj_area3.deliverAreaX, obj_area3.deliverAreaY)){
			StopPath();
			
			instance_destroy(target);
			target = noone;
			obj_area3.delivered++;
			worker2State = WorkerState.COMMING;
		}

		break;
	#endregion
	
	#region GET PRODUCED MATERIAL
	case WorkerState.PRODUCED_MATERIAL:
	
		if(PathSchedule(target.x, target.y)){
			StopPath();
			
			target.grabed = true;			
			if(instance_exists(obj_area3) && obj_area3.delivered < obj_area3.deliveredMax && obj_area3.nWorker > 0){
				worker2State = WorkerState.NEXT_AREA;
			}
			else worker2State = WorkerState.SELLING;
		}
	
		break;
	#endregion
	
	#region GET NEW MATERIAL
	case WorkerState.RAW_MATERIAL:
	
		if(PathSchedule(target.x, target.y)){
			StopPath();
			
			target.follow = self;
			target.grabed = true;
			worker2State = WorkerState.COMMING;
		}

		break;
	#endregion	
	
	#region SELLING
	case WorkerState.SELLING:
	
		if(PathSchedule(obj_markert.x, obj_markert.y)){
			StopPath();
			
			target.selled = true;
			worker2State = WorkerState.COMMING;
		}
		
		break;
	#endregion
	
	#region WAITING
	case WorkerState.WAITING:
		if(ds_list_size(obj_area2.deliveredMaterials)>0){
			target = obj_area2.deliveredMaterials[| 0];
			with(obj_area2){
				ds_list_delete(deliveredMaterials, 0);
				delivered--;
			} 
			
			worker2State = WorkerState.RAW_MATERIAL;
		}
		break;
	#endregion

	#region WORKING
	case WorkerState.WORKING:
		target.sprite_index = spr_no_sprite;
		if(wSpd > 0) wSpd--;
		else{
			wSpd = wSpdMax;
			target.production -= wStr;
		}
		break;
	#endregion
		
}
#endregion


#region ANIMATION
if(target != noone && target.grabed){
	image_angle = 0;
	walk_anim = 0;
}
else{
	walk_anim += 0.2;
image_angle =  sin(walk_anim) * 5;

}
#endregion
	
	
#region CLICK AREA
var click = device_mouse_check_button_pressed(0, mb_left);
if(mouse_x >= bbox_left && mouse_x <= bbox_right && mouse_y >= bbox_top && mouse_y <= bbox_bottom){
	image_index = 1;	
		if(click){
			with(obj_camera){
				follow = other.id;
			}
		}
}
else{
	image_index = 0;
}
#endregion