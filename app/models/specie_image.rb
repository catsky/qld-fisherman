# == Schema Information
#
# Table name: specie_images
#
#  id         :integer          not null, primary key
#  image_url  :string(255)
#  specie_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class SpecieImage < ActiveRecord::Base
  belongs_to :specie
end
