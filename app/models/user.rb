class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  #:registerable

  ROLES = %i[admin moderator author banned]

  validates :password, presence: true, length: {minimum: 6, maximum: 120}, on: :create
  validates :password, length: {minimum: 6, maximum: 120}, on: :update , allow_blank: true

  scope :online, -> (user) do
    where("user.connection_id <> ''")
  end

  scope :offline, -> (user) do
    where("user.connection_id = ''")
  end

  has_many :conversations, :foreign_key => :sender_id
  has_many :conversations, :foreign_key => :recipient_id
  has_many :messages, :foreign_key => :send_from_id
end