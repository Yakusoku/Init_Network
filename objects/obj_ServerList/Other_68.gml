/// @description Detect servers "broadcast"

var eventid = ds_map_find_value(async_load, "id");

if (eventid == istBroadcastServer)
{
    var ip = ds_map_find_value(async_load, "ip");

    // incoming data for the server from a connected saocket
    var buff = ds_map_find_value(async_load, "buffer");
    name = buffer_read(buff, buffer_string);

    // Add to our list...if we don't already have it!
    var index = ds_list_find_index(istServersList, ip);
    if(index < 0) {
        ds_list_add(istServersList, ip);
        ds_list_add(istServerNames, name);
        show_debug_message("New server found at: " + ip + "   called: " + name);
    }    
}
