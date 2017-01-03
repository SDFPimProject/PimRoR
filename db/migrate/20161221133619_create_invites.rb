class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :event_id
      t.integer :sender_id
      t.integer :recipient_id
      t.text :sender_comment
      t.text :recipient_comment
      t.integer :sender_status
      t.integer :recipient_status

      t.timestamps null: false
    end
  end
end
