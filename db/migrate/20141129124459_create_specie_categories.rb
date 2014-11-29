class CreateSpecieCategories < ActiveRecord::Migration
  def change
    create_table :specie_categories do |t|
      t.integer :specie_id
      t.integer :category_id

      t.timestamps
    end
  end
end
