json.array!(@moments) do |moment|
  json.extract! moment, :id, :user_id, :message_id, :address_id
  json.url moment_url(moment, format: :json)
end
