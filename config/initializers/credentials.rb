path_prefix = Rails.root.join("config", "credentials")
path_prefix_string = path_prefix.to_s

CREDENTIALS = {}

Dir[path_prefix.join("**/*.yml")].each do |path|
  credential_path = path.gsub(path_prefix_string, "").gsub(".yml", "").split("/").select { |s| !s.blank? }
  last_index = credential_path.size - 1
  
  result_hash = CREDENTIALS
  
  credential_path.each_with_index do |c, index|
    key = c.to_sym
    
    result_hash = result_hash[key] ||= {}
    result_hash.merge!(YAML.load(File.read(path)).fetch(Rails.env, {})) if index == last_index
  end
end
