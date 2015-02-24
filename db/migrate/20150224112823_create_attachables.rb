class CreateAttachables < ActiveRecord::Migration
  def change
    create_table :attachables do |t|
      t.string :attachable_type
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.string :title
      t.boolean :file_processing
      t.string :file_fingerprint

      t.timestamps
    end
  end
end
