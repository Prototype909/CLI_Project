#interact with the user
#include any puts or gets statements
#control the flow of our program

class CLI

  def start
    puts "Welcome to the Tipsie Bartender!"
    API.fetch_drinks
    self.menu
  end

  def menu
    puts "Would you like to see a list of drinks?"
    puts "Type 'yes' to continue or any other key to exit."
    user_input = gets.strip.downcase
    if user_input == "yes" || user_input == "y"
      puts "Good Choice, let's get Tipsie! Please select a drink!"
      display_list_of_drinks
      ask_user_for_drink_choice
      sleep(2)
      menu
    else
      #end the program
      puts "Goodbye!"
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
      index = gets.strip.to_i - 1\
    end
    #found their drink choice
    drink_instance = Drink.all[index]
    #call the method that will print out their choice
    display_drink_details(drink_instance)
  end

  def display_drink_details(drink)
    puts "\n"
    puts drink.name
    puts "\nCategory:" + drink.category
    puts "\nGlass:" + drink.glass 
    puts "\nInstruction:" + drink.instructions
  end
end
