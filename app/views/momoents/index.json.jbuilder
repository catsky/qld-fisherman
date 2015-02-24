json.array!(@momoents) do |momoent|
  json.extract! momoent, :id, :user_id, :message_id, :address_id
  json.url momoent_url(momoent, format: :json)
end
