class ChangeSpecieIdToSpeciesId < ActiveRecord::Migration
  def change
    rename_column :species_categories, :specie_id, :species_id
  end
end
