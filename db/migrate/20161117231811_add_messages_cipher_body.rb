class AddMessagesCipherBody < ActiveRecord::Migration
  def change
    add_column :messages, :encrypted_body, :text, null: false, default: ""
    add_column :messages, :encrypted_body_iv, :text, null: false, default: ""
    remove_column :messages, :body
  end
end
