/// @description  Create server and initialise map
global.counter = 0;

// Total number of players and baddies connected
global.PlayerTotal = 0;

// create our server. Server creation may fail if there is already a server running. If it does fail, delete eveything and kill this instance
broadcast_buffer	= buffer_create(32, buffer_fixed, 1);
player_buffer		= buffer_create(16384, buffer_fixed, 1);
clients				= ds_map_create();
socketlist			= ds_list_create();

// Try and create the actual server
server = network_create_server(network_socket_tcp, 6510, 32);
if( server < 0 ) {    
    instance_destroy();
}

// Setup a timer so we can broadcast the server IP out to local clients looking...
alarm[0] = 60;
