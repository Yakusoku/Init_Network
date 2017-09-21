/// @description Clean object
// If theres already a server running, shut down and delete.
ds_map_destroy(clients);
ds_list_destroy(socketlist);
buffer_delete(broadcast_buffer);
buffer_delete(player_buffer);
