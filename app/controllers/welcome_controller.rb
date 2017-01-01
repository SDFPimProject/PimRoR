class WelcomeController < ApplicationController
  include MessagesHelper
  # TO MACIG STUFF oN INIT
  def index
    conversations = Conversation.involving(current_user)
    conversations_new_message = Array.new
    unread = 0

    conversations.each do |conversation|
      size = conversation.messages.unread(conversation.id, current_user).size
      if size > 0
        conversations_new_message.push(conversation)
        unread = unread + size
      end

      @subs=current_user.subscribtions
    end

    conversations_new_message.each do |conversation|
      set_messages_receive(conversation, false)
    end

    if unread > 0
      if unread == 1
        flash[:info] = "Du hast " + unread.to_s + " ungelesene Nachricht!"
      else
        flash[:info] = "Du hast " + unread.to_s + " ungelsene Nachrichte!"
      end
    end

  end
end
