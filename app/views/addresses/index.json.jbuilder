json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :park, :postcode, :suburb, :state, :country, :visible, :latitude, :longitude
  json.url address_url(address, format: :json)
end
