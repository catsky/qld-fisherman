# == Schema Information
#
# Table name: moments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Moment < ActiveRecord::Base
  belongs_to :user
  has_many :favourites
  has_many :moment_stars
  has_many :comments
  has_one :message, as: :messagable
  accepts_nested_attributes_for :message
  
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  
  has_many :photos, class_name: "Attachable", as: :attachable
end
