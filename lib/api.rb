#make calls to our api

class API
  def self.fetch_drinks
    API.fetch_drinks
      url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=vodka"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      binding.pry
  end
end
