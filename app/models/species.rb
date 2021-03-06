# == Schema Information
#
# Table name: species
#
#  id                          :integer          not null, primary key
#  name                        :string(255)
#  description                 :string(255)
#  distribution                :string(255)
#  frequent_misidentifications :string(255)
#  scientific_name             :string(255)
#  size_and_bag_limits         :string(255)
#  size                        :string(255)
#  source_url                  :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  size_and_possession_limits  :string(255)
#  descriptions                :text
#

class Species < ActiveRecord::Base
  has_many :species_images
  has_many :species_categories
  has_many :categories, through: :species_categories
end
