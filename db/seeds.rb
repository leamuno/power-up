# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end]
Booking.destroy_all
Power.destroy_all
User.destroy_all


users = ["Leo", "Koji", "Noah", "Felix"]

users.each do |user|
  user = User.new(email: "#{user}@me.com")
  user.password = "123123"
  user.save

  4.times do
    Power.create!(user: user, name: Faker::Lorem.words(number: 2).join(" "), description: Faker::Lorem.words(number: 10).join(" "), price: rand(1..100), category: Power::CATEGORIES.sample)
  end

  4.times do
    Booking.create!(user: User.all.sample, power: Power.all.sample, start_date: DateTime.now, end_date: DateTime.now + 1 )
  end
end
