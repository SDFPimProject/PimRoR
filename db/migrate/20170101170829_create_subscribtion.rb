class CreateSubscribtion < ActiveRecord::Migration
  def change
    create_table :subscribtions do |t|
    t.belongs_to :user, index:true
    t.integer :calendar_id
    t.string :name

    end
  end
end
