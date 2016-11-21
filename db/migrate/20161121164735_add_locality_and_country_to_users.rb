class AddLocalityAndCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locality, :string
    add_column :users, :country_name, :string
  end
end
