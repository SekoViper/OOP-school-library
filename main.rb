require './app'
require_relative 'display_options'
require_relative 'preserve_data'
require_relative 'create_book'
require_relative 'create_people'
require_relative 'rental_inputs'

class Main
  include CreateBook
  include CreatePeople
  include RentalInput

  app = App.new
  puts ['Welcome to School Library App!', '']
  CreateBook.load_books
  app.list_books
  CreatePeople.load_people
  app.list_people
  RentalInput.load_rentals

  input = nil
  until input == 7
    display = DisplayOptions.new
    display.display_options
    input = gets.to_i
    puts 'Invalid choice, please select a number from [1..7]' if input < 1 || input > 7
    app.process_input(input, app)
  end

  write_data('books', CreateBook.books)
  write_data('people', CreatePeople.people)
  write_data('rentals', RentalInput.rentals)
end

main = Main.new
main
