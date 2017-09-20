/// @description Start game Client
{
	var i = iServerName;
	global.ServerName = i.Text;

	//network_destroy(global.broadcast_server);
	//global.broadcast_server = -1;


	show_debug_message("#######################################");
	show_debug_message("Next room");
	show_debug_message("#######################################");
	room_goto(Level1);	
}
