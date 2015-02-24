json.array!(@attachables) do |attachable|
  json.extract! attachable, :id, :attachable_type, :file_file_name, :file_content_type, :file_file_size, :file_updated_at, :title, :file_processing, :file_fingerprint
  json.url attachable_url(attachable, format: :json)
end
