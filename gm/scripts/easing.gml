#define ease_quadratic_in
/// ease_quadratic_in(t);

var t = argument0;

return(sqr(t));

#define ease_quadratic_out
/// ease_quadratic_out(t);

var t = argument0;

return(1-sqr(1-t));

#define ease_quadratic_inout
/// ease_quadratic_inout(t);

var t = argument0;

if (t <= 0.5)
    return(sqr(t*2)/2);
return(1 - sqr((1-t)*2)/2);

#define ease_cubic_in
/// ease_cubic_in(t);

var t = argument0;

return(power(t,3));

#define ease_cubic_out
/// ease_cubic_out(t);

var t = argument0;

return(1 - power(1-t,3));

#define ease_cubic_inout
/// ease_cubic_inout(t);

var t = argument0;

if (t <= 0.5)
    return(power(t*2,3)/2);
return(1 - power((1-t)*2,3)/2);

#define ease_quartic_in
/// ease_quartic_in(t);

var t = argument0;

return(power(t,4));

#define ease_quartic_out
/// ease_quartic_out(t);

var t = argument0;

return(1 - power(1-t,4));

#define ease_quartic_inout
/// ease_quartic_inout(t);

var t = argument0;

if (t <= 0.5)
    return(power(t*2,4)/2);
return(1 - power((1-t)*2,4)/2);

#define ease_quintic_in
/// ease_quintic_in(t);

var t = argument0;

return(power(t,5));

#define ease_quintic_out
/// ease_quintic_out(t);

var t = argument0;

return(1 - power(1-t,5));

#define ease_quintic_inout
/// ease_quintic_inout(t);

var t = argument0;

if (t <= 0.5)
    return(power(t*2,5)/2);
return(1 - power((1-t)*2,5)/2);

#define ease_exponential_in
/// ease_exponential_in(t);

var t = argument0;

return(power(2,10*(t-1)));

#define ease_exponential_out
/// ease_exponential_out(t);

var t = argument0;

return(1 - power(2,10*(t)));

#define ease_exponential_inout
/// ease_exponential_inout(t);

var t = argument0;

if (t <= 0.5)
    return(power(2,10*((t*2)-1))/2);
return(1 - power(2,-10*((t*2)-1))/2);

#define ease_sinusoidal_in
/// ease_sinusoidal_in(t);

var t = argument0;

return(1 - sin((1-t) * pi/2));

#define ease_sinusoidal_out
/// ease_sinusoidal_out(t);

var t = argument0;

return(cos((1-t) * pi/2));

#define ease_sinusoidal_inout
/// ease_sinusoidal_inout(t);

var t = argument0;

if (t <= 0.5)
    return(1 - sin((1-(t*2)) * pi/2)/2);
return(1 - sin((1-(t*2)) * pi/2)/2);

#define ease_circular_in
/// ease_circular_in(t);

var t = argument0;

return(-(sqrt(1 - sqr(t)) - 1));

#define ease_circular_out
/// ease_circular_out(t);

var t = argument0;

return(sqrt(1 - sqr(t-1)));

#define ease_circular_inout
/// ease_circular_inout(t);

var t = argument0;

if (t <= 0.5)
    return(-(sqrt(max(0,1 - sqr(t*2))) - 1)/2);
return(0.5 + sqrt(max(0,1 - sqr((t-1)*2)))/2);

#define ease_elastic_in
/// ease_elastic_in(t);

var t = argument0;

return(-(power(2,10*(t-1)) * sin((t-1.70158)*(2*pi)/0.3)));

#define ease_elastic_out
/// ease_elastic_out(t);

var t = argument0;

// return(power(2,-10*t) * sin((t-1.70158)*(2*pi)/0.3));
return(power(2,-10*t) * sin((t-0.075)*(2*pi)/0.3) + 1);

#define ease_elastic_inout
/// ease_elastic_inout(t);

var t = argument0;

if (t <= 0.5)
    return(t + 1 * power(2,10*(t*2-1)) * sin(((t-1)*2-1.70158)*(2*pi)/0.45));
return(t + 1 * power(2,-10*(t*2-1)) * sin(((t-1)*2-1.70158)*(2*pi)/0.45));

#define ease_back_in
/// ease_back_in(t);

var t = argument0;
var s = 1.70158;

return(sqr(t)*((s+1)*t - s));

#define ease_back_out
/// ease_back_out(t);

var t = argument0 - 1;
var s = 1.70158;

return(sqr(t)*((s+1)*t + s) + 1);

#define ease_back_inout
/// ease_back_inout(t);

var t = argument0 * 2;
var s = 1.70158 * 1.525;

if (t <= 1)
    return((sqr(t)*((s + 1)*t - s))/2);
return((sqr(t-2)*((s + 1)*(t-2) + s) + 2)/2);

#define ease_bounce_in
/// ease_bounce_in(t);

var t = 1 - argument0;

if (t < (1/2.75))
    return(1-(7.5625*sqr(t)));
if (t < 2/2.75)
return(1-(7.5625*sqr(t - 1.5/2.75) + 0.75));
if (t < 2.5/2.75)
return(1-(7.5625*sqr(t - 2.25/2.75) + 0.9375));
return(1-(7.5625*sqr(t - 2.625/2.75) + 0.984375));

#define ease_bounce_out
/// ease_bounce_out(t);

var t = argument0;

if (t < (1/2.75))
    return(7.5625*sqr(t));
if (t < 2/2.75)
			return(7.5625*sqr(t - 1.5/2.75) + 0.75);
if (t < 2.5/2.75)
			return(7.5625*sqr(t - 2.25/2.75) + 0.9375);
return(7.5625*sqr(t - 2.625/2.75) + 0.984375);

#define ease_bezier_quadratic
/// ease_bezier_quadratic(p1,p2,p3,t);

// control points [x/y]
var p1 = argument0;
var p2 = argument1;
var p3 = argument2;

// progress along the curve [0-1]
var t = argument3;

// calculate curve
return( sqr(1-t)*p1 + 2*(1-t)*t*p2 + sqr(t)*p3 );

#define ease_bezier_cubic
/// ease_bezier_cubic(p1,p2,p3,p4,t);

// control points [x/y]
var p1 = argument0;
var p2 = argument1;
var p3 = argument2;
var p4 = argument3;

// progress along the curve [0-1]
var t = argument4;

// calculate curve
return( power(1-t,3)*p1 + 3*sqr(1-t)*t*p2 + 3*(1-t)*sqr(t)*p3 + power(t,3)*p4 );

