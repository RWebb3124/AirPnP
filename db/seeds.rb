# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.destroy_all
Pool.destroy_all

20.times do
  new_user = User.create!(
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "Password1234",
      owner: false
    }
  )
  new_pool = Pool.create(
    {
      title: Faker::Address.street_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      address: Faker::Address.full_address,
      price: rand(1.00..1_999.99).round(2),
      capacity: rand(1..20)
    }
  )
  new_pool.user = new_user
  new_pool.save
end
