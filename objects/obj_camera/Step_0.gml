#region ZOOM
var wheel = mouse_wheel_up() - mouse_wheel_down();

if (wheel != 0) {
    zoom -= wheel * zoomStep;
    zoom = clamp(zoom, zoomMin, zoomMax);

    var newW = camWight * zoom;
    var newH = camHeight * zoom;

    camera_set_view_size(view_camera[0], newW, newH);
}

#endregion


#region CLICK / DRAG START
if(!dragging && (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_middle))){
    dragging = true;

    drag_start_x = device_mouse_x_to_gui(0);
    drag_start_y = device_mouse_y_to_gui(0);

    cam_start_x = camera_get_view_x(view_camera[0]);
    cam_start_y = camera_get_view_y(view_camera[0]);
}
#endregion


#region DRAGGING
if (dragging) {

    if(!mouse_check_button(mb_left) && !mouse_check_button(mb_middle)){
        dragging = false;
    }
    else{
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        var dx = drag_start_x - mx;
        var dy = drag_start_y - my;
		
		var zoomFactor = camera_get_view_width(view_camera[0]) / camWight;

		dx *= zoomFactor;
		dy *= zoomFactor;


        camera_set_view_pos(view_camera[0], cam_start_x + dx, cam_start_y + dy);

        // enquanto arrasta, ignora follow
        exit;
    }
}
#endregion


#region FOLLOW
if(follow != noone && instance_exists(follow)){
    xTo = follow.x;
    yTo = follow.y;

    x += (xTo - x) / 25;
    y += (yTo - y) / 25;

    camera_set_view_pos(view_camera[0], x - (camWight / 2), y - (camHeight / 2));
}
#endregion













