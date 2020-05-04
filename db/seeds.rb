# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



# Listing.destroy_all
# Reservation.destroy_all
#
City.destroy_all
10.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: rand(10000..95801)
  )
end

User.destroy_all
20.times do
  user = User.create!(
    email: Faker::Internet.email,
    phone_number: "06" + "#{rand(12345678..87654321)}",
    description: Faker::Lorem.paragraph_by_chars(number: 141, supplemental: false)
  )
end

50.times do
  listing = Listing.create!(
    available_beds: rand(1..4),
    price: rand(30..80),
    description: Faker::Lorem.paragraph_by_chars(number: 141, supplemental: false),
    has_wifi: [true, false].sample,
    welcome_message: "Welcome !",
    city: City.all.sample,
    user: User.all.sample
  )
end

5.times do
  start_date = Faker::Time.between_dates(from: Date.today - 60, to: Date.today, period: :day)
  reservation = Reservation.create(
    start_date: start_date,
    end_date: Faker::Time.between_dates(from: start_date, to: start_date + 10, period: :day),
    listing: Listing.all.sample,
    host: User.all.sample,
    guest: User.all.sample
  )
end

5.times do
  start_date = Faker::Time.between_dates(from: Date.today, to: Date.today + 90, period: :day)
  reservation = Reservation.create(
    start_date: start_date,
    end_date: Faker::Time.between_dates(from: start_date, to: start_date + 10, period: :day),
    listing: Listing.all.sample,
    host: User.all.sample,
    guest: User.all.sample
  )
end