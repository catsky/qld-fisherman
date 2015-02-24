class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :street
      t.string :park
      t.string :postcode
      t.string :suburb
      t.string :state
      t.string :country
      t.boolean :visible
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
