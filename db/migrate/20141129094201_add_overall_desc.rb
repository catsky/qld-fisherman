class AddOverallDesc < ActiveRecord::Migration
  def change
    add_column :species, :descriptions, :text
  end
end
