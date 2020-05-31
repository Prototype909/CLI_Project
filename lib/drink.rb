 #keep track of drink attributess and save all drinks created

 #id => "idDrink"
#name =>  "strDrink"
#instructions => "strInstructions"
#glass => "strGlass"
#category => "strCategory"

class Drink

  @@all = []

  attr_accessor :id, :name, :instructions, :glass, :category, :ingredients, :measures

  def initialize # lifecycle event because it automatical envoked when you call .new on the class
       @@all << self
  end

  def self.all # this methond
    @@all
  end
 

end
