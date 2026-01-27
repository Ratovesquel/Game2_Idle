
switch (worker1State){
	case WorkerState.SELLING:
		show_debug_message("chegou")
		if(MoveTo(global.MarkertX, global.MarkertY, spd)){
			target.selled = true;
			worker1State = WorkerState.COMMING;
		} 
		
		break;
		
		
	case WorkerState.COMMING:
		if(MoveTo(areaX, areaY, spd)) worker1State = WorkerState.WORKING;
		break;
		
		
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
		
		
	case WorkerState.MATERIAL:
		show_debug_message("chegou 1")
		if(MoveTo(target.x, target.y, spd)){
			target.follow = self;
			target.grabed = true;
			worker1State = WorkerState.SELLING;
			
			show_debug_message("chegou 2")
		}
		break;
}