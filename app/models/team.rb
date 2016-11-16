class Team < ActiveRecord::Base
    has_many :users_teams
    accepts_nested_attributes_for :users_teams
    has_many :users, through: :users_teams

end
