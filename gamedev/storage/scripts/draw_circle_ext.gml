#define draw_circle_ext
/// draw_circle_ext(x,y,rad1,rad2,ang,circ);

/// circ is a val from 0-1 describing how much of the circumference to draw

var cx = argument[0];
var cy = argument[1];
var rad1 = min(argument[2],argument[3]);
var rad2 = max(argument[2],argument[3]);
var ang1 = argument[4];
var circ = clamp(argument[5],-1,1);
var ang2 = ang1 + circ*360;

draw_primitive_begin(pr_trianglestrip);

var vtx = round(abs(circ)*90);
var deg = 4*sign(circ);
for(var i=0; i<vtx; i++;)
    {
    ldx = lengthdir_x(1,ang1+deg*i);
    ldy = lengthdir_y(1,ang1+deg*i);
    draw_vertex(cx + ldx*rad2,cy + ldy*rad2);
    draw_vertex(cx + ldx*rad1,cy + ldy*rad1);
    }

ldx = lengthdir_x(1,ang1 + circ*360);
ldy = lengthdir_y(1,ang1 + circ*360);
draw_vertex(cx + ldx*rad2,cy + ldy*rad2);
draw_vertex(cx + ldx*rad1,cy + ldy*rad1);

draw_primitive_end();

