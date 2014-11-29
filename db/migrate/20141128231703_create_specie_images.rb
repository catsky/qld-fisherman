class CreateSpecieImages < ActiveRecord::Migration
  def change
    create_table :specie_images do |t|
      t.string :image_url
      t.integer :specie_id

      t.timestamps
    end
  end
end
