class AddNameToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :suburb, :string
    add_column :locations, :park_name, :string
    remove_column :locations, :name
  end
end
