//Events
$(document).on('click', '.open-conversation', function(e) {
    e.preventDefault();
    var sender_id = $(this).data('sid');
    var recipient_id = $(this).data('rip');

    openConversation(sender_id, recipient_id);
});
$(document).on('click', '.chat_box_submit', function (event) {
    Chat.getInstance().clickSubmit();
});
$(document).on('keydown', '.chat_box_textarea', function (event) {
    Chat.getInstance().checkInputKey(event, $(this));
});
$(document).on('click', '.btn_message_delete', function (e) {
    e.preventDefault();
    var message_id = $(this).data('mid');
    Chat.getInstance().deleteMessage(message_id);
});

//Functions
function openConversation(sender_id, recipient_id){
    $.post("/conversations", { sender_id: sender_id, recipient_id: recipient_id }, function (data) {
        Chat.getInstance().openChat(data.conversation_id);
    });
}