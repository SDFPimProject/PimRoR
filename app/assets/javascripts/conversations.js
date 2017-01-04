//Events
document.addEventListener("turbolinks:load", function() {
    Chat.getInstance().openMessanger();
});

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
$(document).on('keyup', '.search-user-chat', function (event) {
    Chat.getInstance().searchUser($(this))
});
$(document).on('click', '.btn_message_delete', function (e) {
    e.preventDefault();
    var message_id = $(this).data('mid');
    Chat.getInstance().deleteMessage(message_id);
});
$(document).on('click', '.btn_chat_overview', function (e) {
    e.preventDefault();
    Chat.getInstance().showOverview();
});
$(document).on('click', '.user-search-list-wrapper.chat li', function (e) {
    e.preventDefault();
    var user_id = $(this).data('userid');
    var current_id = user.id;

    if(user_id)
        openConversation(user_id, current_id);
});

//Functions
function openConversation(sender_id, recipient_id){
    $.post("/conversations", { sender_id: sender_id, recipient_id: recipient_id }, function (data) {
        Chat.getInstance().openChat(data.conversation_id);
    });
}
