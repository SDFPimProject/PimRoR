class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :content
      t.integer :user_id
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :hours
      t.integer :minutes

      t.timestamps null: false
    end
  end
end
