class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :conversation_id #instance of Conversation
      t.integer :send_from_id #instance of User

      t.boolean :is_receive, :default => false
      t.boolean :is_read, :default => false

      t.timestamps null: false
    end

    add_index :messages, :conversation_id
    add_index :messages, :send_from_id
  end
end
