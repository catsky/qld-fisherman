# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  content         :text
#  created_at      :datetime
#  updated_at      :datetime
#  messagable_type :string(255)
#  messagable_id   :integer
#

class Message < ActiveRecord::Base
  belongs_to :messagable, polymorphic: true
end
