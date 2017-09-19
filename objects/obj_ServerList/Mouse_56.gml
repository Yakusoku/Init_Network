/// @description  Click server list

var yindex = 40;
var count = ds_list_size(istServersList);

if (mouse_y > 40 && mouse_y < (40 + (count * 30))) {
    var picked = floor(((mouse_y - 40) / 30));
    global.glbGameServerIP = ds_list_find_value(istServersList, picked);
	
	myStartOnlyClient();
}
