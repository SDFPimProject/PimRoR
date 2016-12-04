module MessagesHelper
  include ConversationsHelper

  def self_or_other(message, user)
    message.user.id == user.id ? "self" : "other"
  end

  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end

  def set_messages_receive(conversation, use_websocket)
    messages = conversation.messages.where("messages.send_from_id <> ? AND messages.is_receive = false", current_user)

    messages.each do |message|
      message.is_receive=true
      message.save!
    end

    if use_websocket
      send_new_status(conversation, messages)
    end
  end


  def set_messages_read(conversation, use_websocket)
    messages = conversation.messages.where("messages.send_from_id <> ? AND messages.is_read = false", current_user)

    messages.each do |message|
      message.is_read=true
      message.is_receive=true
      message.save!
    end

    if use_websocket
      send_new_status(conversation, messages)
    end
  end

  private

  def send_new_status(conversation, messages)
    messages_status = Array.new

    messages.each do |message|
      messages_status.push({
                                     :message_id => message.id,
                                     :html => render_to_string(:template => 'messages/_message-status.html.erb', :locals => { :message => message }, layout: false)
                                 })
    end
    Fiber.new{
      WebsocketRails[interlocutor(conversation).id].trigger('new_message_status', {
          :conversation => conversation.id,
          :messages => messages_status
      })
    }.resume
  end

end