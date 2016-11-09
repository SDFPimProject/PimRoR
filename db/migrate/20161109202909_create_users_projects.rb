class CreateUsersProjects < ActiveRecord::Migration
  def change
    create_table :users_projects do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.string :user_project_role, null: true, default: ''

      t.timestamps null: false
    end
  end
end
