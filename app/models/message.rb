class Message < ActiveRecord::Base
  belongs_to :conversation, :foreign_key => :conversation_id, class_name: 'Conversation'
  belongs_to :user, :foreign_key => :send_from_id, class_name: 'User'

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  scope :unread, -> (conversation_id, user) do
    where("messages.conversation_id = ? AND messages.send_from_id <> ? AND is_read = false", conversation_id ,user)
  end
end
