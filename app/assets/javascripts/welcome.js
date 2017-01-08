//Events
$(document).on('click', '#push_notify_all', function() {
    dispatcher.trigger('notification.to_all', {message: "Hey all! What's UPP!!!!!!"});
});
$(document).on('click', '.dashboard-messages tr', function (e) {
    e.preventDefault();
    var user_id = $(this).data('userid');
    var current_id = user.id;

    if(user_id){
        $.post("/conversations", { sender_id: user_id, recipient_id: current_id }, function (data) {
            Chat.getInstance().openChatFromOtherPage(data.conversation_id);
        });
    }

});

$(document).on('click', '.dashboard_table tr', function (e) {
    e.preventDefault();
    var event_id = $(this).data('eventid');
    window.location.href = "/events/" + event_id;
});


//Functions
$('#calendar_go_to_date').datepicker();
