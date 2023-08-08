require './app'

# class options
class Options
  def initialize
    @app = App.new(self)

    puts
    puts 'WELCOME TO THE SCHOOL LIBRARY APP'
    show_menu
  end

  def show_menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_choice = gets.chomp || "none"
    select_option(user_choice)
  end

  def select_option(user_choice)
    options = {
      '1' => :list_all_books, '2' => :list_all_people, '3' => :create_person,
      '4' => :create_book, '5' => :create_rental, '6' => :list_all_rentals, '7' => :exit
    }
    method = options[user_choice]
    if method.nil?
      show_menu
    else
      @app.send(method)
    end
  end
end

def main
  Options.new
end

main
