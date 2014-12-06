class ChangeImage < ActiveRecord::Migration
  def change
    rename_column :species_images, :specie_id, :species_id
  end
end
