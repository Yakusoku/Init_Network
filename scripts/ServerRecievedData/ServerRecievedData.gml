/// @description  Read incoming data to the server from a connected saocket
{  
    // get the buffer the data resides in
    var buff = ds_map_find_value(async_load, "buffer");
    
    // read ythe command 
    var cmd = buffer_read(buff, buffer_s16);

    // Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
    var sock = ds_map_find_value(async_load, "id");
	
    // Look up the client details
    var inst = ds_map_find_value(clients, sock);

    // Is this a KEY command?
    if (cmd == myKEY_CMD)    
    {
        // Read the key that was sent
        var key = buffer_read(buff, buffer_s16);
		
        // And it's up/down state
        var updown = buffer_read(buff, buffer_s16);
    
        // translate keypress into an index for our player array.
        if (key == vk_left) {
            key = myLEFT_KEY;
        } else if (key == vk_right) {
            key = myRIGHT_KEY;
        } else if (key == vk_space) {
            key = myJUMP_KEY;
        }
         
        // translate updown into a bool for the player array       
        if (updown == 0) {
            inst.keys[key] = false;
        } else {
            inst.keys[key] = true;
        }
    } else if (cmd == myNAME_CMD) {
        // Set the client "name"
        inst.PlayerName = buffer_read(buff, buffer_string);    
    } else if (cmd == myPING_CMD) {
        // keep alive - ignore it
    }
}
