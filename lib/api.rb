#make calls to our api

#below will guide our attributes in our drink class and will be used at attr_accesors in drink class
#id => "idDrink"
#name =>  "strDrink"
#instructions => "strInstructions"
#glass => "strGlass"
#category => "strCategory"

class API
  def self.fetch_drinks
      url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=martini"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      hash = JSON.parse(response) 
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
      end
  end
end
