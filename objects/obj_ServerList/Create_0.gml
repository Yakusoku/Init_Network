/// @description Insert description here
// You can write your code in this editor
istServersList = ds_list_create();
istServerNames = ds_list_create();

istBroadcastServer = network_create_server(network_socket_udp, 6511, 100);
