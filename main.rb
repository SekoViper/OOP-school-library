require './app'

def handle_create_person_display_text
  print 'Do you want to create a student (1) or a teacher (2)? '
  print '[Input the number]: '
end

def display_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List rentals for a given person id'
  puts '7 - Exit'
end

def process_person_choice(choice, app)
  case choice
  when 1
    app.handle_student_input
  when 2
    app.handle_teacher_input
  else
    puts 'Invalid choice, please select a number from [1..2]'
    choice = gets.to_i
    process_person_choice(choice, app)
  end
end

def process_input(input, app)
  case input
  when 1
    app.list_books
  when 2
    app.list_people
  when 3

    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rental
  end
end

def main
  app = App.new
  puts ['Welcome to School Library App!', '']
  input = nil
  until input == 7
    display_options
    input = gets.to_i
    puts 'Invalid choice, please select a number from [1..7]' if input < 1 || input > 7
    process_input(input, app)
  end
end

main