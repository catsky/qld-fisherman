# == Schema Information
#
# Table name: moments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message_id :integer
#  address_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Moment < ActiveRecord::Base
  belongs_to :user
  has_many :favourites
  has_many :moment_stars
  has_many :comments
  has_one :message
  has_one :address, as: :addressable
  has_many :photos, as: :attachable
end
