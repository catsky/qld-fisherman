json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :user_id
  json.url phone_url(phone, format: :json)
end
