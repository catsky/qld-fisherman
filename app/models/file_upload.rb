# == Schema Information
#
# Table name: file_uploads
#
#  id                      :integer          not null, primary key
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  file_upload_batch_id    :integer
#  type                    :string(255)
#  status                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  media_type              :string(255)
#

class FileUpload < ActiveRecord::Base
  has_attached_file :attachment, CREDENTIALS[:paperclip]
  do_not_validate_attachment_file_type :attachment
end
