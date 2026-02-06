
#region STATE MACHINE
switch (worker2State){
	
	#region BACK TO WORK, SLAVE >:)
	case WorkerState.COMMING:
	
		if(MoveTo(areaX, areaY, spd)){
			MoveTo(areaX, areaY, 0);
			
			if(target != noone && target.follow != noone){
				target.grabed = false;
				// add some position to the material that depends of w2 position
				worker2State = WorkerState.WORKING;
			} 
			else{
				worker2State = WorkerState.WAITING;
			}			
		} 
		
		break;
	#endregion
	
	#region NEXT AREA
	case WorkerState.NEXT_AREA:
	//	if(MoveTo(obj_area2.x+obj_area2.deliveredAreaXY[0], obj_area2.y+obj_area2.deliveredAreaXY[1], spd)){
	//		MoveTo(x, y, 0);
	//		target.follow = noone;
	//		target.grabed = false;
	//		target = noone;
	//		worker2State = WorkerState.COMMING;
	//	}
		break;
	#endregion
	
	#region GET PRODUCED MATERIAL
	case WorkerState.PRODUCED_MATERIAL:
		if(MoveTo(target.x, target.y, spd)){
			MoveTo(target.x, target.y, 0);
			target.grabed = true;			
			
			if(instance_exists(obj_area3)){
				if(obj_area3.delivered < obj_area3.deliveredMax){
				worker2State = WorkerState.NEXT_AREA;
				obj_area2.delivered++;
				}			
				else worker2State = WorkerState.SELLING;
			}
			else worker2State = WorkerState.SELLING;
		}
		break;
	#endregion
	
	#region GET NEW MATERIAL
	case WorkerState.RAW_MATERIAL:
	
		if(MoveTo(target.x, target.y, spd)){
			target.follow = self;
			target.grabed = true;
			MoveTo(target.x, target.y, 0);
			worker2State = WorkerState.COMMING;

		}
		break;
	#endregion	
	
	#region SELLING
	case WorkerState.SELLING:
		if(MoveTo(obj_markert.x, obj_markert.y, spd)){
			MoveTo(obj_markert.x, obj_markert.y, 0);
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