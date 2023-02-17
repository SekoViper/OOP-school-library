require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List all books'
    @books.each do |book|
      puts "ID: #{book.id} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts 'List all people'
    @people.each do |person|
      puts "ID: #{person.id}, #{person.name}"
    end
  end

  # create preson
  def create_person
    puts 'What kind of person do you want to create? (for student type 1 and for teacher type 2)'
    person_type = gets.chomp.to_i

    puts "What is the person's name?"
    name = gets.chomp

    case person_type
    when 1
      puts "What's the student's grade level?"
      grade_level = gets.chomp.to_i

      person = Student.new(name, grade_level)

    when 2
      puts "what's the teacher's specialization?"
      specialization = gets.chomp

      person = Teacher.new(name, specialization)

    else
      puts 'Invalid person'
      return
    end

    @people << person
    puts "Created person with #{person.id}"
  end

  def create_book
    puts 'What is the book title?'
    book_title = gets.chomp

    puts 'who is the author of the book?'
    book_author = gets.chomp

    book = Book.new(book_title, book_author)

    @books << book
    puts "Created book with ID: #{book.id}"
  end

  def create_rental
    puts 'What is the ID of the person who is renting the book'
    person_id = gets.chomp.to_i
    person = @people.find { |person1| person1.id == person_id }

    if person.nil
      puts "Could not find person with ID: #{person_id}"
      return
    end

    puts 'what is the ID of the book being rented?'
    book_id = gets.chomp.to_i
    book = @books.find { |book1| book1.id == book_id }

    if book.nil
      puts "Could not find book with ID: #{book_id}"
      return
    end

    puts 'When the book was rented'
    date = gets.chomp

    book_rented = Rental.new(date, book, person)

    @rentals << book_rented
    puts "Rented book with ID: #{book_id} to person with ID: #{person_id} on #{date}"
  end

  def list_rental
    puts 'What is the ID of the person?'
    person_id = gets.chomp.to_i

    puts 'Please enter a valid person ID' if list_rentals.nil?

    list_rentals = @rentals.find { |rental1| rental1.person.id === person_id }

    puts "Person with ID: #{person_id} have rented: "
    list_rentals.each { |rental| puts "#{rental.book.title} " }
  end
end
