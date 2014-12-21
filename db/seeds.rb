# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_test_data
  # seed login user
  if User.find_by(email: 'web@kvl.com.au').nil?
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
  Species.delete_all
  SpeciesImage.delete_all
  SpeciesCategory.delete_all
  Category.delete_all
  
  Dir.glob("res/*.json").each do |file_path|
    puts "xxxxxxxx loading data from #{file_path}"
    seed_specie_data file_path
  end
end

def seed_specie_data file_path
  YAML.load(File.read(file_path)).each do |specie_data|
    next if !specie_data.respond_to?'has_key?'
    
    category = get_category file_path
    
    desc = specie_data["descriptions"] if specie_data.has_key? "descriptions"
    specie = Species.create!({
        name: specie_data["name"],
        source_url: specie_data["source_url"],
        descriptions: desc.to_s,
        categories: [category]

        # description: (desc["Description"] && desc["Description"].join("<br>") if desc.has_key? "Description"),
        # distribution: (desc["Distribution"] && desc["Distribution"].join("<br>") if desc.has_key? "Distribution"),
        # frequent_misidentifications: (desc["Frequent misidentifications"] && desc["Frequent misidentifications"].join("<br>") if desc.has_key? "Frequent misidentifications"),
        # scientific_name: (desc["Scientific name"] && desc["Scientific name"].join("<br>") if desc.has_key? "Scientific name"),
        # size_and_bag_limits: (desc["Size and bag limits"] && desc["Size and bag limits"].join("<br>") if desc.has_key? "Size and bag limits"),
        # size_and_possession_limits: (desc["Size and possession limits"] && desc["Size and possession limits"].join("<br>") if desc.has_key? "Size and possession limits"),
        # size: (desc["Size"] && desc["Size"].join("<br>") if desc.has_key? "Size")

      })

    specie_data["image_url"].each do |image|
      SpeciesImage.find_or_create_by!(image_url: image, species_id: specie.id)
    end
    
  end
end

def get_category file_path
  if /freshwater/ =~ file_path
    c = Category.find_or_create_by!(name: 'freshwater')
  elsif /inshore-estuarine/ =~ file_path
    c = Category.find_or_create_by!(name: 'inshore-estuarine')
  elsif /reef-fish/ =~ file_path
    c = Category.find_or_create_by!(name: 'reef')
  elsif /shark/ =~ file_path
    c = Category.find_or_create_by!(name: 'shark')
  end
end

def seed_fish_platform_locations
  locations = [
    {
      suburb: 'Bald Hills', 
      park_name: 'Tinchi Tamba Wetlands', 
      address: 'Wyampa Road, Bald Hills'
    },
    {
      suburb: 'Hamilton', 
      park_name: 'Cameron Rocks Reserve', 
      address: 'Kingsford Smith Drive, Hamilton'
    },
    {
      suburb: 'Karana Downs', 
      park_name: 'Kookaburra Park - West', 
      address: 'Caringal Drive, Karana Downs'
    },
    {
      suburb: "Morningside", 
      park_name: 'Colmslie Recreatio Reserve', 
      address: 'Lytton Road, Morningside'
    },
    {
      suburb: 'Nudgee Beach', 
      park_name: 'Tuckeroo Park', 
      address: 'Nudgee Road, Nudgee Beach'
    },
    {
      suburb: 'Ransome', 
      park_name: 'Chelsea Road Park (nos. 399-551)', 
      address: '399 Chelsea Road, Ransome',
      comments: 'north of Rickett Road Bridge'
    },
    {
      suburb: 'Sandgate', 
      park_name: 'Sandgate Foreshores Park', 
      address: 'Flinders Parade, Sandgate'
    },
  ]
  locations.each do |location|
    Location.create!location
  end
end



seed_test_data
seed_fish_platform_locations