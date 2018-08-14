#define polar_init
global.cos_amp = 0.25;
global.sin_amp = 0.25;
global.cos_stm = 5;
global.sin_stm = 7;
global.cos_off = 0;
global.sin_off = 0;

#define polar_update
/// polar_update(cos_amp,sin_amp,cos_stem,sin_stem,cos_off,sin_off);

global.cos_amp = argument[0];
global.sin_amp = argument[1];
global.cos_stm = argument[2];
global.sin_stm = argument[3];
global.cos_off = argument[4];
global.sin_off = argument[5];

#define polar_func
/// polar_func(theta,cos_amp,sin_amp,cos_stems,sin_stems,cos_offset,sin_offset)

var theta = argument[0];
var cos_amp = argument[1];
var sin_amp = argument[2];
var cos_stm = argument[3];
var sin_stm = argument[4];
var cos_off = argument[5];
var sin_off = argument[6];

return (abs(1.0 + cos_amp*dcos(theta*cos_stm + cos_off) + sin_amp*dsin(theta*sin_stm + sin_off)));

#define draw_polar
/// draw_polar(x,y,rad1,rad2,ang,circ);

/// circ is a val from -1 to 1 describing how much of the circumference to draw

var cx = argument[0];
var cy = argument[1];
var rad1 = min(argument[2],argument[3]);
var rad2 = max(argument[2],argument[3]);
var ang1 = argument[4];
var circ = clamp(argument[5],-1,1);
var ang2 = ang1 + circ*360;

draw_primitive_begin(pr_trianglestrip);

var scale = 1.0;
var vtx = round(abs(circ)*vertex_count); // vertices
var deg = (360/vertex_count)*sign(circ);
for(var i=0; i<vtx; i++;)
    {
    scale = polar_func_global(ang1 + deg*i);
    ldx =  dcos(ang1 + deg*i);
    ldy = -dsin(ang1 + deg*i);
    draw_vertex(cx + ldx*rad2*scale,cy + ldy*rad2*scale);
    draw_vertex(cx + ldx*rad1*scale,cy + ldy*rad1*scale);
    }

scale = polar_func_global(ang1 + circ*360);
ldx =  dcos(ang1 + circ*360);
ldy = -dsin(ang1 + circ*360);
draw_vertex(cx + ldx*rad2*scale,cy + ldy*rad2*scale);
draw_vertex(cx + ldx*rad1*scale,cy + ldy*rad1*scale);

draw_primitive_end();

