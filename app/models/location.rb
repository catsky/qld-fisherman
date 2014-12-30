# == Schema Information
#
# Table name: locations
#
#  id              :integer          not null, primary key
#  address         :string(255)
#  latitude        :float
#  longitude       :float
#  created_at      :datetime
#  updated_at      :datetime
#  suburb          :string(255)
#  park_name       :string(255)
#  comments        :text
#  popular_species :text
#

class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
end
