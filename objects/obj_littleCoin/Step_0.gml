x += hspd;

y += vspd;

vspd += gvt;

timer++;

if(timer >= 100) instance_destroy();

image_alpha = 1-timer/100;
