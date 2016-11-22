//Events
$(document).on('click', '#push_notify_all', function() {
    dispatcher.trigger('notification.to_all', {message: "Hey all! What's UPP!!!!!!"});
});

//Functions
$('#calendar_go_to_date').datepicker();