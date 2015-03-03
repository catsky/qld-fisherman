class AddAttachableId < ActiveRecord::Migration
  def change
    add_column :attachables, :attachable_id, :integer
  end
end
