# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Phone < ActiveRecord::Base
end
