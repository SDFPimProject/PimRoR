class Project < ActiveRecord::Base
    has_many :users_projects
    has_many :users, through: :users_projects

    validates :name, length: { minimum: 2, maximum: 50 }, presence: true
end
