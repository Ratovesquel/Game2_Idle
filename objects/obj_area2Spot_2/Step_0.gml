if(instance_exists(follow)){
	if(follow.worker2State == WorkerState.WORKING) sprite_index = spr_area2sp_2working;
	else sprite_index = spr_area2sp_2idle;
} 
else follow = noone;
