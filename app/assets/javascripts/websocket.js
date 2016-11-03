$(function() {
    // Connect to websocket
    dispatcher.on_open = function(data) {
        console.log('Connection has been established: ', data);
        if(user.id) {
            dispatcher.trigger('user_connected');
        }
    };
    //Disconnect to websocket
    dispatcher.bind('connection_closed', function(data) {
        console.log('connection is closed');
        // Try Reconnect
        dispatcher = new WebSocketRails( url + '/websocket');
    });

    //User Channel for Private Single Messages to one User
    if(user.id){
        dispatcher.subscribe(user.id).bind('new_notification', function(data) {
            Messenger().post(data);
        });
    }
    //Channel for All, alle Client get an Inforamtions
    dispatcher.subscribe('all').bind('new_notification', function(data) {
        Messenger().post(data);
    });

});
