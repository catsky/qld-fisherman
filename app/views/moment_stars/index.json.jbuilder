json.array!(@moment_stars) do |moment_star|
  json.extract! moment_star, :id, :moment_id, :user_id
  json.url moment_star_url(moment_star, format: :json)
end
