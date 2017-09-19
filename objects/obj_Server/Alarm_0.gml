/// @description Broadcast our location occasionally. 
/// clients pick this up and display servers to the user. 

buffer_seek(broadcast_buffer, buffer_seek_start, 0);
buffer_write(broadcast_buffer, buffer_string, global.ServerName);
network_send_broadcast(server, 6511, broadcast_buffer, buffer_tell(broadcast_buffer));

// Broadcast once a second...
alarm[0] = 60;
