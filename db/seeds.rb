# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'destroy flats'

Flat.destroy_all

puts 'create flats'

100.times do
  Flat.create!(
    name: Faker::Superhero.name,
    address: Faker::Address.full_address,
    description: Faker::Quote.yoda,
    price_per_night: (60..500).to_a.sample,
    number_of_beds: (2..10).to_a.sample,
    number_of_guests: (2..12).to_a.sample,
    area: (25..200).to_a.sample
  )
end

puts 'flats created'
