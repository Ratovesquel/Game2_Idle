//#region ZOOM
//var wheel = mouse_wheel_up() - mouse_wheel_down();

//if (wheel != 0) {
//    zoom -= wheel * zoomStep;
//    zoom = clamp(zoom, zoomMin, zoomMax);

//    var newW = camWight * zoom;
//    var newH = camHeight * zoom;

//    camera_set_view_size(view_camera[0], newW, newH);
//}

//#endregion


//#region CLICK / DRAG START
//if(!dragging && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle))){
//    dragging = true;

//    drag_start_x = device_mouse_x_to_gui(0);
//    drag_start_y = device_mouse_y_to_gui(0);

//    cam_start_x = camera_get_view_x(view_camera[0]);
//    cam_start_y = camera_get_view_y(view_camera[0]);
//}
//#endregion


//#region DRAGGING
//if (dragging) {

//    if(!mouse_check_button(mb_left) && !mouse_check_button(mb_middle)){
//        dragging = false;
//    }
//    else{
//        var mx = device_mouse_x_to_gui(0);
//        var my = device_mouse_y_to_gui(0);

//        var dx = drag_start_x - mx;
//        var dy = drag_start_y - my;
		
//		var zoomFactor = camera_get_view_width(view_camera[0]) / camWight;

//		dx *= zoomFactor;
//		dy *= zoomFactor;


//        camera_set_view_pos(view_camera[0], cam_start_x + dx, cam_start_y + dy);

//        // enquanto arrasta, ignora follow
//        exit;
//    }
//}
//#endregion


//#region FOLLOW
//if(follow != noone && instance_exists(follow)){
//    xTo = follow.x;
//    yTo = follow.y;

//    x += (xTo - x) / 25;
//    y += (yTo - y) / 25;

//    camera_set_view_pos(view_camera[0], x - (camWight / 2), y - (camHeight / 2));
//}
//#endregion


var cam = view_camera[0];

#region ZOOM
/// ---------- ZOOM (CORRIGIDO, SEM PULO) ----------
var wheel = mouse_wheel_up() - mouse_wheel_down();

var oldViewW = camera_get_view_width(cam);
var oldViewH = camera_get_view_height(cam);

var mx = 0;
var my = 0;

if (wheel != 0) {

    // mouse em coordenadas DO MUNDO (com tamanho ATUAL)
    var camViewX = camX;
    var camViewY = camY;

    mx = camViewX + (mouse_x / window_get_width()) * oldViewW;
    my = camViewY + (mouse_y / window_get_height()) * oldViewH;

    // atualiza alvo do zoom
    zoomTarget -= wheel * zoomStep;
    zoomTarget = clamp(zoomTarget, zoomMin, zoomMax);
}

// lerp do zoom PRIMEIRO
zoom = lerp(zoom, zoomTarget, zoomLerp);

// novo tamanho REAL da view
var viewW = baseW * zoom;
var viewH = baseH * zoom;

// mantém o ponto do mouse fixo
var ratioX = (mx - camX) / oldViewW;
var ratioY = (my - camY) / oldViewH;

camX = mx - ratioX * viewW;
camY = my - ratioY * viewH;

// aplica tamanho
camera_set_view_size(cam, viewW, viewH);

#endregion


#region DRAG
if(!dragging && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle))){

    dragging = true;

    drag_start_x = device_mouse_x_to_gui(0);
    drag_start_y = device_mouse_y_to_gui(0);

    cam_start_x = camX;
    cam_start_y = camY;
	
	if(follow != noone) follow = noone;
}

/// ---------- DRAGGING ----------
if(dragging){

    if(!mouse_check_button(mb_left) && !mouse_check_button(mb_middle)){
        dragging = false;
    }
    else {
        var zoomFactor = viewW / baseW;

        var dx = (drag_start_x - device_mouse_x_to_gui(0)) * zoomFactor;
        var dy = (drag_start_y - device_mouse_y_to_gui(0)) * zoomFactor;

        camX = cam_start_x + dx;
        camY = cam_start_y + dy;
    }
}

#endregion

/// ---------- FOLLOW ----------
if (!dragging && follow != noone && instance_exists(follow)) {

    var targetX = follow.x - viewW / 2;
    var targetY = follow.y - viewH / 2;

    camX = lerp(camX, targetX, followLerp);
    camY = lerp(camY, targetY, followLerp);
}

/// ---------- CLAMP NAS BORDAS ----------
camX = clamp(camX, 0, room_width  - viewW);
camY = clamp(camY, 0, room_height - viewH);

/// ---------- APLICA POSIÇÃO FINAL ----------
camera_set_view_pos(cam, camX, camY);










