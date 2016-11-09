class Project < ActiveRecord::Base
    has_many :users_projects
    has_many :users, through: :users_projects
end
