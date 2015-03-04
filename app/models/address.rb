# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  type             :string(255)
#  street           :string(255)
#  park             :string(255)
#  postcode         :string(255)
#  suburb           :string(255)
#  state            :string(255)
#  country          :string(255)
#  visible          :boolean
#  latitude         :float
#  longitude        :float
#  created_at       :datetime
#  updated_at       :datetime
#  addressable_type :string(255)
#  addressable_id   :integer
#

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
end
