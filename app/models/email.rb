# == Schema Information
#
# Table name: emails
#
#  id            :integer          not null, primary key
#  email_address :string(255)
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Email < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
end
