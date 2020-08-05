require 'json'
require 'open-uri'

puts "Clean DB"

Dose.destroy_all
Review.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "Create Ingredient"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)
ingredients['drinks'].each do |ingredient|
  Ingredient.create!(
    name: ingredient["strIngredient1"]
  )
end

puts "Create Cocktail"

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktail_ids_serialized = open(url).read
cocktails = JSON.parse(cocktail_ids_serialized)
cocktails["drinks"].take(10).each do |cocktail|
  element = Cocktail.create!(
    name: cocktail["strDrink"]
  )
  img = URI.open(cocktail["strDrinkThumb"])
  element.photo.attach(io: handle_string_io_as_file(img, "#{cocktail["strDrink"].gsub('', '_')}.jpg" ), filename: "#{cocktail["strDrink"].gsub('', '_')}.jpg", content_type: 'image/jpg')
end



puts "Seed OK"