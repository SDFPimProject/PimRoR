class UsersTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  ROLES = %i[user manager]
end
