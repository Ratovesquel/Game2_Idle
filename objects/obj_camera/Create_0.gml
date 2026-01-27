camWight = 600;
camHeight = 1020;

follow = noone;

xTo = x;
yTo = y;


dragging = false;

drag_start_x = 0;
drag_start_y = 0;

cam_start_x = 0;
cam_start_y = 0;




// posição lógica da câmera
camX = x;
camY = y;

// tamanho base da view
baseW = camWight;
baseH = camHeight;

// zoom
zoom = 1;
zoomTarget = 1;

zoomMin = 0.5;
zoomMax = 2;
zoomStep = 0.15;
zoomLerp = 0.15;

// suavidade da câmera
followLerp = 0.08;

