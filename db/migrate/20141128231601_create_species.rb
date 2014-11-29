class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :description
      t.string :distribution
      t.string :frequent_misidentifications
      t.string :scientific_name
      t.string :size_and_bag_limits
      t.string :size
      t.string :source_url

      t.timestamps
    end
  end
end
