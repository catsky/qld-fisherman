class ChangeSpieceToSpecies < ActiveRecord::Migration
  def change
    rename_table :specie_images, :species_images
    rename_table :specie_categories, :species_categories
  end
end
