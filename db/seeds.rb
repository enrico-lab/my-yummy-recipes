# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'
require 'rest-client'

Dish.destroy_all
User.destroy_all


url = 'https://source.unsplash.com/500x500/?face'
url_dishes = 'https://source.unsplash.com/700x700/?dish'

puts 'Creating 10 users'
s_count = 1
10.times do
  file = URI.open(url)
  user = User.new(
    email: "user#{s_count}@email.com",
    password: "123456",
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    username: "#{Faker::Games::Heroes.name}",
    address: "#{Faker::Address.full_address}",
  )
  user.photo.attach(io: file, filename: "user#{s_count}.png", content_type: 'image/png')
  s_count += 1
  user.save
end
puts 'Finished!'


puts 'Creating 4 dishes for each user'
c_count = 0
types = ["Carbonara", "Lasagna", "Guacamole", "Hummus", "Fagioli", "Beef Wellington", "Pudding", "Arrosto"]
descriptions = ["buono"]
User.all.each do |user|
  1.times do
    file_dishes = URI.open(url_dishes)
    dish = Dish.new(
      name: "#{types.sample}",
      description: "#{descriptions.sample}",
    )
    dish.photo.attach(io: file_dishes, filename: "dish#{c_count}.png", content_type: 'image/png')
    c_count += 1
    dish.user = user
    dish.save
  end
end
puts 'Finished!'

# #ingredient seed
# api_key = "2e6305efe3a943eab995a723f50144c3"

# p "Creating Ingredients seeds"
# url = "https://api.spoonacular.com/food/ingredients/autocomplete?query=lemon&number=10&apiKey=#{api_key}"



# request = RestClient::Request.execute(
#    :method => :get,
#    :url => url,
#    :headers => {"key" => api_key}
# )

#ingredient seed
api_key = "2e6305efe3a943eab995a723f50144c3"
query = "banana"
url = "https://api.spoonacular.com/recipes/complexSearch?query=#{query}&maxFat=25&number=2&apiKey=#{api_key}"
response = RestClient.get(url, { content_type: :json, accept: :json })
parsed_response = JSON.parse(response.body)
p parsed_response


p request




