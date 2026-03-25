
mySpots = ds_list_create();

myWorkers = ds_list_create();
personalArea = ds_list_create();
deliveredMaterials = ds_list_create();

ds_list_add(personalArea, [85,45], [150,45], [185,65], [185,110], [150,125], [85,125]);

deliveredAreaXY = [40,35];
createdAreaXY = [40,135];

deliverAreaX = x + deliveredAreaXY[0];
deliverAreaY = y + deliveredAreaXY[1];


//quando o w1 colocar o material, add esse material a lista, 
// no wait o w2 vê se tem coisa na lista, se tiver, tira da lista, vira seu target e entra em MATERIAL_RAW
//

