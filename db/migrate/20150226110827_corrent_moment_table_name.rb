class CorrentMomentTableName < ActiveRecord::Migration
  def change
    rename_table :moments, :moments
  end
end
