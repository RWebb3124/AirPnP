# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'faker'
Booking.destroy_all
Pool.destroy_all
User.destroy_all


# 20.times do
#   new_user = User.create!(
#     {
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       email: Faker::Internet.email,
#       password: "Password1234",
#       owner: false
#     }
#   )
#   new_pool = Pool.create(
#     {
#       title: Faker::Address.street_name,
#       description: Faker::Lorem.paragraph(sentence_count: 3),
#       address: Faker::Address.full_address,
#       price: rand(1.00..1_999.99).round(2),
#       capacity: rand(1..20)
#     }
#   )
#   new_pool.user = new_user
#   new_pool.save
# end

require "open-uri"

titles = [
  "Backyard Oasis",
  "Luxury Pool with Waterfall",
  "Olympic-Sized Pool",
  "Heated Indoor Pool",
  "Secluded Forest Pool",
  "Rooftop Infinity Pool",
  "Kid-Friendly Pool with Slides",
  "Saltwater Pool",
  "Resort-Style Pool",
  "Eco-Friendly Natural Pool",
  "Pool with Volleyball Net",
  "Private Estate Pool",
  "Infinity Pool with Mountain Views",
  "Lap Pool for Fitness",
  "Pool with Hot Tub",
  "Historical Mansion Pool",
  "Oceanfront Pool",
  "Grotto Pool",
  "Pet-Friendly Pool",
  "Night-Swimming Pool with LED Lights"
]

descriptions = [
  "Dive into tranquility in our beautifully landscaped backyard pool. Perfect for a relaxing day in the sun or a fun-filled family gathering.",
  "Enjoy a luxurious day by our pool, complete with a stunning waterfall feature. Ideal for parties, photoshoots, or a romantic evening swim.",
  "Swim like a pro in our Olympic-sized pool. Great for serious swimmers, training sessions, or large group events.",
  "Escape the elements and enjoy a swim any time of year in our heated indoor pool. Perfect for fitness enthusiasts and families alike.",
  "Immerse yourself in nature with our secluded pool surrounded by lush forest. Ideal for peaceful retreats and nature lovers.",
  "Take in breathtaking city views from our rooftop infinity pool. Perfect for a luxurious escape or a stylish gathering with friends.",
  "Our pool is a kid’s paradise with exciting slides and shallow areas for safe play. Perfect for children’s parties and family fun days.",
  "Experience the gentle touch of saltwater in our pristine pool. Ideal for those with sensitive skin or anyone looking for a unique swimming experience.",
  "Feel like you’re on vacation at our resort-style pool, complete with cabanas, loungers, and a swim-up bar. Perfect for hosting events or a day of relaxation.",
  "Swim in our eco-friendly, chemical-free natural pool, surrounded by beautiful plants and wildlife. Great for eco-conscious swimmers.",
  "Have a blast in our pool equipped with a volleyball net. Ideal for sports enthusiasts and group activities.",
  "Enjoy exclusive access to our private estate pool, surrounded by elegant gardens and luxurious amenities. Perfect for upscale gatherings.",
  "Swim while gazing at stunning mountain views in our infinity pool. Ideal for a serene escape or a picturesque swim.",
  "Stay fit with our dedicated lap pool, perfect for swimmers looking to get in some serious exercise. Great for morning workouts or training sessions.",
  "Relax in our pool and hot tub combo, offering the best of both worlds. Perfect for unwinding after a long day or hosting a small get-together.",
  "Step back in time with a swim in our pool located on a historic mansion’s grounds. Ideal for history buffs and unique experiences.",
  "Enjoy the best of both worlds with our oceanfront pool, offering stunning sea views and the soothing sound of waves. Perfect for beach lovers.",
  "Experience a touch of adventure with our grotto-style pool, featuring hidden caves and waterfalls. Ideal for adventurous swimmers and fun photoshoots.",
  "Bring your furry friend along to our pet-friendly pool. Perfect for dog owners looking to give their pets a fun day out.",
  "Swim under the stars in our pool illuminated with colorful LED lights. Perfect for evening events or a unique night swim."
]

addresses = [
  '10-12 Leicester Square, London WC2H 7NA, United Kingdom',
  '140 Avenue des Champs-Élysées, 75008 Paris, France',
  'Alexanderplatz 3, 10178 Berlin, Germany',
  'Piazza di Spagna, 46, 00187 Rome RM, Italy',
  'Damrak 92, 1012 LP Amsterdam, Netherlands',
  'Gran Vía, 45, 28013 Madrid, Spain',
  'Váci utca 19, 1052 Budapest, Hungary',
  'Kärntnerstraße 19, 1010 Vienna, Austria',
  'Boulevard Anspach 57, 1000 Brussels, Belgium',
  'Sveavägen 53, 113 59 Stockholm, Sweden',
  'Bahnhofplatz 1, 8001 Zurich, Switzerland',
  'Vasagatan 24, 111 20 Stockholm, Sweden',
  'Andrássy út 124, 1062 Budapest, Hungary',
  'Staroměstské nám. 479/25, 110 00 Staré Město, Czech Republic',
  'La Rambla, 124, 08002 Barcelona, Spain',
  'Calle Preciados, 33, 28013 Madrid, Spain',
  'Alexanderplatz 7, 10178 Berlin, Germany',
  '155 Rue du Faubourg Saint-Antoine, 75011 Paris, France',
  'Damrak 80-81, 1012 LN Amsterdam, Netherlands',
  '10-12 Leicester Square, London WC2H 7NA, United Kingdom'
]

email_addresses = [
  "ChloePotter1@gmail.com", "EmmaJohnson2@gmail.com", "OliviaWilliams3@gmail.com",
  "AvaBrown4@gmail.com", "SophiaJones5@gmail.com", "IsabellaGarcia6@gmail.com",
  "MiaMiller7@gmail.com", "AmeliaDavis8@gmail.com", "HarperMartinez9@gmail.com",
  "EvelynHernandez10@gmail.com", "AbigailLopez11@gmail.com", "EllaGonzalez12@gmail.com",
  "ElizabethWilson13@gmail.com", "CamilaAnderson14@gmail.com", "LunaThomas15@gmail.com",
  "ScarlettTaylor16@gmail.com", "SofiaMoore17@gmail.com", "VictoriaJackson18@gmail.com",
  "AriaMartin19@gmail.com", "GraceLee20@gmail.com"
]

first_names = [
  "Chloe", "Emma", "Olivia", "Ava", "Sophia",
  "Isabella", "Mia", "Amelia", "Harper", "Evelyn",
  "Abigail", "Ella", "Elizabeth", "Camila", "Luna",
  "Scarlett", "Sofia", "Victoria", "Aria", "Grace"
]

last_names = [
  "Potter", "Johnson", "Williams", "Brown", "Jones",
  "Garcia", "Miller", "Davis", "Martinez", "Hernandez",
  "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas",
  "Taylor", "Moore", "Jackson", "Martin", "Lee"
]

pool_photo_one = URI.open("https://st.hzcdn.com/simgs/pictures/pools/a-backyard-pool-oasis-gib-san-pool-and-landscape-creations-img~9da152c600f9a7a7_4-8018-1-69013f1.jpg")
new_pool_one = Pool.new(
  {
    title: "Backyard Oasis",
    description: "Dive into tranquility in our beautifully landscaped backyard pool. Perfect for a relaxing day in the sun or a fun-filled family gathering.",
    address: '10-12 Leicester Square, London WC2H 7NA, United Kingdom',
    capacity: 12,
    price: 40.99
  }
)
new_user_one = User.new(
  {
    first_name: 'Hannah',
    last_name: 'Mckay',
    email: 'Hannahmckay1@gmail.com',
    password: 'Password1234'
  }
)
new_pool_one.user = new_user_one
new_pool_one.photo.attach(io: pool_photo_one, filename: "pool0.jpg", content_type: "image/jpg")
new_pool_one.save

pool_photo_two = URI.open("https://www.bluehaven.com/wp-content/gallery/pools-with-waterfalls/rock-waterfall-inground-pool-10.jpg")
new_pool_two = Pool.new(
  {
    title: "Luxury Pool with Waterfall",
    description: "Enjoy a luxurious day by our pool, complete with a stunning waterfall feature. Ideal for parties, photoshoots, or a romantic evening swim.",
    address: '140 Avenue des Champs-Élysées, 75008 Paris, France',
    capacity: 6,
    price: 52.50
  }
)
new_user_two = User.new(
  {
    first_name: 'Joe',
    last_name: 'Kennedy',
    email: 'Joekennedy2@gmail.com',
    password: 'Password1234'
  }
)
new_pool_two.user = new_user_two
new_pool_two.photo.attach(io: pool_photo_two, filename: "pool1.jpg", content_type: "image/jpg")
new_pool_two.save

pool_photo_three = URI.open("https://montco.today/wp-content/uploads/sites/2/2022/12/indoor-pool1-970x550.jpg")
new_pool_three = Pool.new(
  {
    title: "Olympic-Sized Pool",
    description: "Swim like a pro in our Olympic-sized pool. Great for serious swimmers, training sessions, or large group events.",
    address: 'Alexanderplatz 3, 10178 Berlin, Germany',
    capacity: 20,
    price: 95.75
  }
)
new_user_three = User.new(
  {
    first_name: 'Matthew',
    last_name: 'James',
    email: 'Matthewjames3@gmail.com',
    password: 'Password1234'
  }
)
new_pool_three.user = new_user_three
new_pool_three.photo.attach(io: pool_photo_three, filename: "pool2.jpg", content_type: "image/jpg")
new_pool_three.save

pool_photo_four = URI.open("https://www.begreensystems.co.uk/images/services/Swimming%20Pool%20Heating.jpg")
new_pool_four = Pool.new(
  {
    title: "Heated Indoor Pool",
    description: "Escape the elements and enjoy a swim any time of year in our heated indoor pool. Perfect for fitness enthusiasts and families alike.",
    address: 'Piazza di Spagna, 46, 00187 Rome RM, Italy',
    capacity: 8,
    price: 65.20
  }
)
new_user_four = User.new(
  {
    first_name: 'Chloe',
    last_name: 'Potter',
    email: 'Chloepotter4@gmail.com',
    password: 'Password1234'
  }
)
new_pool_four.user = new_user_four
new_pool_four.photo.attach(io: pool_photo_four, filename: "pool3.jpg", content_type: "image/jpg")
new_pool_four.save

pool_photo_five = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/03/c3/14/b8/swimming-pool-with-forest.jpg")
new_pool_five = Pool.new(
  {
    title: titles[4],
    description: descriptions[4],
    address: addresses[4],
    capacity: rand(1..20),
    price: 82.10
  }
)
new_user_five = User.new(
  {
    first_name: first_names[4],
    last_name: last_names[4],
    email: email_addresses[4],
    password: 'Password1234'
  }
)
new_pool_five.user = new_user_five
new_pool_five.photo.attach(io: pool_photo_five, filename: "pool4.jpg", content_type: "image/jpg")
new_pool_five.save

pool_photo_six = URI.open("https://i2-prod.nottinghampost.com/incoming/article1581914.ece/ALTERNATES/s615b/LPR_TEM_180518infinity_03.jpg")
new_pool_six = Pool.new(
  {
    title: titles[5],
    description: descriptions[5],
    address: addresses[5],
    capacity: rand(1..20),
    price: 24.00
  }
)
new_user_six = User.new(
  {
    first_name: first_names[5],
    last_name: last_names[5],
    email: email_addresses[5],
    password: 'Password1234'
  }
)
new_pool_six.user = new_user_six
new_pool_six.photo.attach(io: pool_photo_six, filename: "pool5.jpg", content_type: "image/jpg")
new_pool_six.save

pool_photo_seven = URI.open("https://res.dayoutwiththekids.co.uk/image/upload/v1594048622/attractions/t/the-alton-towers-waterpark-c8f24bb9/35496-the-alton-towers-waterpark-alton-05.jpg")
new_pool_seven = Pool.new(
  {
    title: titles[6],
    description: descriptions[6],
    address: addresses[6],
    capacity: rand(1..20),
    price: 164.52
  }
)
new_user_seven = User.new(
  {
    first_name: first_names[6],
    last_name: last_names[6],
    email: email_addresses[6],
    password: 'Password1234'
  }
)
new_pool_seven.user = new_user_seven
new_pool_seven.photo.attach(io: pool_photo_seven, filename: "pool6.jpg", content_type: "image/jpg")
new_pool_seven.save

pool_photo_eight = URI.open("https://poolcraft.ca/wp-content/uploads/2018/06/saltwater-swimming-pools.jpg")
new_pool_eight = Pool.new(
  {
    title: titles[7],
    description: descriptions[7],
    address: addresses[7],
    capacity: rand(1..20),
    price: 104.23
  }
)
new_user_eight = User.new(
  {
    first_name: first_names[7],
    last_name: last_names[7],
    email: email_addresses[7],
    password: 'Password1234'
  }
)
new_pool_eight.user = new_user_eight
new_pool_eight.photo.attach(io: pool_photo_eight, filename: "pool7.jpg", content_type: "image/jpg")
new_pool_eight.save

pool_photo_nine = URI.open("https://st.hzcdn.com/simgs/pictures/pools/infinity-edge-freeform-backyard-resort-style-pool-in-parkland-florida-van-kirk-and-sons-pools-and-spas-img~8551c7610d7aa506_4-3777-1-bbc46c2.jpg")
new_pool_nine = Pool.new(
  {
    title: titles[8],
    description: descriptions[8],
    address: addresses[8],
    capacity: rand(1..20),
    price: 25.22
  }
)
new_user_nine = User.new(
  {
    first_name: first_names[8],
    last_name: last_names[8],
    email: email_addresses[8],
    password: 'Password1234'
  }
)
new_pool_nine.user = new_user_nine
new_pool_nine.photo.attach(io: pool_photo_nine, filename: "pool8.jpg", content_type: "image/jpg")
new_pool_nine.save

pool_photo_ten = URI.open("https://www.fluidra.com/projects//web/app/uploads/2021/08/piscinas-ecologicas.jpg")
new_pool_ten = Pool.new(
  {
    title: titles[9],
    description: descriptions[9],
    address: addresses[9],
    capacity: rand(1..20),
    price: 188.44
  }
)
new_user_ten = User.new(
  {
    first_name: first_names[9],
    last_name: last_names[9],
    email: email_addresses[9],
    password: 'Password1234'
  }
)
new_pool_ten.user = new_user_ten
new_pool_ten.photo.attach(io: pool_photo_ten, filename: "pool9.jpg", content_type: "image/jpg")
new_pool_ten.save
