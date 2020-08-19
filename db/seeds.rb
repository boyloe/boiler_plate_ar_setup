require 'rest-client'
require 'json'
require 'pry'

# User.destroy_all
# Recipe.destroy_all
# UserRecipe.destroy_all
protein = 'chicken'
flavor = 'lemon'
seasoning = nil
cuisine_type = 'fried'

#response = RestClient.get("https://api.edamam.com/search?q=beef&app_id=321076cb&app_key=6dd56cb4f4320dffe50f4b2fcaf529bd&from=0&to=5")
response = RestClient.get("recipepuppy.com/api/?i=#{protein},#{flavor},#{seasoning}")

data = JSON.parse(response)
#use enumerables to map through data to find what you want to get
#in the map, you can call the .create method and save to database
#Character.create

User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all

bryan = User.create(username: 'Bryan')
bradley = User.create(username: 'Bradley')

teryaki_beef = Recipe.create(name: "Beef Teryaki Recipe", ingredients: "beef, mirin, chicken broth, soy, sauce, teriyaki sauce, sugar, cornstarch, water")
grilled_italian_chicken = Recipe.create(name: "Grilled Italian Chicken Breasts", ingredients: "garlic, bread crumbs, chicken, butter")

UserRecipe.create(username: bradley , recipe: teryaki_beef)
UserRecipe.create(username: bryan , recipe: teryaki_beef)
UserRecipe.create(username: bryan , recipe: grilled_italian_chicken)


binding.pry

