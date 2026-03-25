
#region STATE MACHINE
switch (worker3State){
	
	#region COMMING BACK, SLAVE >:)
	case WorkerState.COMMING:
	
		if(PathSchedule(areaX, areaY)){
			StopPath();
			
			worker3State = WorkerState.WAITING;
		}
		 
		break;
	#endregion
	
	#region GET PRODUCED MATERIAL
	case WorkerState.PRODUCED_MATERIAL:
	
		if(PathSchedule(target.x, target.y)){
			StopPath();
			
			target.grabed = true;
			target.follow = self;
			worker3State = WorkerState.SELLING;
		}

		break;
	#endregion
	
	#region SELLING
	case WorkerState.SELLING:
	
		if(PathSchedule(obj_markert.x, obj_markert.y)){
			StopPath();
			
			target.selled = true;
			worker3State = WorkerState.COMMING;
		}
		
		break;
	#endregion
	
	#region WAITING
	case WorkerState.WAITING:
		if(obj_area3.hasWork) worker3State = WorkerState.WORKING;
		break;
	#endregion
	
	#region WORKING
	case WorkerState.WORKING:
		if(!obj_area3.hasWork){
			wSpd = wSpdMax;
			worker3State = WorkerState.WAITING;
		} 
		else if(wSpd > 0) wSpd--;
		else{
			wSpd = wSpdMax;
			with(obj_area3){
				//flash = 8;
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

//show_debug_message("Estado: "+string(worker3State));