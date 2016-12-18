class Message < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :conversation, :foreign_key => :conversation_id, class_name: 'Conversation'
  belongs_to :user, :foreign_key => :send_from_id, class_name: 'User'

  validates_with MessageValidator

  if Rails.env.development?
    attr_encrypted :body, key: 'PimRoR ist ein super geiles Projekt!'
  end
  if Rails.env.production?
    attr_encrypted :body, key: ENV['MESSAGE_API_KEY'], if: Rails.env.production?
  end

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  scope :unread, -> (conversation_id, user) do
    where("messages.conversation_id = ? AND messages.send_from_id <> ? AND is_read = false", conversation_id ,user)
  end
end
