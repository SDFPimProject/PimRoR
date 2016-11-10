class AddAdressBirthdtayToUser < ActiveRecord::Migration
  def change
   add_column :users, :street_and_nr, :string
   add_column :users, :state, :string
   add_column :users, :zip_code, :integer
  end
end
