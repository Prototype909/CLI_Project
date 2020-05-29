#make calls to our api

#below will guide our attributes in our drink class and will be used at attr_accesors in drink class
#id => "idDrink"
#name =>  "strDrink"
#instructions => "strInstructions"
#glass => "strGlass"
#category => "strCategory"

class API
  def self.build_ingredients_array(drink_hash)
    ingredients = Array.new(14) #update this later to dynamicly detect amount of ingredients
    ingredients.length.times do |i|
      if drink_hash["strIngredient" + i.to_s] != nil
       ingredients[i] = drink_hash["strIngredient" + i.to_s]
      end
    end
    return ingredients
  end
  def self.build_measure_array(drink_hash)
    measures = Array.new(14) #update this later to dynamicly detect amount of ingredients
    measures.length.times do |i|
      if drink_hash["strMeasure" + i.to_s] != nil
       measures[i] = drink_hash["strMeasure" + i.to_s]
      end
    end
    return measures
  end
  
  def self.fetch_drinks(search_value)
      url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=" + search_value
      uri = URI(url)
      response = Net::HTTP.get(uri)
      hash = JSON.parse(response) #turns it into a ruby hash
      array_of_drinks = hash["drinks"]
      
      array_of_drinks.each do |drink_hash|
        #initialize a new drink
        drink_instance = Drink.new
        #assign attributes to it, used the writer
        drink_instance.id = drink_hash["idDrink"]
        drink_instance.name = drink_hash["strDrink"]
        drink_instance.instructions = drink_hash["strInstructions"]
        drink_instance.glass = drink_hash["strGlass"]
        drink_instance.category = drink_hash["strCategory"]
        drink_instance.ingredients = build_ingredients_array(drink_hash)
        drink_instance.measures = build_measure_array(drink_hash)
        end
    end
end
