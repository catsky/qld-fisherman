# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_test_data
  # seed login user
  if User.find_by(email: "web@kvl.com.au").nil?
    @user = User.create!({
      email: "web@kvl.com.au", 
      password: "password1234", 
      password_confirmation: "password1234"
    })
  end
  
  # seed specie data
  seed_species_data
end

def seed_species_data
  Specie.delete_all
  SpecieImage.delete_all
  
  Dir.glob("res/*.json").each do |file_path|
    puts "xxxxxxxx loading data from #{file_path}"
    seed_specie_data file_path
  end
end

def seed_specie_data file_path
  YAML.load(File.read(file_path)).each do |specie_data|
    next if !specie_data.respond_to?'has_key?'
    desc = specie_data["descriptions"] if specie_data.has_key? "descriptions"
    specie = Specie.create!({
        name: specie_data["name"],
        source_url: specie_data["source_url"],
        description: (desc["Description"] && desc["Description"].join('|') if desc.has_key? "Description"),
        distribution: (desc["Distribution"] && desc["Distribution"].join('|') if desc.has_key? "Distribution"),
        frequent_misidentifications: (desc["Frequent misidentifications"] && desc["Frequent misidentifications"].join('|') if desc.has_key? "Frequent misidentifications"), 
        scientific_name: (desc["Scientific name"] && desc["Scientific name"].join('|') if desc.has_key? "Scientific name"),
        size_and_bag_limits: (desc["Size and bag limits"] && desc["Size and bag limits"].join('|') if desc.has_key? "Size and bag limits")
      })
    
    specie_data["image_url"].each do |image|
      SpecieImage.find_or_create_by!(image_url: image, specie_id: specie.id)
    end

  end
end




seed_test_data
