#interact with the user
#include any puts or gets statements
#control the flow of our program

class CLI

  def start
    puts "Welcome to the Tipsie Bartender!"
    
    self.menu
  end

  

  def menu #instance method - and objects ability to have logic
    Logo.logo
    puts "Would you like to see a list of drinks?"
    puts "Type 'yes' to continue or any other key to exit."
    user_input = gets.strip.downcase
    if user_input == "yes" || user_input == "y"
      puts "Woo Hoo, let's get Tipsy! Please select the first letter of your drink choice!"
      user_input = gets.strip.downcase
      API.fetch_drinks(user_input) # moved this here so i could input a serach character
      
      display_list_of_drinks
      ask_user_for_drink_choice
      sleep(2)
      menu
    else
      #end the program
      puts "Thanks for using the Tipsy Bartender!"
    end
  end

  def display_list_of_drinks
    # i need to access all the drinks
    # i need to print each drink out
    Drink.all.each.with_index(1) do |drink, index|
      puts "#{index}. #{drink.name}"
    end
  end

  def ask_user_for_drink_choice
    #asked user for choice
    index = gets.strip.to_i - 1
    #validate their input
    max_limit = Drink.all.length - 1
    until index.between?(0,max_limit)
      puts "sorry, that is an invalid choice. Please choose again."
      index = gets.strip.to_i - 1
    end
    #found their drink choice
    drink_instance = Drink.all[index]
    #call the method that will print out their choice
    display_drink_details(drink_instance)
  end

  def display_drink_details(drink)
    puts "\n"
    puts drink.name
    puts "\nCategory: " + drink.category
    puts "\nGlass: " + drink.glass 
    drink.ingredients.length.times do |i|
      if drink.ingredients[i] != nil
        measureAmount = ""
        if drink.measures[i] != nil
          measureAmount = drink.measures[i]
        end
        puts "\nIngredient #{i.to_s} -- #{measureAmount} #{drink.ingredients[i]}"
      end
    end
    puts "\nInstructions: " + drink.instructions
  end
end
