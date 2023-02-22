require './app'
require_relative 'display_options'

def main
  app = App.new
  puts ['Welcome to School Library App!', '']
  input = nil
  until input == 7
    display = DisplayOptions.new
    display.display_options
    input = gets.to_i
    puts 'Invalid choice, please select a number from [1..7]' if input < 1 || input > 7
    app.process_input(input, app)
  end
end

main
