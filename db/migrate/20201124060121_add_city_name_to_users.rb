class AddCityNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city_name, :string
  end
end
