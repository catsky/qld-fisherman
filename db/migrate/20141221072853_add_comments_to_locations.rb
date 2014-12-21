class AddCommentsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :comments, :text
  end
end
