#define ray_triangle
/// ray_triangle(ray,triangle);

// returns [intersects,ix,iy,iz];

/*
var rx1, ry1, rz1, dx1, dy1, dz1;
rx1 = ray[0]; dx1 = ray[3];
ry1 = ray[1]; dy1 = ray[4];
rz1 = ray[2]; dz1 = ray[5];

var tx1, ty1, tz1, tx2, ty2, tz2, tx3, ty3, tz3;
tx1 = tri[0]; tx2 = tri[3]; tx3 = tri[6];
ty1 = tri[1]; ty2 = tri[4]; ty3 = tri[7];
tz1 = tri[2]; tz2 = tri[5]; tz3 = tri[8];
*/

var ray = argument[0];
var tri = argument[1];
var int = -1;

var ex1, ey1, ez1, ex2, ey2, ez2;
ex1 = tri[3]-tri[0]; ex2 = tri[6]-tri[0];
ey1 = tri[4]-tri[1]; ey2 = tri[7]-tri[1];
ez1 = tri[5]-tri[2]; ez2 = tri[8]-tri[2];

var h = cross(ray[3],ray[4],ray[5],ex2,ey2,ez2);
var a = dot_product_3d(ex1,ey1,ez1,h[0],h[1],h[2]);

if ((a > -0.00001) and (a < 0.00001))
    return(-1); // false

var f = 1/a;

var sx1, sy1, sz1;
sx1 = ray[0]-tri[0]; sy1 = ray[1]-tri[1]; sz1 = ray[2]-tri[2];

var u = f * dot_product_3d(sx1,sy1,sz1,h[0],h[1],h[2]);

if ((u < 0) or (u > 1))
    return(-1); // false

var q = cross(sx1,sy1,sz1,ex1,ey1,ez1);
var v = f * dot_product_3d(ray[3],ray[4],ray[5],q[0],q[1],q[2]);

if ((v < 0) or (u+v > 1))
    return(-1); // false

// at this stage we can compute t to find out where
// the intersection point is on the line
var t = f * dot_product_3d(ex2,ey2,ez2,q[0],q[1],q[2]);

if (t > 0.00001) // ray intersection
    return(t); // true

// this means that there is a line intersection but not a ray intersection
else
    return(-1); // false

#define cross
/// cross(x1,y1,z1,x2,y2,z2);

// returns a vector array after performing the cross product on two vectors

var c;
c[0] = argument[1]*argument[5] - argument[4]*argument[2]; // x component [y1*z2 - y2*z1]
c[1] = argument[2]*argument[3] - argument[0]*argument[5]; // y component [z1*x2 - x1*z2]
c[2] = argument[0]*argument[4] - argument[1]*argument[3]; // z component [x1*y2 - y1*x2]
return(c);

