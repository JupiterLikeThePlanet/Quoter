################# RESOURCES #####################
#This must be seeded in order for app to work
#################################################
Resource.create(name: "Quote of the Day", link: "http://quotes.rest/qod.json", access: "quote['contents']['quotes'][0]['quote']")

Resource.create(name: "Yo Mamma", link: "http://api.yomomma.info/", access: "quote['joke']")

Resource.create(name: "Chuck Norris", link: "http://api.icndb.com/jokes/random?exclude=Array", access: "quote['value']['joke']")

#################################################
#if you'd like to seed fake data for your own testing, use the below template to do so
#################################################

# 10.times do
#   User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
# end

# 5.times do
#   Contact.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, number: Faker::Number.number(10), user_id: rand(1..11))
# end

# 10.times do
#   Message.create(user_id: rand(1..11), contact_id: rand(1..102), message: Faker::Lorem.sentence)
#end
#User.create(first_name: "Shelly", last_name: "Cat", email: "mail@gmail.com", password: "test1234")

#################################################
# Add your own specific user with contacts linked to it
#################################################
# User.create(first_name: "", last_name: "", email: "", password: "test1234")
# # User.create(first_name: "", last_name: "", email: "", password: "")
# Contact.create(first_name: "", last_name: "", number: "", user_id: 11)
# Contact.create(first_name: "", last_name: "", number: "", user_id: 11)

# Contact.create(first_name: "", last_name: "", number: "", user_id: 11)



