production = productionMax;

deliveredAreaXY = [218,37];
createdAreaXY = [231,170];

mySpots = ds_list_create();
myWorkers = ds_list_create();
personalArea = ds_list_create();

ds_list_add(personalArea, [50,145], [120,78], [140,145], [210,78], [230,145]);



deliverAreaX = x + deliveredAreaXY[0];
deliverAreaY = y + deliveredAreaXY[1];