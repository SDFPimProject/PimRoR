    var bindWebSockets = function (dispatcher) {
        // Connect to websocket
        dispatcher.on_open = function(data) {
            console.log('Connection has been established.');
            if(user.id) {
                dispatcher.trigger('user_connected');
            }
        };
        //Disconnect to websocket
        dispatcher.bind('connection_closed', function(data) {
            console.log('Connection is closed');
            // Try Reconnect
            dispatcher = new WebSocketRails( url + '/websocket');
        });

        //User Channel for Private Single Messages to one User
        if(user.id){
            dispatcher.subscribe(user.id).bind('new_notification', function(data) {
                console.log(data);
                toastr[data.type](data.message);
            });
            dispatcher.subscribe(user.id).bind('new_message', function (data) {
                Chat.getInstance().webSocketNewMessage(data.conversation_id,
                    data.message_id,
                    data.send_from,
                    data.html);
            });
            dispatcher.subscribe(user.id).bind('new_message_status', function (data) {
                Chat.getInstance().webSocketNewMessageStatus(data.conversation_id,
                    data.message_id,
                    data.html);
            });
            dispatcher.subscribe(user.id).bind('delete_message', function (data) {
                Chat.getInstance().webSocketRemoveMessage(data.conversation_id, data.message_id);
            });
            dispatcher.subscribe(user.id).bind('new_conversation', function (data) {
                Chat.getInstance().webSocketConversation(data.html);
            });
        }
        //Channel for All, alle Client get an Inforamtions
        dispatcher.subscribe('all').bind('new_notification', function(data) {
            toastr[data.type](data.message);
        });
    };


