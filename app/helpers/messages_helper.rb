module MessagesHelper
  def self_or_other(message, user)
    message.user.id == user.id ? "self" : "other"
  end

  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end