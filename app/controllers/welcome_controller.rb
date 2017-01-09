class WelcomeController < ApplicationController
  include MessagesHelper
  # TO MACIG STUFF oN INIT
  def index
    @conversations = Conversation.involving(current_user)
    conversations_new_message = Array.new
    unread = 0

    @conversations.each do |conversation|
      conversation.last_message = ActionView::Base.full_sanitizer.sanitize(conversation.messages.order('created_at').last.body[0..75])
      conversation.last_message_date = conversation.messages.order('created_at').last.created_at
      conversation.count_unread = conversation.messages.unread(conversation.id, current_user).size

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

    @invites = Invite.by_recipient_id(current_user.id).order('id');


  end
end
