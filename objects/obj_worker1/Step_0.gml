
#region STATE MACHINE
switch (worker1State){
	
	#region COMMING BACK, SLAVE >:)
	case WorkerState.COMMING:		
	
		if(PathSchedule(areaX, areaY)){
			StopPath();
			
	        worker1State = WorkerState.WORKING;
		}
		
		break;
	#endregion
	
	#region NEXT AREA
	case WorkerState.NEXT_AREA:

	    if(PathSchedule(obj_area2.deliverAreaX, obj_area2.deliverAreaY)){
			StopPath();
			
			ds_list_add(obj_area2.deliveredMaterials, target);
			target.follow = noone;
			target.grabed = false;
			target = noone;
			worker1State = WorkerState.COMMING;
	    }
		
		break;
	#endregion
	
	#region GET PRODUCED MATERIAL
	case WorkerState.RAW_MATERIAL:

	    if(PathSchedule(target.x, target.y)){
			StopPath();
			
	        target.follow = self;
			target.grabed = true;
			if(instance_exists(obj_area2) && obj_area2.delivered < obj_area2.deliveredMax && obj_area2.nWorker > 0){
				worker1State = WorkerState.NEXT_AREA;
				obj_area2.delivered++;
			}
			else worker1State = WorkerState.SELLING;
	    }
	
		break;
	#endregion		
	
	#region SELLING
	case WorkerState.SELLING:
	
		if(PathSchedule(obj_markert.x, obj_markert.y)){
			StopPath();
			
			target.selled = true;
			worker1State = WorkerState.COMMING;
		}

		break;
	#endregion
	
	#region WORKING
	case WorkerState.WORKING:
		
		if(wSpd > 0) wSpd--;
		else{
			wSpd = wSpdMax;
			with(obj_area1){
				flash = 8;
				production -= other.wStr;
			}
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