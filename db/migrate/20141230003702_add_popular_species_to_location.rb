class AddPopularSpeciesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :popular_species, :text
  end
end
