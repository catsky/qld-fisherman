# == Schema Information
#
# Table name: species_categories
#
#  id          :integer          not null, primary key
#  species_id  :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SpeciesCategory < ActiveRecord::Base
  belongs_to :species
  belongs_to :category
end
