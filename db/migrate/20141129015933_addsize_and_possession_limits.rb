class AddsizeAndPossessionLimits < ActiveRecord::Migration
  def change
    add_column :species, :size_and_possession_limits, :string
  end
end
