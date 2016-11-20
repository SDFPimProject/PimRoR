class User < ActiveRecord::Base
  has_many :users_teams
  has_many :teams, through: :users_teams

  has_many :users_projects
  has_many :projects, through: :users_projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  #:registerable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  VALID_ADRESS_REGEX = /\A(.*?)\s+(\d+[a-zA-Z]{0,1}\s{0,1}[-]{1}\s{0,1}\d*[a-zA-Z]{0,1}|\d+[a-zA-Z-]{0,1}\d*[a-zA-Z]{0,1})/

  ROLES = %i[admin moderator author banned]

  validates :password, length: {minimum: 8, maximum: 120}, on: :update , allow_blank: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX,
    message: "Wrong Email format" }, on: :update , allow_blank: true
  validates :first_name, length: { minimum: 2, maximum: 50 }, presence: true,  on: :update
  validates :last_name, length: { minimum: 2, maximum: 50 }, presence: true,  on: :update

  validates :password, presence: true, length: {minimum: 8, maximum: 120}, on: :create
  validates :email, confirmation: true, format: { with: VALID_EMAIL_REGEX,
    message: "Wrong Email format" }, on: :create
  validates :email_confirmation, presence: true, on: :create
  validates :first_name, length: { minimum: 2, maximum: 50 }, presence: true,  on: :create
  validates :last_name, length: { minimum: 2, maximum: 50 }, presence: true,  on: :create

  validates :birthday, date: { before_or_equal_to: Time.now, message: 'Geburtsdatum muss in der Vergangenheit liegen.' }
  validates :street_and_nr, format: { with: VALID_ADRESS_REGEX }
  validates :state, length: { minimum: 2, maximum: 50 }
  validates :zip_code, zipcode: { country_code: :de }


  scope :online, -> (user) do
    where("user.connection_id <> ''")
  end

  scope :offline, -> (user) do
    where("user.connection_id = ''")
  end

  has_many :conversations, :foreign_key => :sender_id
  has_many :conversations, :foreign_key => :recipient_id
  has_many :messages, :foreign_key => :send_from_id


  before_validation :downcase_email

  def downcase_email
    email_confirmation.try(:downcase!)
    email.try(:downcase!)
  end
end