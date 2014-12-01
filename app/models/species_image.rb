# == Schema Information
#
# Table name: species_images
#
#  id         :integer          not null, primary key
#  image_url  :string(255)
#  species_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class SpeciesImage < ActiveRecord::Base
  belongs_to :species
end
