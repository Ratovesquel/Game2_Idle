worker1State = WorkerState.COMMING;

operationF = false;

//global.wAreas = ds


function GoToSell(){
	if(y != global.MarkertY){
			if(x != 60){
				if(x> 60) x--;
				else x++;
			}
			else if(y != global.MarkertY){
				if(y > global.MarkertY) y--;
				else y++;
			}
	}
	else{
		if(x < global.MarkertX) x++;
		else worker1State = WorkerState.COMMING;
	}
}

function GoToWork(){
	if(y != areaY){
			if(x != 140){
				if(x> 140) x--;
				else x++;
			}
			else if(y != areaY){
				if(y > areaY) y--;
				else y++;
			}
		}
		else{
			if(x < areaX) x++;
			else worker1State = WorkerState.WORKING;
		}
}