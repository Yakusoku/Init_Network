/// @description  Send a name "event" to the server
///
///  arg0 = name
///
{
	var name = argument0;
	
    // Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
    buffer_seek(buff, buffer_seek_start, 0);

    // Write the command, and the name into the buffer.
    buffer_write(buff, buffer_s16, myNAME_CMD);
    buffer_write(buff, buffer_string, name);

    // Send this to the server
    network_send_packet(client, buff, buffer_tell(buff));
}
