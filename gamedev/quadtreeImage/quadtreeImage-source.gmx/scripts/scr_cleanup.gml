/// scr_cleanup();

if (ds_exists(node_list,ds_type_list))
    {
    for(var i=0; i<ds_list_size(node_list); i++;)
        {
        var temp_node = ds_list_find_value(node_list,0);
        ds_list_destroy(temp_node);
        ds_list_delete(node_list,0);
        }
    ds_list_destroy(node_list);
    }

if (surface_exists(surf_quad))
    surface_free(surf_quad);
if (surface_exists(surf_data))
    surface_free(surf_data);
if (surface_exists(surf_subd))
    surface_free(surf_subd);

view_xview[0] = 0;
view_yview[0] = 0;

total = 0;
scale = 1;
init = false;
