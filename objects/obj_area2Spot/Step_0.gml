if(instance_exists(follow)){
	if(follow.worker2State == WorkerState.WORKING) sprite_index = spr_area2sp_1working;
	else sprite_index = spr_area2sp_1idle;
} 
else follow = noone;
