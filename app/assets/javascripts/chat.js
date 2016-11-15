//Cingelton Chat instance
var Chat = (function() {
    var instance;

    function init() {
        //PRIVAT
        var CLASS_CONVESATIONS_LIST = "conversation_list";
        var CLASS_CHAT_BOX_WRAPPER = "chat_box_wrapper";
        var CLASS_CHAT_BOX_CONTENT = "chat_box_content";
        var CLASS_CHAT_BOX_TEXTAREA = "chat_box_textarea";
        var PATH_CONVERSATIONS = "conversations/";
        var PATH_MESSAGES = "/messages";
        var currentConversation = null;

        function notifyNewMessage(name) {
            toastr['info']("New Message from " + name);
        }

        function setConversationList(html) {
            console.log(html);
            $("." + CLASS_CONVESATIONS_LIST).html(html);
        }

        function setTextMessage(html){
            $("." + CLASS_CHAT_BOX_WRAPPER).html(html);

            var chatContent = $('.' + CLASS_CHAT_BOX_CONTENT);
            chatContent.scrollTop(chatContent[0].scrollHeight);
        }

        function appendTextMessage(html){
            var chatContent = $('.' + CLASS_CHAT_BOX_CONTENT);
            chatContent.append(html);
            chatContent.scrollTop(chatContent[0].scrollHeight);
        }

        function setMessageRead(conversation_id){
            $.post('messages_read', {conversation_id: conversation_id}, function () {
                loadConversationData();
            });
        }
        function loadConversationData() {
            $.get('conservations_list', setConversationList, "html");
        }
        
        function loadChatData(conversation_id){
            $.get(PATH_CONVERSATIONS + conversation_id, function(data){
                setTextMessage(data);
                setMessageRead(conversation_id)
            }, "html");
        }

        function sendMessage(text){
            text = text.replace(/^\s+|\s+$/g, "");

            if(text == "")
                return;

            $.post(PATH_CONVERSATIONS + currentConversation + PATH_MESSAGES, { message:{body: text}},
                function (data) {
                    var textarea = $('.' + CLASS_CHAT_BOX_TEXTAREA);
                    textarea.val('');
                    textarea.focus();
                    textarea.css('height', '44px');

                    appendTextMessage(data);

                    loadConversationData();
                }).fail(function (error) {
                //TODO super stuff
            });
        }

        return {
            //PUBLIC
            openChat : function(conversation_id){
                currentConversation = conversation_id;
                loadChatData(conversation_id);
            },
            webSocketNewMessage: function (conversation_id, message_id, from_user, html) {
                //Prüfung ob überhaupt Chat Box vorhanden oder auf andere Seire
                if($('.' + CLASS_CHAT_BOX_WRAPPER).length >= 1){
                    //Prüfung ob auch aktuelle Konversation
                    if(currentConversation == conversation_id){
                        appendTextMessage(html);
                        //TODO NACHRICHT als EMFANGEN Markieren
                        //TODO NACHRICHT als GELESEN Markieren
                    }else{
                        //TODO NACHRICHT als EMFANGEN Markieren
                        loadConversationData();
                        notifyNewMessage(from_user.first_name);
                    }
                }else{
                    //TODO NACHRICHT als EMPFANGEN Markieren
                    notifyNewMessage(from_user.first_name);
                }
            },
            webSocketConversation: function (html) {
                //Prüfung ob überhaupt Liste vorhanden oder auf andere Seire
                if($('.' + CLASS_CONVESATIONS_LIST).length >= 1){
                    setConversationList(html);
                }
            },
            checkInputKey:function (event, textarea) {
                if (event.keyCode == 13 && !event.shiftKey && !event.ctrlKey) {
                    event.preventDefault();
                    sendMessage(textarea.val());
                }
            },
            clickSubmit:function () {
                sendMessage($('.' + CLASS_CHAT_BOX_TEXTAREA).val())
            }
        };
    }
    return {
        getInstance: function () {
            if(!instance){
                instance = init();
            }
            return instance;
        }
    };
})();