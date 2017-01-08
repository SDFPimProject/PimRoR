class CreateEvents < ActiveRecord::Migration
    def change
      create_table :events do |t|
        t.integer :creator_id
        t.string :title
        t.string :location
        t.text :description
        t.datetime :start_time
        t.datetime :end_time
        t.integer :deleted
        t.timestamps null: false
      end
    end
end
