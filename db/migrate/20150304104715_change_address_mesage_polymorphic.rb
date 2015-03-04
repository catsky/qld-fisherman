class ChangeAddressMesagePolymorphic < ActiveRecord::Migration
  def change
    add_column :addresses, :addressable_type, :string
    add_column :addresses, :addressable_id, :integer
    add_column :messages, :messagable_type, :string
    add_column :messages, :messagable_id, :integer
    remove_column :moments, :message_id, :integer
    remove_column :moments, :address_id, :integer
  end
end
