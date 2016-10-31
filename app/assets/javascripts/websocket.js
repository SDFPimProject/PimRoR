    var bindWebSockets = function (dispatcher) {
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
                toastr[data.type](data.message);
            });
            dispatcher.subscribe(user.id).bind('new_message', function (data) {
                Chat.getInstance().webSocketNewMessage(data.conversation_id,
                    data.message_id,
                    data.send_from,
                    data.html);
            });
            dispatcher.subscribe(user.id).bind('new_conversation', function (data) {
                Chat.getInstance().webSocketConversation(data.html);
            });
        }
};
