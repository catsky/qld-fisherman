# == Schema Information
#
# Table name: moment_stars
#
#  id         :integer          not null, primary key
#  moment_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class MomentStar < ActiveRecord::Base
  belong_to :user
  belong_to :moment
end
