$(function() {
    $('#push_notify_all').click(function () {
        console.log("TEST");
        dispatcher.trigger('notification.to_all', {message: "Hey all! What's UPP!!!!!!"});
    });
});