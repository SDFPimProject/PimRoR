class Team < ActiveRecord::Base
    has_many :users_teams
    has_many :users, through: :users_teams

    validates :name, length: { minimum: 2, maximum: 50 }, presence: {message: "unzulässiges format"}

end
