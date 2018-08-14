#define menu_init
/// menu_init();

menu = -1;
menus = -1;

#define menu_add_page
// menu_add_page

if (menu < 0)
    menu = 0;

menus++;

menu_items[menus] = 0;
menu_item[menus,menu_items[menus]] = "";

#define menu_add_item
/// menu_add_item(string);

menu_item[menus,menu_items[menus]] = argument[0];
menu_items[menus]++;

