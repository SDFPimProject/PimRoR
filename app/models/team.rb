class Team < ActiveRecord::Base
  has_and_belongs_to_many :Users, polymorphic: true
  has_and_belongs_to_many :Roles, polymorphic: true
end
