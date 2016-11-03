class AddUserConnectionId < ActiveRecord::Migration
  def change
    add_column :users, :connection_id, :string, null: false, default: ''
  end
end
