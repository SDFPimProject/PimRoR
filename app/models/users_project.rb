class UsersProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  ROLES = %i[user manager]
end
