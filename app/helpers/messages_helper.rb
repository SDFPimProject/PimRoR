module MessagesHelper
  def self_or_other(message, user)
    message.user.id == user.id ? "self" : "other"
  end

  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end

  def set_messages_receive(conversation_id, messages)
    messages.each do |message|
      message.is_receive=true
      message.save!

      Fiber.new{
        WebsocketRails[message.send_from_id].trigger('new_message_status', {
            :conversation_id => conversation_id,
            :message_id => message.id,
            :html => render_to_string(:template => 'messages/_message-status.html.erb', :locals => { :message => message }, layout: false)
        })
      }.resume
    end
  end
end