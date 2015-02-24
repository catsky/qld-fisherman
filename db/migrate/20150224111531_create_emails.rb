class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_address
      t.integer :user_id

      t.timestamps
    end
  end
end
