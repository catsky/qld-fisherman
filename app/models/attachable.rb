# == Schema Information
#
# Table name: attachables
#
#  id                :integer          not null, primary key
#  attachable_type   :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  title             :string(255)
#  file_processing   :boolean
#  file_fingerprint  :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  attachable_id     :integer
#

class Attachable < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  
  has_attached_file :file, CREDENTIALS[:paperclip]
  do_not_validate_attachment_file_type :fil
  
end
