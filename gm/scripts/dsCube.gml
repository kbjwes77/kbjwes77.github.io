#define ds_cube_create
/// ds_cube_create(x,y,z,fast);

var cube = buffer_create(12 + argument0*argument1*argument2*4,buffer_fixed,4);

buffer_seek(cube,buffer_seek_start,0);
buffer_write(cube,buffer_u32,argument0);
buffer_write(cube,buffer_u32,argument1);
buffer_write(cube,buffer_u32,argument2);

return(cube);

#define ds_cube_destroy
/// ds_cube_destroy(id);

buffer_delete(argument0);

#define ds_cube_clear
/// ds_cube_clear(id,val,fast);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u32);
var ylen = buffer_read(argument0,buffer_u32);
var zlen = buffer_read(argument0,buffer_u32);

buffer_fill(argument0,12,buffer_u32,argument1,xlen*ylen*zlen*4);


#define ds_cube_set
/// ds_cube_set(id,x,y,z,val);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u32);
var ylen = buffer_read(argument0,buffer_u32);
var zlen = buffer_read(argument0,buffer_u32);

buffer_seek(argument0,buffer_seek_start,12 + ((xlen*ylen * argument3) + (xlen*argument1) + argument2)*4);
buffer_write(argument0,buffer_u32,argument4);

#define ds_cube_get
/// ds_cube_get(id,x,y,z);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u32);
var ylen = buffer_read(argument0,buffer_u32);
var zlen = buffer_read(argument0,buffer_u32);

buffer_seek(argument0,buffer_seek_start,12 + ((xlen*ylen * argument3) + (xlen*argument1) + argument2)*4);

return(buffer_read(argument0,buffer_u32));

#define ds_cube_seek
/// ds_cube_seek(id,x,y,z);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u32);
var ylen = buffer_read(argument0,buffer_u32);
var zlen = buffer_read(argument0,buffer_u32);

buffer_seek(argument0,buffer_seek_start,12 + ((xlen*ylen * argument3) + (xlen*argument1) + argument2)*4);

#define ds_cube_set_next
/// ds_cube_set_next(id,val);

buffer_write(argument0,buffer_u32,argument1);

#define ds_cube_get_next
/// ds_cube_get_next(id);

return(buffer_read(argument0,buffer_u32));

#define ds_fastcube_create
/// ds_fastcube_create(x,y,z);

var cube = buffer_create(3 + argument0*argument1*argument2,buffer_fast,1);

buffer_seek(cube,buffer_seek_start,0);
buffer_write(cube,buffer_u8,argument0);
buffer_write(cube,buffer_u8,argument1);
buffer_write(cube,buffer_u8,argument2);

return(cube);

#define ds_fastcube_destroy
/// ds_fastcube_destroy(id);

buffer_delete(argument0);

#define ds_fastcube_clear
/// ds_fastcube_clear(id,val);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u8);
var ylen = buffer_read(argument0,buffer_u8);
var zlen = buffer_read(argument0,buffer_u8);

buffer_fill(argument0,3,buffer_u8,argument1,xlen*ylen*zlen);

#define ds_fastcube_set
/// ds_fastcube_set(id,x,y,z,val);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u8);
var ylen = buffer_read(argument0,buffer_u8);
var zlen = buffer_read(argument0,buffer_u8);

buffer_seek(argument0,buffer_seek_start,3 + (xlen*ylen * argument3) + (xlen*argument1) + argument2);
buffer_write(argument0,buffer_u8,argument4);


#define ds_fastcube_get
/// ds_fastcube_get(id,x,y,z);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u8);
var ylen = buffer_read(argument0,buffer_u8);
var zlen = buffer_read(argument0,buffer_u8);

buffer_seek(argument0,buffer_seek_start,3 + (xlen*ylen * argument3) + (xlen*argument1) + argument2);

return(buffer_read(argument0,buffer_u8));



#define ds_fastcube_seek
/// ds_fastcube_seek(id,x,y,z);

buffer_seek(argument0,buffer_seek_start,0);
var xlen = buffer_read(argument0,buffer_u8);
var ylen = buffer_read(argument0,buffer_u8);
var zlen = buffer_read(argument0,buffer_u8);

buffer_seek(argument0,buffer_seek_start,3 + (xlen*ylen * argument3) + (xlen*argument1) + argument2);


#define ds_fastcube_set_next
/// ds_fastcube_set_next(id,val);

buffer_write(argument0,buffer_u8,argument1);

#define ds_fastcube_get_next
/// ds_fastcube_get_next(id);

return(buffer_read(argument0,buffer_u8));

