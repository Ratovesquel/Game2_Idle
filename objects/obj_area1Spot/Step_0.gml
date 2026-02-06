
if(instance_exists(follow)){
	if(follow.worker1State == WorkerState.WORKING) sprite_index = spr_area1sp_working;
	else sprite_index = spr_area1sp_idle;
} 
else follow = noone;
