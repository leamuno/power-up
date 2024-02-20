require 'json'
require 'open-uri'
require 'nokogiri'

Booking.destroy_all
Power.destroy_all
User.destroy_all


users = ["Leo", "Koji", "Noah", "Felix"]
gender = 'male'
age = '22-30'
ethnicity = 'all'
url = "https://this-person-does-not-exist.com/new?gender=#{gender}&age=#{age}&etnic=#{ethnicity}"

users.each do |user|
  user = User.new(email: "#{user}@me.com")
  user.password = "123123"
  user.save

  json = URI.open(url).string
  src = JSON.parse(json)['src']
  photo_url = "https://this-person-does-not-exist.com#{src}"
  file = URI.open(photo_url)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

  4.times do
    power = Power.create!(user: user, name: Faker::Lorem.words(number: 2).join(" "), description: Faker::Lorem.words(number: 10).join(" "), price: rand(1..100), category: Power::CATEGORIES.sample)
    file = URI.open("https://static.wikia.nocookie.net/dragonball/images/e/e7/Goku_DBZ_Ep_31_008.png/revision/latest?cb=20170828193815")
    power.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    power.save
  end

  4.times do
    Booking.create!(user: User.all.sample, power: Power.all.sample, start_date: DateTime.now, end_date: DateTime.now + 1 )
  end
end
