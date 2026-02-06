
#region STATE MACHINE
switch (worker1State){
	
	#region BACK TO WORK, SLAVE >:)
	case WorkerState.COMMING:
		if(MoveTo(areaX, areaY, spd)){
			MoveTo(areaX, areaY, 0);
			
			worker1State = WorkerState.WORKING;
		} 
		break;
	#endregion
	
	#region NEXT AREA
	case WorkerState.NEXT_AREA:
		if(MoveTo(obj_area2.x+obj_area2.deliveredAreaXY[0], obj_area2.y+obj_area2.deliveredAreaXY[1], spd)){
			MoveTo(x, y, 0);
			ds_list_add(obj_area2.deliveredMaterials, target);
			target.follow = noone;
			target.grabed = false;
			target = noone;
			worker1State = WorkerState.COMMING;
		}
		break;
	#endregion
	
	#region GET MATERIAL
	case WorkerState.RAW_MATERIAL:
		if(MoveTo(target.x, target.y, spd)){
			target.follow = self;
			target.grabed = true;
			MoveTo(target.x, target.y, 0);
			if(instance_exists(obj_area2)){
				if(obj_area2.delivered < obj_area2.deliveredMax && obj_area2.nWorker > 0){
				worker1State = WorkerState.NEXT_AREA;
				obj_area2.delivered++;
				}			
				else worker1State = WorkerState.SELLING;
			}
			else worker1State = WorkerState.SELLING;
		}
		break;
	#endregion		
	
	#region SELLING
	case WorkerState.SELLING:
		if(MoveTo(obj_markert.x, obj_markert.y, spd)){
			target.selled = true;
			MoveTo(obj_markert.x, obj_markert.y, 0);
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