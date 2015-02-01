# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_test_data
  # seed login user
  puts '=> seed login user...'
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
  
  puts '=> seed Species...'
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
  Location.delete_all
  puts '=> seed Location...'
  locations = [
    {
      suburb: 'Bald Hills', 
      park_name: 'Tinchi Tamba Wetlands', 
      address: 'Wyampa Road, Bald Hills',
      popular_species: 'Bream, Blue swimmer and mud crabs'
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
      address: 'Lytton Road, Morningside',
      popular_species: 'Blue Swimmer, Mub crabs'
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
    {
      suburb: 'Beenleigh', 
      park_name: 'Logan River Parklands', 
      address: 'Logan River Parklands, Blackbird St',
      popular_species: 'Catfish, Mud crabs'
    },
    {
      suburb: 'Brunswick Heads', 
      park_name: 'Torakina Park', 
      address: 'Torakina Park, Brunswick Heads',
      popular_species: 'Big Bream; Blue swimmer and mud crabs(in river)'
    },
    {
      suburb: 'Wivenhoe Pocket', 
      park_name: 'Lake Wivenhoe Information Center', 
      address: 'The Spillway Common Lookout',
      popular_species: 'Australian Bass, Catfish, Yellowbelly, Silver Perch, Saratoga & Mary River Cod.'
    },
    {
      suburb: 'Great Sandy Strait, QLD 4655', 
      park_name: 'Urangan Pier 800m long Jetty', 
      address: 'The Pier, Great Sandy Strait, Harvey Bay',
      popular_species: 'Whiting, bream, flathead, reef fish and pelagics including giant trevally, tuna and mackerel.'
    },
    {
      suburb: 'Redland Bay QLD 4165', 
      park_name: 'Bay Islands Vehicle Ferry', 
      address: '1 Weinam Street Redland Bay QLD 4165',
      popular_species: 'snapper, squire, flathead, whiting (great in winter), bream, tailor and sometimes tuna and mackerel.'
    },
    {
      suburb: 'East Brisane', 
      park_name: 'Near Health Park, East Brisane', 
      address: '184 lytton road east Brisbane QLD 4169',
      popular_species: 'salmon'
    },
  ]
  locations.each do |location|
    Location.create!location
  end
end


puts 'start seeding...'
seed_test_data
seed_fish_platform_locations
puts 'seeding completed'

# DAM
# Bill Gunn Dam, Laidley (Lake Dyer)Bjelke Petersen Dam, MurgonBoondooma Dam, ProstonBorumba Dam, ImbilBurdekin Falls Dam, RavenswoodCallide Dam, BiloelaCania Dam, MontoConnolly Dam, WarwickCooby Dam, ToowoombaCoolmunda Dam, InglewoodCressbrook Dam, ToowoombaEungella Dam, EungellaFairbairn Dam, EmeraldFred Haigh Dam, Gin Gin (Lake Monduran)Glenlyon Dam, StanthorpeGordonbrook Dam, KingaroyIsis Balancing Storage, Bundaberg (Lake Gregory)Kinchant Dam, MackayLake MacDonald Dam, CooroyLenthalls Dam, HowardLeslie Dam, WarwickMaroon Dam, BoonahMoogerah Dam, KalbarNorth Pine Dam, Brisbane (Lake Samsonvale)Peter Faust Dam, ProserpineSomerset Dam, EskStorm King Dam, StanthorpeTeemburra Dam, EungellaTheresa Creek Dam, ClermontTinaroo Falls Dam, AthertonWivenhoe Dam, FernvaleWuruma Dam, Eidsvold
