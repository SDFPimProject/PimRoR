class AddMessageStatusSend < ActiveRecord::Migration
  def change
    add_column :messages, :is_send, :boolean, :default => false
  end
end
