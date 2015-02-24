class CreateMomentStars < ActiveRecord::Migration
  def change
    create_table :moment_stars do |t|
      t.integer :moment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
