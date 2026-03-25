function PathSchedule(finalX, finalY){
	if(!pathActive){
			path = path_add();

	        if(mp_grid_path(global.grid, path, x, y, finalX, finalY, true)){
	            path_start(path, spd, path_action_stop, false);
	            pathActive = true;
	        }
	    }
		
		var aux = false;
		if(path_position >= 1) aux = true;
		
	return aux;
}