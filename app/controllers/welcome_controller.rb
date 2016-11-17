class WelcomeController < ApplicationController
  include MessagesHelper
  # TO MACIG STUFF oN INIT
  def index
    conversations = Conversation.involving(current_user)
    unread = 0
    conversations.each do |conversation|
      unread = unread + conversation.messages.unread(conversation.id, current_user).size
      set_messages_receive(conversation.id, conversation.messages.where("messages.send_from_id <> ? AND messages.is_read = false", current_user))
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
