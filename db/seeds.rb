# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'faker'

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

5.times do
  Contact.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, number: Faker::Number.number(10), user_id: rand(1..11))
end

# 10.times do
#   Message.create(user_id: rand(1..11), contact_id: rand(1..102), message: Faker::Lorem.sentence)
#end
#User.create(first_name: "Shelly", last_name: "Cat", email: "mail@gmail.com", password: "test1234")

User.create(first_name: "Jupiter", last_name: "Baudot", email: "jupiterthecynic@gmail.com", password: "test1234")
# User.create(first_name: "", last_name: "", email: "", password: "")
Contact.create(first_name: "Imraan", last_name: "Ismail", number: "5045643032", user_id: 11)
Contact.create(first_name: "S", last_name: "A", number: "6472029000", user_id: 11)

Contact.create(first_name: "J", last_name: "B", number: "9857885503", user_id: 11)
##################################################


Resource.create(name: "Quote of the Day", link: "http://quotes.rest/qod.json", access: "quote['contents']['quotes'][0]['quote']")
# quote['content'][quotes][quote]
#, "author['content'][quotes][author]"
#################################################

