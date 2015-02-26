# == Schema Information
#
# Table name: favourites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  moment_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :moment
end
