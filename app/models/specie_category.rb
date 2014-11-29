# == Schema Information
#
# Table name: specie_categories
#
#  id          :integer          not null, primary key
#  specie_id   :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SpecieCategory < ActiveRecord::Base
  belongs_to :specie
  belongs_to :category
end
