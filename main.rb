require_relative 'app'

class Main
  def options
    puts 'Please choose an option by entering a member: '
    puts '1. ~ List all books.'
    puts '2. ~ List all people.'
    puts '3. ~ Create a people.'
    puts '4. ~ Create a book.'
    puts '5. ~ Create a rental.'
    puts '6. ~ List all rentals for a given person id.'
    puts '7. ~ Exit'
  end

  def execute_app
    app = App.new
    puts 'Welcome to School Liabrary App!'

    loop do
      options
      option = gets.chomp

      break if option == '7'

      app.select(option)
    end
  end
end

def main
  execute_main = Main.new
  execute_main.execute_app
end

main
